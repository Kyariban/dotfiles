return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			local icons = {
				angular = "",
				breakpoint = "",
				code = "",
				debug = "",
				format = "󰉠",
				git = "",
				harpoon = "󰛢",
				java = "",
				log = "󰦨",
				obsidian = "󱞁",
				open = "󰠜",
				panes = "",
				refactor = "󰙕",
				search = "",
				test = "󰙨",
				preview = "",
				text = "󱎸",
				timer = "󰄉",
				toggle = "",
				file = "􀯪",
				image = "􀵪",
				trouble = "",
				workspace = "",
			}
			require("which-key").setup({
				icons = {
					group = "",
					colors = false,
					mappings = vim.g.have_nerd_font,
					-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
					-- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
					keys = vim.g.have_nerd_font and {} or {
						Up = "<Up> ",
						Down = "<Down> ",
						Left = "<Left> ",
						Right = "<Right> ",
						C = "<C-…> ",
						M = "<M-…> ",
						D = "<D-…> ",
						S = "<S-…> ",
						CR = "<CR> ",
						Esc = "<Esc> ",
						ScrollWheelDown = "<ScrollWheelDown> ",
						ScrollWheelUp = "<ScrollWheelUp> ",
						NL = "<NL> ",
						BS = "<BS> ",
						Space = "<Space> ",
						Tab = "<Tab> ",
						F1 = "<F1>",
						F2 = "<F2>",
						F3 = "<F3>",
						F4 = "<F4>",
						F5 = "<F5>",
						F6 = "<F6>",
						F7 = "<F7>",
						F8 = "<F8>",
						F9 = "<F9>",
						F10 = "<F10>",
						F11 = "<F11>",
						F12 = "<F12>",
					},
				},
			})

			-- Document existing key chains
			require("which-key").add({
				{ "<leader>A", group = "Angular", icon = icons.angular },
				{ "<leader>H", group = "Hunk", mode = { "n", "v" }, icon = icons.git },
				{ "<leader>J", group = "Java", icon = icons.java },
				{ "<leader>Jd", group = "Java | Debug", icon = icons.debug },
				{ "<leader>Jl", group = "Java | Logs", icon = icons.log },
				{ "<leader>Jt", group = "Java | Test", icon = icons.test },
				{ "<leader>O", group = "Obsidian", icon = icons.obsidian },
				{ "<leader>P", group = "Panes", icon = icons.panes },
				{ "<leader>b", group = "Breakpoints", icon = icons.breakpoint },
				{ "<leader>c", group = "Code", icon = icons.code },
				{ "<leader>d", group = "Debug", icon = icons.debug },
				{ "<leader>F", group = "File", icon = icons.file },
				{ "<leader>i", group = "Image", icon = icons.image },
				{ "<leader>f", group = "Format", icon = icons.format },
				{ "<leader>g", group = "Git", icon = icons.git },
				{ "<leader>h", group = "Harpoon", icon = icons.harpoon },
				{ "<leader>m", group = "Word", icon = icons.text },
				{ "<leader>M", group = "Markdown", icon = icons.preview },
				{ "<leader>o", group = "Open", icon = icons.open },
				{ "<leader>p", hidden = true },
				{ "<leader>r", group = "Refactor", icon = icons.refactor },
				{ "<leader>s", group = "Search", icon = icons.search },
				{ "<leader>t", group = "Toggle", icon = icons.toggle },
				{ "<leader>T", group = "Timer", icon = icons.timer },
				{ "<leader>w", group = "Workspace", icon = icons.workspace },
				{ "<leader>x", group = "Trouble", icon = icons.trouble },
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
