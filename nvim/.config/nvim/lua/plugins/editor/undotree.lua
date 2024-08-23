return {
	"mbbill/undotree",
	enabled = false,
	init = function()
		vim.keymap.set("n", "<leader>ou", vim.cmd.UndotreeToggle, { desc = "Open | Undotree" })
	end,
}
