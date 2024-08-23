local icons = require("config.icons")
local colors = require("config.current_colors")

local whitelist = { ["Spotify"] = true }

-- local media_cover = sbar.add("item", {
-- 	position = "center",
-- 	background = {
-- 		image = {
-- 			string = "media.artwork",
-- 			scale = 0.85,
-- 		},
-- 		color = colors.transparent,
-- 	},
-- 	label = { drawing = false },
-- 	icon = { drawing = false },
-- 	drawing = false,
-- 	updates = true,
-- })
--
local media_artist = sbar.add("item", {
	position = "center",
	drawing = false,
	padding_left = 3,
	padding_right = 0,
	width = 0,
	icon = { drawing = false },
	label = {
		width = 0,
		font = { size = 9 },
		color = colors.white,
		max_chars = 25,
		y_offset = 6,
	},
})

local media_title = sbar.add("item", {
	position = "center",
	drawing = false,
	padding_left = 3,
	padding_right = 0,
	icon = { drawing = false },
	label = {
		font = { size = 11 },
		width = 0,
		max_chars = 50,
		y_offset = -5,
	},
})

local media_bracket = sbar.add("bracket", "media.bracket", {
	-- media_cover.name,
	media_artist.name,
	media_title.name,
}, {
	popup = { align = "center", horizontal = true },
})
sbar.add("item", {
	position = "popup." .. media_bracket.name,
	icon = { string = icons.media.back },
	label = { drawing = false },
	click_script = "nowplaying-cli previous",
})
sbar.add("item", {
	position = "popup." .. media_bracket.name,
	icon = { string = icons.media.play_pause },
	label = { drawing = false },
	click_script = "nowplaying-cli togglePlayPause",
})
sbar.add("item", {
	position = "popup." .. media_bracket.name,
	icon = { string = icons.media.forward },
	label = { drawing = false },
	click_script = "nowplaying-cli next",
})

local function animate_detail(detail)
	sbar.animate("tanh", 30, function()
		media_artist:set({ label = { width = detail and "dynamic" or 0 } })
		media_title:set({ label = { width = detail and "dynamic" or 0 } })
	end)
end

media_title:subscribe("media_change", function(env)
	if whitelist[env.INFO.app] then
		local drawing = (env.INFO.state == "playing")
		media_artist:set({ drawing = drawing, label = env.INFO.artist })
		media_title:set({ drawing = drawing, label = env.INFO.title })
		-- media_cover:set({ drawing = drawing })

		if drawing then
			animate_detail(true)
		else
			media_bracket:set({ popup = { drawing = false } })
		end
	end
end)

media_bracket:subscribe("mouse.clicked", function(env)
	media_bracket:set({ popup = { drawing = "toggle" } })
end)

-- media_cover:subscribe("mouse.clicked", function(env)
-- 	media_bracket:set({ popup = { drawing = "toggle" } })
-- end)
media_title:subscribe("mouse.clicked", function(env)
	media_bracket:set({ popup = { drawing = "toggle" } })
end)
media_artist:subscribe("mouse.clicked", function(env)
	media_bracket:set({ popup = { drawing = "toggle" } })
end)
media_bracket:subscribe("mouse.exited.global", function(env)
	media_bracket:set({ popup = { drawing = false } })
end)
