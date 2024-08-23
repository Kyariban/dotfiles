-- Status line
-- local customTokyo = require("lualine.themes.tokyonight")
-- customTokyo.normal.c.bg = nil

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"linrongbin16/lsp-progress.nvim",
		"yavorski/lualine-macro-recording.nvim",
	},
	opts = {
		options = {
			theme = "auto",
		},
		sections = {
			lualine_x = { "macro_recording", "%S" },
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 4, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory
					symbols = {
						modified = "[+]",
						readonly = "[-]",
					},
				},
			},
		},
	},
}
