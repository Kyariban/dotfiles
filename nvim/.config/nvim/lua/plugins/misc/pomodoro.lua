return {
	"epwalsh/pomo.nvim",
	version = "*",
	lazy = true,
	cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
	dependencies = {
		"rcarriga/nvim-notify",
	},
	opts = {
		sessions = {
			cycle = {
				{ name = "Work", duration = "25m" },
				{ name = "Short Break", duration = "5m" },
				{ name = "Work", duration = "25m" },
				{ name = "Short Break", duration = "5m" },
				{ name = "Work", duration = "25m" },
				{ name = "Long Break", duration = "15m" },
			},
		},
	},
	keys = {
		{ "<leader>Tl", "<cmd>TimerSession<CR>", { desc = "Timer | Launch Session" } },
		{ "<leader>Ts", "<cmd>TimerStart<CR>", { desc = "Timer | Start" } },
		{ "<leader>TS", "<cmd>TimerStop<CR>", { desc = "Timer | Stop" } },
		{ "<leader>Td", "<cmd>TimerShow<CR>", { desc = "Timer | Display" } },
		{ "<leader>Th", "<cmd>TimerHide<CR>", { desc = "Timer | Hide" } },
		{ "<leader>Tp", "<cmd>TimerPause<CR>", { desc = "Timer | Pause" } },
		{ "<leader>TR", "<cmd>TimerRepeat<CR>", { desc = "Timer | Repeat" } },
		{ "<leader>Tr", "<cmd>TimerResume<CR>", { desc = "Timer | Resume" } },
	},
}
