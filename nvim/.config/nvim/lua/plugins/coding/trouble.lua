return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble | Workspace diagnostics" },
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Trouble | Document diagnostics",
		},
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Trouble | Quickfix" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Trouble | Open location list" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Trouble | Open todos" },
	},
}
