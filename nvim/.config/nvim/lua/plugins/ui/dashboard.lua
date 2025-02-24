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

		local layout = {
			{ type = "padding", val = 18 },
			heading,
			{ type = "padding", val = 2 },
			footing,
		}

		local config = {
			layout = layout,
			opts = { margin = 10 },
		}

		alpha.setup(config)
	end,
}
