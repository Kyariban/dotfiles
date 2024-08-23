return {
	{ "tpope/vim-fugitive" },
	{
		"jecaro/fugitive-difftool.nvim",
		config = function()
			-- Jump to the first quickfix entry
			vim.api.nvim_create_user_command("Gcfir", require("fugitive-difftool").git_cfir, {})
			-- To the last
			vim.api.nvim_create_user_command("Gcla", require("fugitive-difftool").git_cla, {})
			-- To the next
			vim.api.nvim_create_user_command("Gcn", require("fugitive-difftool").git_cn, {})
			-- To the previous
			vim.api.nvim_create_user_command("Gcp", require("fugitive-difftool").git_cp, {})
			-- To the currently selected
			vim.api.nvim_create_user_command("Gcc", require("fugitive-difftool").git_cc, {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Actions
				-- visual mode
				map("v", "<leader>Hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage git hunk" })
				map("v", "<leader>Hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset git hunk" })
				-- normal mode
				map("n", "<leader>Hs", gitsigns.stage_hunk, { desc = "Hunk | Stage hunk" })
				map("n", "<leader>Hr", gitsigns.reset_hunk, { desc = "Hunk | Reset hunk" })
				map("n", "<leader>HS", gitsigns.stage_buffer, { desc = "Hunk | Stage buffer" })
				map("n", "<leader>Hu", gitsigns.undo_stage_hunk, { desc = "Hunk | Undo stage hunk" })
				map("n", "<leader>HR", gitsigns.reset_buffer, { desc = "Hunk | Reset buffer" })
				map("n", "<leader>Hp", gitsigns.preview_hunk, { desc = "Hunk | Preview hunk" })
				map("n", "<leader>Hd", gitsigns.diffthis, { desc = "Hunk | Diff against index" })
				map("n", "<leader>HD", function()
					gitsigns.diffthis("@")
				end, { desc = "Hunk | Diff against last commit" })
				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle | Blame current line" })
				map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "Toggle | Git show deleted" })
			end,
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
