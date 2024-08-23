return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<C-n>", ":Neotree reveal<CR>", desc = "NeoTree reveal" },
	},
	opts = {
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					-- '.git',
					".DS_Store",
					-- 'thumbs.db',
				},
				never_show = {},
			},
			window = {
				mappings = {
					["<C-n>"] = "close_window",
				},
			},
		},
	},
}
