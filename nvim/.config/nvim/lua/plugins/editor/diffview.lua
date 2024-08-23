return {
	"sindrets/diffview.nvim",
	init = function()
		vim.keymap.set("n", "<leader>of", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diff File" })
		vim.keymap.set("n", "<leader>od", function()
			if next(require("diffview.lib").views) == nil then
				vim.cmd("DiffviewOpen")
			else
				vim.cmd("DiffviewClose")
			end
		end, { desc = "Open | Diffview", silent = true })
	end,
	event = "BufReadPost",
	opts = {
		enhanced_diff_hl = true,
	},
}
