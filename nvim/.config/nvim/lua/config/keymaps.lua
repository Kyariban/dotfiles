-- [[ Basic Keymaps ]]
local keymap = vim.keymap
-- General keymaps
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Workspace | Save file" })
keymap.set("n", "<leader>wa", ":wa<CR>", { desc = "Workspace | Save all files" })
keymap.set("n", "<leader>wq", ":wqa<CR>", { desc = "Workspace | Save all files and quit" })
keymap.set("n", "<leader>wf", ":q!<CR>", { desc = "Workspace | Force quit" })

-- Spelling
vim.api.nvim_set_keymap("n", "<leader>ts", ":setlocal spell!<CR>", { desc = "Toggle | Spell check" })
vim.api.nvim_set_keymap("n", "<leader>mf", "z=", { noremap = true, silent = true, desc = "Spell | Word list" })
vim.api.nvim_set_keymap("n", "<leader>ma", "zg", { desc = "Spell | Add word to dictionnary" })
vim.api.nvim_set_keymap("n", "<leader>mr", "zw", { desc = "Spell | Remove word from dictionnary" })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit insert mode with JK
keymap.set("i", "jk", "<ESC>")

-- Primeagen config, good stuff in there
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Diagnostic keymaps
keymap.set("n", "<leader>oq", vim.diagnostic.setloclist, { desc = "Open | Quickfix" })
keymap.set("n", "<leader>ol", ":!open <c-r><c-a><CR>", { desc = "Open | Link under cursor" })

-- window management
keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Panes | Split vertically" })
keymap.set("n", "<leader>ph", "<C-w>s", { desc = "Panes | Split horizontally" })
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Panes | Equalize Splits" })
keymap.set("n", "<leader>px", "<cmd>close<CR>", { desc = "Panes | Close Split" })

-- Git
keymap.set("n", "<leader>gl", ":G log<CR>", { noremap = true, silent = true, desc = "Git | Show log" })
keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { noremap = true, silent = true, desc = "Git | Diff split" })

-- Vim-maximizer
keymap.set("n", "<leader>tm", ":MaximizerToggle<CR>", { desc = "Toggle | Maximizer" })
keymap.set("n", "<leader>tz", ":ZenMode<CR>", { desc = "Toggle | Zen Mode" })
keymap.set("n", "<leader>tr", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, { noremap = true, silent = true, desc = "Toggle | Relative line numbers" })

-- Java Testing
keymap.set("n", "<leader>Jtm", "<cmd>JavaTestRunCurrentMethod<cr>", { desc = "Java | Test current method" })
keymap.set("n", "<leader>Jtc", "<cmd>JavaTestRunCurrentClass<cr>", { desc = "Java | Test current class" })
keymap.set("n", "<leader>Jdm", "<cmd>JavaTestDebugCurrentMethod<cr>", { desc = "Java | Debug current method" })
keymap.set("n", "<leader>Jdc", "<cmd>JavaTestDebugCurrentClass<cr>", { desc = "Java | Debug current class" })
keymap.set("n", "<leader>Jtv", "<cmd>JavaTestViewLastReport<cr>", { desc = "Java | View last report" })

-- Java Debug
keymap.set("n", "<leader>Jds", "<cmd>JavaDapConfig<cr>", { desc = "Java | Dap settings" })

-- Java General
keymap.set("n", "<leader>Jp", "<cmd>JavaProfile<cr>", { desc = "Java | Profile" })
keymap.set("n", "<leader>Jb", "<cmd>JavaBuildBuildWorkspace<cr>", { desc = "Java | Build Workspace" })
keymap.set("n", "<leader>Jc", "<cmd>JavaBuildCleanWorkspace<cr>", { desc = "Java | Clean Workspace" })
keymap.set("n", "<leader>Jr", "<cmd>JavaRunnerRunMain<cr>", { desc = "Java | Run Main" })
keymap.set("n", "<leader>Jdk", "<cmd>JavaSettingsChangeRuntime<cr>", { desc = "Java | Change runtime" })
keymap.set("n", "<leader>Js", "<cmd>JavaRunnerStopMain<cr>", { desc = "Java | Stop Main" })
keymap.set("n", "<leader>Jls", "<cmd>JavaRunnerSwitchLogs<cr>", { desc = "Java | Switch logs" })
keymap.set("n", "<leader>Jlt", "<cmd>JavaRunnerToggleLogs<cr>", { desc = "Java | Toggle logs" })
keymap.set("n", "<leader>Jm", "<cmd>Maven<cr>", { desc = "Java | Maven" })

-- Breakpoints
keymap.set("n", "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Breakpoint | Toggle" })
keymap.set(
	"n",
	"<leader>bc",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ desc = "Breakpoint | With condition" }
)
keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "Breakpoint | Log point" }
)
keymap.set("n", "<leader>bx", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Breakpoint | Clear All" })
keymap.set("n", "<leader>sb", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "Search | Breakpoints" })

-- Plugins development shortcuts
keymap.set("n", "<leader>cx", "<cmd>source %<CR>", { desc = "Code | Execute current file" })

-- Debugging
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Debug | Continue" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug | Step Over" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Debug | Step Into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Debug | Step Out" })
keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end, { desc = "Debug | Disconnect" })
keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end, { desc = "Debug | Terminate" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Debug | Repl Toggle ?" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Debug | Run Last" })
keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end, { desc = "Debug | Widgets" })
keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "Debug | Scopes" })
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Debug | Telescope DAP frames" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Debug | Telescope DAP commands" })
keymap.set("n", "<leader>de", function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "Debug | Telescope DAP diagnostics" })
