-- [[ LSPs ]]
local servers = {
	gopls = {},
	pyright = {
		settings = {
			python = {
				analysis = {
					autoImportCompletion = true,
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "off",
				},
			},
		},
	},
	rust_analyzer = {},
	html = {},
	graphql = {},
	bashls = {},
	cssls = {},
	jsonls = {},
	lemminx = {},
	ts_ls = {},
	angularls = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
}

-- [[ Add highlights for the word under the cursor ]]
function highlight_under_cursor_ref(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
		local highlight_augroup = vim.api.nvim_create_augroup("kyari-lsp-highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("kyari-lsp-detach", { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "kyari-lsp-highlight", buffer = event2.buf })
			end,
		})
	end
end

-- [[ LSP Keymaps ]]
function setup_keymaps(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
	end

	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	map("gR", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>rn", vim.lsp.buf.rename, "Refactoring | Rename")
	map("<leader>ca", vim.lsp.buf.code_action, "Code | Actions", { "n", "x" })
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

-- [[ Main config ]]
local config = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local mason_lspconfig = require("mason-lspconfig")
	local mason_tool_installer = require("mason-tool-installer")

	-- Extend capabilities with lsp protocol
	capabilities = vim.tbl_deep_extend("force", capabilities, vim.lsp.protocol.make_client_capabilities())

	-- Setup keymaps and autocmd related behaviours
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kyari-lsp-attach", {}),
		callback = function(event)
			setup_keymaps(event)
			highlight_under_cursor_ref(event)
		end,
	})

	-- Gather required LSPs
	local ensure_installed = vim.tbl_keys(servers or {})

	-- Actual mason setup
	mason_lspconfig.setup({
		ensure_installed = ensure_installed, -- make sure the LSPs are installed
		handlers = {
			function(server_name)
				-- For each server, add capabilities to it and setup it based on the servers table
				if server_name == "tsserver" then
					server_name = "ts_ls"
				end
				if server_name == "jdtls" then
					return
				end
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
	})
	mason_tool_installer.setup({
		ensure_installed = {
			"prettier",
			"prettierd",
			"stylua",
			"black",
			"pylint",
			"eslint_d",
			"shfmt",
			"google-java-format",
		},
		auto_update = true,
		run_on_start = true,
	})

	vim.api.nvim_command("MasonToolsInstall")

	-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
	local open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded" -- Set border to rounded
		return open_floating_preview(contents, syntax, opts, ...)
	end
end

return {
	{
		"williamboman/mason.nvim",
		opts = {
			registries = {
				"github:nvim-java/mason-registry",
				"github:mason-org/mason-registry",
			},
		},
	},
	{

		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		lazy = false,
		config = config,
	},
}