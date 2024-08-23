return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>Ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Obsidian | Backlink" } },
		{ "<leader>Oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Obsidian | Extract note" } },
		{ "gf", "<cmd>ObsidianFollowLink<CR>", { desc = "Obsidian | Follow link" } },
		{ "<leader>Oh", "<cmd>ObsidianTOC<CR>", { desc = "Obsidian | Outline" } },
		{ "<leader>Ol", mode = { "v" }, "<cmd>ObsidianLink<CR>", { desc = "Obsidian | Link" } },
		{ "<leader>OL", "<cmd>ObsidianLinkNew<CR>", { desc = "Obsidian | Link new" } },
		{ "<leader>Oo", "<cmd>ObsidianOpen<CR>", { desc = "Obsidian | Open note" } },
		{ "<leader>Op", "<cmd>ObsidianPasteImg<CR>", { desc = "Obsidian | Paste image" } },
		{ "<leader>Oq", "<cmd>ObsidianQuickswitch<CR>", { desc = "Obsidian | Quickswitch" } },
		{ "<leader>Or", "<cmd>ObsidianRename<CR>", { desc = "Obsidian | Rename" } },
		{ "<leader>Os", "<cmd>ObsidianSearch<CR>", { desc = "Obsidian | Search notes" } },
		{ "<leader>Ot", "<cmd>ObsidianTemplate<CR>", { desc = "Obsidian | Insert template" } },
		{ "<leader>OT", "<cmd>ObsidianNewFromTemplate<CR>", { desc = "Obsidian | New from template" } },
	},
	opts = {
		ui = { enable = false },
		templates = {
			folder = "Templates",
			date_format = "%d-%m-%Y",
			time_format = "%H:%M",
		},
		workspaces = {
			{
				name = "Nexus",
				path = "~/vault/Nexus",
				strict = true,
				overrides = {
					notes_subdir = "Notes",
					disable_frontmatter = true,
				},
			},
		},
	},
}
