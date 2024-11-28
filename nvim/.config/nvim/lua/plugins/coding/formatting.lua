return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
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
			format_options = {
				google_java_format = {
					extra_args = { "--aosp" }, -- Exemple d'argument supplémentaire
					config_file = "~/dotfiles/config/GoogleStyleWork.xml", -- Chemin vers votre fichier de config
				},
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 5000,
			},
		})

		vim.keymap.set("n", "<leader>ff", function()
			conform.format()
		end, { desc = "Format | File" })
		vim.keymap.set({ "n", "v" }, "<leader>fr", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 4000,
			})
		end, { desc = "Format | Range" })
	end,
}
