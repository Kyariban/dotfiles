return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					transparency = false,
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
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
			})
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
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
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
		"aktersnurra/no-clown-fiesta.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
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
					"gruvbox",
					"kanagawa-paper",
					"nightfox",
					"no-clown-fiesta",
					"nord",
					"nordfox",
					"onedark",
					"poimandres",
					"rose-pine",
					"solarized-osaka",
					"terafox",
					"tokyodark",
					"tokyonight",
				},
				livePreview = true,
			})
		end,
	},
}
