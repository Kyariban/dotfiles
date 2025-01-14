-- Indentation guides
return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	enabled = false,
	main = "ibl",
	config = function()
		require("ibl").setup()
	end,
}
