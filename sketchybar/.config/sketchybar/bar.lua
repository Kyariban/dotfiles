local colors = require("config.current_colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = colors.bar.height,
	color = colors.bar.bg,
	y_offset = colors.bar.y_offset,
	padding_right = colors.bar.padding_right,
	padding_left = colors.bar.padding_left,
	margin = colors.bar.margin,
	corner_radius = colors.bar.corner_radius,
})
