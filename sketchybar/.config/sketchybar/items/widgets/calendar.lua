local settings = require("config.settings")

sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	position = "right",
	update_freq = 15,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	local days = {
		"dim.",
		"lun.",
		"mar.",
		"mer.",
		"jeu.",
		"ven.",
		"sam.",
	}

	local months = {
		"janvier",
		"février",
		"mars",
		"avril",
		"mai",
		"juin",
		"juillet",
		"août",
		"septembre",
		"octobre",
		"novembre",
		"décembre",
	}

	local dateTable = os.date("*t")

	local translatedDate = string.format(
		"%s %d %s %02d:%02d",
		days[dateTable.wday],
		dateTable.day,
		months[dateTable.month],
		dateTable.hour,
		dateTable.min
	)

	cal:set({ icon = translatedDate })
end)

cal:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Calendar'")
end)
