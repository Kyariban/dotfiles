---@diagnostic disable: missing-fields
return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					Visual = { bg = "#ebbcba" },
				},
				styles = {
					transparency = true,
				},
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		opts = {
			transparent = true,
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			flavour = "mocha",
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			borderless_telescope = false,
		},
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background_level = 1,
		},
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				theme = "retrowave",
				transparent = true,
			})
		end,
	},

	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_bg = true,
		},
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
		},
	},
	{
		"shaunsingh/moonlight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	-- Each colorscheme has to be declared here. Themery allows for quick switch between themes.
	{
		"zaldih/themery.nvim",
		config = function()
			vim.keymap.set("n", "<leader>ot", "<cmd>Themery <CR>", { desc = "Open | Themery" })
			require("themery").setup({
				themes = {
					"carbonfox",
					"catppuccin",
					"cyberdream",
					"dracula",
					"dracula-soft",
					"duskfox",
					"eldritch",
					"everforest",
					"fluoromachine",
					"moonlight",
					"nightfox",
					"nord",
					"nordfox",
					"onedark",
					"poimandres",
					"rose-pine",
					"terafox",
					"tokyodark",
					"tokyonight",
				},
				livePreview = true,
			})
		end,
	},
}
