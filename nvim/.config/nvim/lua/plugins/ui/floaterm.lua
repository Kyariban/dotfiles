return {
	"voldikss/vim-floaterm",
	config = function()
		vim.keymap.set("n", "<leader>tf", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
		vim.keymap.set("t", "<leader>tf", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
	end,
}
