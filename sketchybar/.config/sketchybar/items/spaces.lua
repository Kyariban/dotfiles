local constants = require("constants")
local appIcons = require("config.app_icons")
local colors = require("config.current_colors")
local icons = require("config.icons")

local spaces = {}

local swapWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local currentWorkspaceWatcher = sbar.add("item", {
	drawing = false,
	updates = true,
})

local spaceConfigs = {
	["1"] = { icon = icons.spaces.browser, name = "Browser" },
	["2"] = { icon = icons.spaces.terminal, name = "Terminal" },
	["3"] = { icon = icons.spaces.back, name = "IntelliJ" },
	["4"] = { icon = icons.spaces.chat, name = "Chat" },
	["N"] = { icon = icons.spaces.notes, name = "Notes" },
	["E"] = { icon = icons.spaces.music, name = "Music" },
	["D"] = { icon = icons.spaces.design, name = "Design" },
	["C"] = { icon = icons.spaces.container, name = "Containers" },
}

local function selectCurrentWorkspace(focusedWorkspaceName)
	for sid, item in pairs(spaces) do
		if item ~= nil then
			local isSelected = sid == constants.items.SPACES .. "." .. focusedWorkspaceName
			item:set({
				icon = {
					color = isSelected and colors.bg1 or colors.white,
					padding_left = 5,
					padding_right = 8,
				},
				label = { color = isSelected and colors.bg1 or colors.white, padding_right = 8 },
				background = {
					color = isSelected and colors.white or colors.transparent,
				},
			})
		end
	end

	sbar.trigger(constants.events.UPDATE_WINDOWS)
end

local function findAndSelectCurrentWorkspace()
	sbar.exec(constants.aerospace.GET_CURRENT_WORKSPACE, function(focusedWorkspaceOutput)
		local focusedWorkspaceName = focusedWorkspaceOutput:match("[^\r\n]+")
		selectCurrentWorkspace(focusedWorkspaceName)
	end)
end

local function addWorkspaceItem(workspaceName)
	local spaceName = constants.items.SPACES .. "." .. workspaceName
	local spaceConfig = spaceConfigs[workspaceName]

	spaces[spaceName] = sbar.add("item", spaceName, {
		label = {
			width = 0,
			string = spaceConfig.name,
		},
		icon = {
			string = spaceConfig.icon or appIcons["default"],
		},
		click_script = "aerospace workspace " .. workspaceName,
	})

	spaces[spaceName]:subscribe("mouse.entered", function(env)
		sbar.animate("tanh", 30, function()
			spaces[spaceName]:set({ label = { width = "dynamic" } })
		end)
	end)

	spaces[spaceName]:subscribe("mouse.exited", function(env)
		sbar.animate("tanh", 30, function()
			spaces[spaceName]:set({ label = { width = 0 } })
		end)
	end)
end

local function createWorkspaces()
	sbar.exec(constants.aerospace.LIST_ALL_WORKSPACES, function(workspacesOutput)
		for workspaceName in workspacesOutput:gmatch("[^\r\n]+") do
			addWorkspaceItem(workspaceName)
		end

		findAndSelectCurrentWorkspace()
	end)
end

swapWatcher:subscribe(constants.events.SWAP_MENU_AND_SPACES, function(env)
	local isShowingSpaces = env.isShowingMenu == "off" and true or false
	sbar.set("/" .. constants.items.SPACES .. "\\..*/", { drawing = isShowingSpaces })
end)

currentWorkspaceWatcher:subscribe(constants.events.AEROSPACE_WORKSPACE_CHANGED, function(env)
	selectCurrentWorkspace(env.FOCUSED_WORKSPACE)
	sbar.trigger(constants.events.UPDATE_WINDOWS)
end)

createWorkspaces()
