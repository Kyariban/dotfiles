return {
	"mbbill/undotree",
	init = function()
		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
	end,
}
