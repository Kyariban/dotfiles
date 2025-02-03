return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local heading = {
			type = "text",
			val = require("dashboard.banners")["imperium"],
			opts = {
				position = "center",
				hl = "AlphaFooter",
			},
		}

		local buttons = {
			type = "group",
			val = {
				dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
				dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
				dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
				dashboard.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
				dashboard.button("d", " " .. " Config", "<cmd> e $HOME/dotfiles/nvim/.config/nvim <CR>"),
				dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
				dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
			},
			opts = {
				position = "center",
				spacing = 1,
			},
		}

		for _, button in ipairs(buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		local footing = {
			type = "text",
			val = "Caliban.Nvim",
			opts = {
				position = "center",
				hl = "AlphaFooter",
			},
		}
		local loaded = {
			type = "text",
			val = string.format(" Loaded %d plugins", require("lazy").stats().count),
			opts = {
				position = "center",
				hl = "AlphaFooter",
			},
		}

		local layout = {
			{ type = "padding", val = 9 },
			heading,
			{ type = "padding", val = 2 },
			footing,
			{ type = "padding", val = 1 },
			buttons,
			{ type = "padding", val = 1 },
			loaded,
		}

		local config = {
			layout = layout,
			opts = { margin = 10 },
		}

		alpha.setup(config)
	end,
}
