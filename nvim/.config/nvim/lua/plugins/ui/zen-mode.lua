return {
	{
		"folke/zen-mode.nvim",
		enabled = false,
		opts = {
			window = {
				backdrop = 1,
				width = 0.85,
			},
			on_open = function(_)
				vim.opt.nu = false
				require("noice").disable()
				require("ufo").disable()
				vim.o.foldcolumn = "0"
				vim.o.foldenable = false
			end,
			on_close = function()
				vim.opt.nu = true
				require("noice").enable()
				require("ufo").enable()
				vim.o.foldcolumn = "1"
				vim.o.foldenable = true
			end,
		},
	}, -- Lua
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
