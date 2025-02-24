return {
	enabled = true,
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Refactoring | Extract" })
		vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactoring | Extract to file" })

		vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactoring | Extract var" })

		vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Refactoring | Inline variable" })

		vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "Refactoring | Inline function" })

		vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactoring | Extract block" })
		vim.keymap.set(
			"n",
			"<leader>rbf",
			":Refactor extract_block_to_file",
			{ desc = "Refactoring | Extract block to file" }
		)
	end,
}
