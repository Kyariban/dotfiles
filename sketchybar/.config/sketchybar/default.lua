local settings = require("config.settings")
local colors = require("config.current_colors")
local fonts = require("config.fonts")

-- Equivalent to the --default domain
sbar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = fonts.icons,
			style = fonts.style_map["Semibold"],
			size = fonts.icon_size,
		},
		color = colors.white,
		padding_left = settings.paddings,
		padding_right = settings.paddings,
		background = { image = { corner_radius = 2 } },
	},
	label = {
		font = {
			family = fonts.text,
			style = fonts.style_map["Semibold"],
			size = fonts.text_size,
		},
		color = colors.white,
		padding_left = settings.paddings,
		padding_right = settings.paddings,
	},
	background = {
		height = 28,
		corner_radius = 5,
		border_width = 2,
		blur_radius = 50,
		image = {
			corner_radius = 9,
			border_color = colors.border_color,
			border_width = 1,
		},
	},
	popup = {
		background = {
			border_width = 2,
			corner_radius = 9,
			border_color = colors.popup.border,
			color = colors.popup.bg,
			shadow = { drawing = true },
		},
		blur_radius = 50,
	},
	slider = {
		highlight_color = colors.accent,
		background = {
			height = 6,
			corner_radius = 3,
			color = colors.bg2,
		},
		knob = {
			string = "􀀁",
			drawing = true,
		},
	},
	padding_left = 5,
	padding_right = 5,
	scroll_texts = true,
})
