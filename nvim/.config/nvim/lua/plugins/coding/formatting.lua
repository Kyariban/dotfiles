return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				sh = { "shfmt" },
				java = { "google-java-format" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettierd" },
				lua = { "stylua" },
				python = { "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			},
		})

		conform.formatters.google_java_format = {
			args = {
				"--aosp",
				"--replace",
				"--xml-rules",
				"~/dotfiles/config/GoogleStyleWork.xml",
			},
		}

		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format | File" })
		vim.keymap.set({ "n", "v" }, "<leader>fr", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 4000,
			})
		end, { desc = "Format | Range" })
	end,
}
