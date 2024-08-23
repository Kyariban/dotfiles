local icons = require("config.icons")
local settings = require("config.settings")

sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/bridge/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("item", "widgets.cpu", 42, {
	position = "right",
	label = {
		string = "??%",
		align = "left",
	},
	icon = { string = icons.cpu },
	padding_right = settings.paddings,
})

cpu:subscribe("cpu_update", function(env)
	-- Also available: env.user_load, env.sys_load
	local load = tonumber(env.total_load)

	cpu:set({
		label = env.total_load .. "%",
	})
end)

cpu:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Activity Monitor'")
end)
