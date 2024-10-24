local theme = require("config.current_colors")

sbar.add("item", { width = 5 })

sbar.add("item", {
	icon = {
		string = theme.icon,
		padding_right = 8,
		padding_left = 8,
	},
	label = { drawing = false },
	padding_left = 1,
	padding_right = 1,
	click_script = "$CONFIG_DIR/bridge/menus/bin/menus -s 0",
})
