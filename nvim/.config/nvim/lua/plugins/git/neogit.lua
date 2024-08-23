return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"isakbm/gitgraph.nvim",
		"nvim-telescope/telescope.nvim",
	},

	cmd = "Neogit",
	keys = {
		{ "<Leader>gn", "<cmd>Neogit<CR>", desc = "Git | Neogit" },
	},
	opts = {
		graph_style = "kitty",
		integrations = {
			diffview = true,
			gitgraph = true,
		},
	},
}
