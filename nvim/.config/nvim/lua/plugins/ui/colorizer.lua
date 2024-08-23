return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*",
		}, {
			RGB = true,
			RRGGBBAA = true,
			names = false,
			RRGGBB = true,
			AARRGGBB = true,
		})
	end,
}
