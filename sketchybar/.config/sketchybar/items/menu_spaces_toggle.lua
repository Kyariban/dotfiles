local constants = require("constants")
local icons = require("config.icons")
local colors = require("config.current_colors")

sbar.add("event", constants.events.SWAP_MENU_AND_SPACES)

local function switchToggle(menuToggle)
	local isShowingMenu = menuToggle:query().icon.value == icons.switch.on

	menuToggle:set({
		icon = isShowingMenu and icons.switch.off or icons.switch.on,
		label = isShowingMenu and "Menus" or "Spaces",
	})

	sbar.trigger(constants.events.SWAP_MENU_AND_SPACES, { isShowingMenu = isShowingMenu })
end

local function addToggle()
	local menuToggle = sbar.add("item", constants.items.MENU_TOGGLE, {
		icon = {
			string = icons.switch.on,
		},
		label = {
			width = 0,
			color = colors.white,
			string = "Spaces",
		},
		background = {
			color = colors.transparent,
		},
	})

	menuToggle:subscribe("mouse.entered", function(env)
		sbar.animate("tanh", 30, function()
			menuToggle:set({
				icon = { color = colors.accent },
				label = { width = "dynamic" },
			})
		end)
	end)

	menuToggle:subscribe("mouse.exited", function(env)
		sbar.animate("tanh", 30, function()
			menuToggle:set({
				icon = { color = colors.white },
				label = { width = 0 },
			})
		end)
	end)

	menuToggle:subscribe("mouse.clicked", function(env)
		switchToggle(menuToggle)
	end)

	menuToggle:subscribe(constants.events.AEROSPACE_SWITCH, function(env)
		switchToggle(menuToggle)
	end)
end

addToggle()
