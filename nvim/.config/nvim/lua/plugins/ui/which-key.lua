return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			local icons = {
				java = "",
				code = "",
				debug = "",
				harpoon = "󰛢",
				search = "",
				breakpoint = "",
				log = "󰦨",
				test = "󰙨",
				angular = "",
				workspace = "",
				panes = "",
				toggle = "",
				open = "󰠜",
				format = "󰉠",
				trouble = "",
				git = "",
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
				{ "<leader>c", group = "Code", icon = icons.code },
				{ "<leader>d", group = "Debug", icon = icons.debug },
				{ "<leader>h", group = "Harpoon", icon = icons.harpoon },
				{ "<leader>s", group = "Search", icon = icons.search },
				{ "<leader>b", group = "Breakpoints", icon = icons.breakpoint },
				{ "<leader>J", group = "Java", icon = icons.java },
				{ "<leader>Jl", group = "Java | Logs", icon = icons.log },
				{ "<leader>Jt", group = "Java | Test", icon = icons.test },
				{ "<leader>A", group = "Angular", icon = icons.angular },
				{ "<leader>w", group = "Workspace", icon = icons.workspace },
				{ "<leader>p", group = "Panes", icon = icons.panes },
				{ "<leader>t", group = "Toggle", icon = icons.toggle },
				{ "<leader>o", group = "Open", icon = icons.open },
				{ "<leader>f", group = "Format", icon = icons.format },
				{ "<leader>x", group = "Trouble", icon = icons.trouble },
				{ "<leader>H", group = "Hunk Git", mode = { "n", "v" }, icon = icons.git },
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
