-- [[ Basic Keymaps ]]
local keymap = vim.keymap
-- General keymaps
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" })
keymap.set("n", "<leader>wa", ":wa<CR>", { desc = "Save All" })
keymap.set("n", "<leader>wQ", ":wqa<CR>", { desc = "Save All and Quit" })
keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Force Quit" })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit insert mode with JK
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Primeagen config, good stuff in there
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Diagnostic keymaps
keymap.set("n", "<leader>oq", vim.diagnostic.setloclist, { desc = "Open | Quickfix" })
keymap.set("n", "<leader>ol", ":!open <c-r><c-a><CR>", { desc = "Open | Link under cursor" })

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Window | Split vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Window | Split horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Window | Equalize Splits" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Window | Close Split" })

-- Vim-maximizer
keymap.set("n", "<leader>tm", ":MaximizerToggle<CR>", { desc = "Toggle | Maximizer" })

-- Java Testing
keymap.set("n", "<leader>Jtc", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end, { desc = "Java | Test Class" })

keymap.set("n", "<leader>Jtm", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end, { desc = "Java | Test Method" })

-- Java General
keymap.set("n", "<leader>Jb", "<cmd>JavaBuildBuildWorkspace<cr>", { desc = "Java | Build Workspace" })
keymap.set("n", "<leader>Jc", "<cmd>JavaBuildCleanWorkspace<cr>", { desc = "Java | Clean Workspace" })
keymap.set("n", "<leader>Jr", "<cmd>JavaRunnerRunMain<cr>", { desc = "Java | Run Main" })
keymap.set("n", "<leader>Js", "<cmd>JavaRunnerStopMain<cr>", { desc = "Java | Stop Main" })
keymap.set("n", "<leader>Jls", "<cmd>JavaRunnerSwitchLogs<cr>", { desc = "Java | Switch logs" })
keymap.set("n", "<leader>Jlt", "<cmd>JavaRunerToggleLogs<cr>", { desc = "Java | Toggle logs" })

-- Breakpoints
keymap.set("n", "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Breakpoint toggle" })
keymap.set(
	"n",
	"<leader>bc",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ desc = "Breakpoint with condition" }
)
keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "Breakpoint log point" }
)
keymap.set("n", "<leader>bx", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Breakpoint Clear All" })
keymap.set("n", "<leader>sb", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "Search Breakpoints (Telescope)" })

-- Plugins development shortcuts
keymap.set("n", "<leader>xf", "<cmd>source %<CR>", { desc = "E[x]ecute the current [f]ile" })

-- Debugging
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "" })
keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end, { desc = "" })
keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end, { desc = "" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "" })
keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end, { desc = "" })
keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "" })
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "" })
keymap.set("n", "<leader>de", function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "" })
