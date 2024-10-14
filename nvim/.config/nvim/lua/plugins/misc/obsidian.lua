return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		ui = { enable = false },
		templates = {
			folder = "Templates",
			date_format = "%d-%m-%Y",
			time_format = "%H:%M",
		},
		workspaces = {
			{
				name = "Nexus",
				path = "~/vault/Nexus",
			},
		},
	},
}
