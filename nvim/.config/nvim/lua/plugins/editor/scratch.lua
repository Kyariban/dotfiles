return {
	"https://git.sr.ht/~swaits/scratch.nvim",
	lazy = true,
	enabled = false,
	keys = {
		{ "<leader>os", "<cmd>Scratch<cr>", desc = "Open | Scratch Buffer", mode = "n" },
		{ "<leader>oS", "<cmd>ScratchSplit<cr>", desc = "Open | Scratch Buffer (split)", mode = "n" },
	},
	cmd = {
		"Scratch",
		"ScratchSplit",
	},
	opts = {},
}
