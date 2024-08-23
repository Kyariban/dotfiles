return {
	"sindrets/diffview.nvim",
	init = function()
		vim.keymap.set("n", "<leader>od", function()
			if next(require("diffview.lib").views) == nil then
				vim.cmd("DiffviewOpen")
			else
				vim.cmd("DiffviewClose")
			end
		end, { desc = "Open Diffview", silent = true })
	end,
	event = "BufReadPost",
}
