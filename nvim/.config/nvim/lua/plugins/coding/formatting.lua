return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				sh = { "shfmt" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				rust = { "rustfmt" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettierd" },
				lua = { "stylua" },
				python = { "black" },
			},
			format_options = {
				google_java_format = {
					extra_args = { "--aosp" }, -- Exemple d'argument supplémentaire
					config_file = "~/dotfiles/nvim/.config/nvim/lang-config/GoogleStyleSquadGestion.xml", -- Chemin vers votre fichier de config
				},
			},
			format_on_save = {
				lsp_fallback = false,
				exclude = {
					"java",
				},
				async = false,
				timeout_ms = 5000,
			},
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>fl",
			":lua vim.lsp.buf.format({ async = true })<CR>",
			{ noremap = true, silent = true, desc = "Format | File with lsp" }
		)
		vim.keymap.set("n", "<leader>ff", function()
			conform.format()
		end, { desc = "Format | File" })
		vim.keymap.set({ "n", "v" }, "<leader>fr", function()
			conform.format()
		end, { desc = "Format | Range" })
	end,
}
