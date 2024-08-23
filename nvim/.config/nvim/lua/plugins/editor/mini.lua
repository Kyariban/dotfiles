return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup({
				custom_surroundings = nil,
				highlight_duration = 500,
				mappings = {
					add = "ma",
					delete = "md",
					find = "mf",
					find_left = "mF",
					highlight = "mh",
					replace = "mr",
					update_n_lines = "mn",
					suffix_last = "l",
					suffix_next = "n",
				},

				n_lines = 20,

				respect_selection_type = false,

				search_method = "cover",

				silent = false,
			})
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
					group = function(_, match)
						local utils = require("solarized-osaka.hsl")
						--- @type string, string, string
						local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
						--- @type number?, number?, number?
						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
						--- @type string
						local hex_color = utils.hslToHex(s, l, h)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},
}
