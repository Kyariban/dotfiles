return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
	config = function()
		local conform = require("conform")

		local function format_hunks()
			local ignore_filetypes = { "lua" }

			local format = require("conform").format
			if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
				format({ lsp_fallback = false, timeout_ms = 500 })
				return
			end

			local hunks = require("gitsigns").get_hunks()
			if hunks == nil then
				return
			end

			local function format_range()
				if next(hunks) == nil then
					return
				end
				local hunk = nil
				while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
					hunk = table.remove(hunks)
				end

				if hunk ~= nil and hunk.type ~= "delete" then
					local start = hunk.added.start
					local last = start + hunk.added.count
					-- nvim_buf_get_lines uses zero-based indexing -> subtract from last
					local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
					local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
					format({ range = range, async = true, lsp_fallback = false }, function()
						vim.defer_fn(function()
							format_range()
						end, 1)
					end)
				end
			end

			format_range()
		end

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				sh = { "shfmt" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				java = { "google-java-format" },
				rust = { "rustfmt" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettierd" },
				lua = { "stylua" },
				python = { "black" },
			},
			formatters = {
				["google-java-format"] = {
					command = "google-java-format", -- Commande pour exécuter google-java-format
					args = { "-" }, -- Le tiret (-) permet de formater le fichier dans le flux standard
					stdin = true, -- Utiliser l'entrée standard pour la commande
				},
			},
			format_on_save = function()
				format_hunks()
			end,
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
