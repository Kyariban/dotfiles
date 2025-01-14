return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"rust",
				"markdown_inline",
				"comment",
				"query",
				"vim",
				"python",
				"vimdoc",
				"typescript",
				"java",
				"css",
				"scss",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				max_lines = 5,
			})
		end,
	},
}
