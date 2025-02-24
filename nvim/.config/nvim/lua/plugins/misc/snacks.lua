return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		picker = {},
		explorer = {},
	},
	keys = {
		{
			"<leader>tz",
			function()
				Snacks.zen()
			end,
			desc = "Toggle | Zen Mode",
		},
		{
			"<leader>tZ",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle | Zoom",
		},
		{
			"<leader>ts",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle | Scratch Buffer",
		},
		{
			"<leader>os",
			function()
				Snacks.scratch.select()
			end,
			desc = "Open | Select Scratch Buffer",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Code | Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git | Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git | Blame Line",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit | Current File History",
		},
		{
			"<leader>og",
			function()
				Snacks.lazygit()
			end,
			desc = "Open | Lazygit",
		},
		{
			"<leader>gL",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		-- Top Pickers & Explorer
		{
			"<leader>sf",
			function()
				Snacks.picker.smart()
			end,
			desc = "search | Smart Find Files",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Search | Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Search | Grep",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>sG",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Search | Git Files",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Search | Recent",
		},
		-- git
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git | Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git | Log Line",
		},
		-- Grep
		{
			"<leader>sG",
			function()
				Snacks.picker.lines()
			end,
			desc = "Search | Grep Buffer Lines",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Search | Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Search | Registers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search | Search History",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Search | Autocmds",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Search | Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Search | Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Search | Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Search | Buffer Diagnostics",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Search | Highlights",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Search | Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Search | Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Search | Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Search | Marks",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Search | Quickfix List",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Search | Undo History",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
