local fonts = require("config.fonts")
local icons = require("config.icons")
local constants = require("constants")
local colors = require("config.current_colors")
local appIcons = require("config.app_icons")

local frontApps = {}

sbar.add("bracket", constants.items.FRONT_APPS, {}, { position = "left" })
local frontAppWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local function selectFocusedWindow(frontAppName)
	for appName, app in pairs(frontApps) do
		local isSelected = appName == frontAppName
		local color = isSelected and colors.white or colors.accent
		app:set({
			label = { color = color },
			icon = { color = color },
		})
	end
end

local function updateWindows(windows)
	sbar.remove("/" .. constants.items.FRONT_APPS .. "\\.*/")

	sbar.add("item", constants.items.FRONT_APPS .. ".separator", {
		icon = {
			string = icons.separator,
		},
	})
	frontApps = {}
	local foundWindows = string.gmatch(windows, "[^\n]+")
	for window in foundWindows do
		local parsedWindow = {}
		for key, value in string.gmatch(window, "(%w+)=([%w%s]+)") do
			parsedWindow[key] = value
		end

		local windowId = parsedWindow["id"]
		local windowName = parsedWindow["name"]
		local icon = appIcons[windowName] or appIcons["default"]

		frontApps[windowName] = sbar.add("item", constants.items.FRONT_APPS .. "." .. windowName, {
			label = {
				string = windowName,
			},
			icon = {
				string = icon,
				-- Mandatory font override for icon maps
				font = {
					family = fonts.icons,
					size = fonts.icon_size,
					style = fonts.style_map["Regular"],
				},
			},
			click_script = "aerospace focus --window-id " .. windowId,
		})

		frontApps[windowName]:subscribe(constants.events.FRONT_APP_SWITCHED, function(env)
			selectFocusedWindow(env.INFO)
		end)
	end

	sbar.exec(constants.aerospace.GET_CURRENT_WINDOW, function(frontAppName)
		selectFocusedWindow(frontAppName:gsub("[\n\r]", ""))
	end)
end

local function getWindows()
	sbar.exec(constants.aerospace.LIST_WINDOWS, updateWindows)
end

frontAppWatcher:subscribe(constants.events.UPDATE_WINDOWS, function()
	getWindows()
end)

getWindows()
