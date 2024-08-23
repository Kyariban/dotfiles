local wezterm = require("wezterm")

local config = {
	color_scheme = "Everforest Dark (Gogh)",

	font = wezterm.font("MesloLGS Nerd Font Mono"),
	font_size = 16.0,
	bold_brightens_ansi_colors = true, -- Similaire à 'bold_font auto'

	window_decorations = "NONE", -- Similaire à 'hide_window_decorations yes'
	macos_window_background_blur = 10,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 1.0, -- Correspond à 'background_opacity'
	enable_wayland = false, -- Si vous êtes sur Wayland

	automatically_reload_config = true,
}

return config
