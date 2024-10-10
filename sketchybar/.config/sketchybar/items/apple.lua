local icons = require("config.icons")

sbar.add("item", { width = 5 })

sbar.add("item", {
	icon = {
		string = icons.tree,
		padding_right = 8,
		padding_left = 8,
	},
	label = { drawing = false },
	padding_left = 1,
	padding_right = 1,
	click_script = "$CONFIG_DIR/bridge/menus/bin/menus -s 0",
})
