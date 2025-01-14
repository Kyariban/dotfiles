return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
				defaults = {
					mappings = {
						n = {
							["d"] = require("telescope.actions").delete_buffer,
							["q"] = require("telescope.actions").close,
						},
					},
					layout_config = {
						vertical = {
							width = 0.95,
						},
						horizontal = {
							width = 0.95,
						},
					},
					path_display = {
						"smart",
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension, "git_file_history")

			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>sf",
				":Telescope find_files workspace=CWD theme=ivy<cr>",
				{ desc = "Search | Files" }
			)
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search | current Word" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search | by Grep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search | Diagnostics" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search | Recent Files ("." for repeat)' })
			vim.keymap.set(
				"n",
				"<leader>ss",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Search | workspace Symbols" }
			)
			vim.keymap.set("n", "<leader>sm", function()
				builtin.treesitter({ default_text = ":method:" })
			end, { desc = "Search | Methods" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Search | / in Open Files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search | Neovim files" })

			-- Less used Mappings
			vim.keymap.set("n", "<leader>si", builtin.lsp_incoming_calls, { desc = "Search | Incoming calls" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search | Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search | Keymaps" })

			vim.keymap.set("n", "<leader>sH", function()
				require("telescope").extensions.git_file_history.git_file_history()
			end, { desc = "Search | Git file History" })

			vim.keymap.set(
				"n",
				"<leader>sc",
				":Telescope git_bcommits<CR>",
				{ desc = "Search | commits", noremap = true, silent = true }
			)

			vim.keymap.set(
				"n",
				"<leader>sb",
				":Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<CR>",
				{ desc = "Search | Buffers", noremap = true, silent = true }
			)

			vim.keymap.set("n", "<leader>st", function()
				require("telescope").extensions.pomodori.timers()
			end, { desc = "Search | Timers" })
		end,
	},
}
