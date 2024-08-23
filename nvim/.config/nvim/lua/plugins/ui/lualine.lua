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
			lualine_x = {
				"macro_recording",
				function()
					local ok, pomo = pcall(require, "pomo")
					if not ok then
						return ""
					end

					local timer = pomo.get_first_to_finish()
					if timer == nil then
						return ""
					end

					return "󰄉 " .. tostring(timer)
				end,
				"%S",
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 4,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
					},
					"encoding",
					"filetype",
				},
			},
		},
	},
}
