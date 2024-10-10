return {
	{
		"Kyariban/angular-scripts.nvim",
		config = function()
			local angularScripts = require("angular-scripts")
			vim.keymap.set("n", "<leader>Ar", function()
				angularScripts.run_angular_scripts()
			end, { desc = "Angular | Run Scripts" })
		end,
	},
	{
		"Kyariban/angular-schematics.nvim",
		config = function()
			require("angular-schematics")
			vim.keymap.set("n", "<leader>Ag", "<cmd>NgGenerate<CR>", { desc = "Angular | Generate schematics" })
		end,
	},
}
