return {
	"Kyariban/angular-scripts.nvim",
	config = function()
		local angularScripts = require("angular-scripts")
		vim.keymap.set("n", "<leader>ra", function()
			angularScripts.run_angular_scripts()
		end)
	end,
}
