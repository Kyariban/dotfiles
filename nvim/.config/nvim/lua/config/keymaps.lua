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

-- Make file executable
vim.keymap.set("n", "<leader>Fx", '<cmd>!chmod +x "%"<CR>', { silent = true, desc = "File | Make executable" })
vim.keymap.set("n", "<leader>FX", '<cmd>!chmod -x "%"<CR>', { silent = true, desc = "File | Remove executable" })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Paste images
vim.keymap.set({ "n", "v", "i" }, "<leader>iP", function()
	local pasted_image = require("img-clip").paste_image()
	if pasted_image then
		vim.cmd("update")
		print("Image pasted and file saved")
		vim.cmd([[lua require("image").clear()]])
		vim.cmd("edit!")
		vim.cmd("stopinsert")
	else
		print("No image pasted. File not updated.")
	end
end, { desc = "Image | Paste from system clipboard" })

-- Open image under cursor in the Preview app (macOS)
vim.keymap.set("n", "<leader>io", function()
	local function get_image_path()
		local line = vim.api.nvim_get_current_line()
		local image_pattern = "%[.-%]%((.-)%)"
		local _, _, image_path = string.find(line, image_pattern)

		return image_path
	end

	local image_path = get_image_path()

	if image_path then
		if string.sub(image_path, 1, 4) == "http" then
			print("URL image, use 'gx' to open it in the default browser.")
		else
			local current_file_path = vim.fn.expand("%:p:h")
			local absolute_image_path = current_file_path .. "/" .. image_path
			local command = "open -a Preview " .. vim.fn.shellescape(absolute_image_path)
			local success = os.execute(command)
			if success then
				print("Opened image in Preview: " .. absolute_image_path)
			else
				print("Failed to open image in Preview: " .. absolute_image_path)
			end
		end
	else
		print("No image found under the cursor")
	end
end, { desc = "Image | Open in preview (MacOS)" })

-- Delete image file under cursor using trash app (macOS)
vim.keymap.set("n", "<leader>id", function()
	local function get_image_path()
		local line = vim.api.nvim_get_current_line()
		local image_pattern = "%[.-%]%((.-)%)"
		local _, _, image_path = string.find(line, image_pattern)

		return image_path
	end

	local image_path = get_image_path()

	if image_path then
		if string.sub(image_path, 1, 4) == "http" then
			vim.api.nvim_echo({
				{ "URL image cannot be deleted from disk.", "WarningMsg" },
			}, false, {})
		else
			local current_file_path = vim.fn.expand("%:p:h")
			local absolute_image_path = current_file_path .. "/" .. image_path

			if vim.fn.executable("trash") == 0 then
				vim.api.nvim_echo({
					{ "- Trash utility not installed. Make sure to install it first\n", "ErrorMsg" },
					{ "- In macOS run `brew install trash`\n", nil },
				}, false, {})
				return
			end

			vim.ui.input({
				prompt = "Delete image file? (y/n) ",
			}, function(input)
				if input == "y" or input == "Y" then
					local success, _ = pcall(function()
						vim.fn.system({ "trash", vim.fn.fnameescape(absolute_image_path) })
					end)

					if success then
						vim.api.nvim_echo({
							{ "Image file deleted from disk:\n", "Normal" },
							{ absolute_image_path, "Normal" },
						}, false, {})
						vim.cmd([[lua require("image").clear()]])
						vim.cmd("edit!")
					else
						vim.api.nvim_echo({
							{ "Failed to delete image file:\n", "ErrorMsg" },
							{ absolute_image_path, "ErrorMsg" },
						}, false, {})
					end
				else
					vim.api.nvim_echo({
						{ "Image deletion canceled.", "Normal" },
					}, false, {})
				end
			end)
		end
	else
		vim.api.nvim_echo({
			{ "No image found under the cursor", "WarningMsg" },
		}, false, {})
	end
end, { desc = "Image | Delete image under cursor" })

-- Refresh the images in the current buffer
vim.keymap.set("n", "<leader>ir", function()
	vim.cmd([[lua require("image").clear()]])
	vim.cmd("edit!")
	print("Images refreshed")
end, { desc = "Image | Refresh" })

-- Search UP for a markdown header
vim.keymap.set({ "n", "v" }, "gk", function()
	vim.cmd("silent! ?^##\\+\\s.*$")
	vim.cmd("nohlsearch")
end, { desc = "Goto | Previous markdown header" })

-- Search DOWN for a markdown header
vim.keymap.set({ "n", "v" }, "gj", function()
	vim.cmd("silent! /^##\\+\\s.*$")
	vim.cmd("nohlsearch")
end, { desc = "Goto | Next markdown header" })

-- Open current file in finder
vim.keymap.set("n", "<leader>FO", function()
	local file_path = vim.fn.expand("%:p")
	if file_path ~= "" then
		local command = "open -R " .. vim.fn.shellescape(file_path)
		vim.fn.system(command)
		print("Opened file in Finder: " .. file_path)
	else
		print("No file is currently open")
	end
end, { desc = "Open current file in Finder" })

-- Set up a keymap to clear all images in the current buffer
vim.keymap.set("n", "<leader>ic", function()
	-- This is the command that clears the images
	-- I'm using [[ ]] to escape the special characters in a command
	vim.cmd([[lua require("image").clear()]])
	print("Images cleared")
end, { desc = "Clear images" })

-- Exit insert mode with JK
keymap.set("i", "jk", "<ESC>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Delete forward and backward
keymap.set("n", "<C-m>", "dw", { noremap = true, silent = true })
keymap.set("n", "<C-b>", "db", { noremap = true, silent = true })

-- Start and end of line
keymap.set({ "n", "x" }, "gh", "^", { silent = true, desc = "Goto | Start of the line" })
keymap.set({ "n", "x" }, "gl", "$", { silent = true, desc = "Goto | Start of the line" })

-- Primeagen config, good stuff in there
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<leader>p", "o<ESC>p", { noremap = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Diagnostic keymaps
keymap.set("n", "<leader>oq", vim.diagnostic.setloclist, { desc = "Open | Quickfix" })
keymap.set("n", "<leader>ol", ":!open <c-r><c-a><CR>", { desc = "Open | Link under cursor" })

-- window management
keymap.set("n", "<leader>Pv", "<C-w>v", { desc = "Panes | Split vertically" })
keymap.set("n", "<leader>Ph", "<C-w>s", { desc = "Panes | Split horizontally" })
keymap.set("n", "<leader>Pe", "<C-w>=", { desc = "Panes | Equalize Splits" })
keymap.set("n", "<leader>Px", "<cmd>close<CR>", { desc = "Panes | Close Split" })

-- Git
-- keymap.set("n", "<leader>gl", ":G log<CR>", { noremap = true, silent = true, desc = "Git | Show log" })
keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { noremap = true, silent = true, desc = "Git | Diff split" })

-- Vim-maximizer
keymap.set("n", "<leader>tm", ":MaximizerToggle<CR>", { desc = "Toggle | Maximizer" })
keymap.set("n", "<leader>ta", ":AerialToggle<CR>", { desc = "Toggle | Aerial" })
keymap.set("n", "<leader>tA", ":AerialNavToggle<CR>", { desc = "Toggle | Aerial Nav" })
keymap.set("n", "<leader>tz", ":ZenMode<CR>", { desc = "Toggle | Zen Mode" })
keymap.set("n", "<leader>tr", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, { noremap = true, silent = true, desc = "Toggle | Relative line numbers" })

-- Open file in firefox
keymap.set("n", "<leader>oF", function()
	local file_path = vim.fn.expand("%:p")
	os.execute("open -a 'Firefox' " .. file_path)
end, { desc = "Open | File in Firefox" })

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

-- Java refactor
keymap.set("n", "<leader>JRv", "<cmd>JavaRefactorExtractVariable<cr>", { desc = "Java | Refactor Extract Var" })
keymap.set("n", "<leader>JRV", "<cmd>JavaRefactorExtractVariable<cr>", { desc = "Java | Refactor Extract All Vars" })
keymap.set("n", "<leader>JRc", "<cmd>JavaRefactorExtractConstant<cr>", { desc = "Java | Refactor Extract Constant" })
keymap.set("n", "<leader>JRm", "<cmd>JavaRefactorExtractMethod<cr>", { desc = "Java | Refactor Extract Method" })
keymap.set("n", "<leader>JRf", "<cmd>JavaRefactorExtractField<cr>", { desc = "Java | Refactor Extract Field" })

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

keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Debug | Telescope DAP frames" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Debug | Telescope DAP commands" })
keymap.set("n", "<leader>de", function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "Debug | Telescope DAP diagnostics" })

-- HSL converter
keymap.set("n", "<leader>rh", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

-- Useful DAP Keymaps
vim.keymap.set("n", "<Leader>do", function()
	require("dapui").open()
end, { desc = "Debug | Open DAP UI" })
vim.keymap.set("n", "<Leader>dc", function()
	require("dap").continue()
end, { desc = "Debug | Continue" })
vim.keymap.set("n", "<Leader>dso", function()
	require("dap").step_over()
end, { desc = "Debug | Step over" })
vim.keymap.set("n", "<Leader>dsi", function()
	require("dap").step_into()
end, { desc = "Debug | Step into" })
vim.keymap.set("n", "<Leader>dsb", function()
	require("dap").step_out()
end, { desc = "Debug | Step out" })
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end, { desc = "Debug | Repl open" })
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end, { desc = "Debug | Run last" })
vim.keymap.set("n", "<Leader>dq", function()
	require("dapui").close()
end, { desc = "Debug | Close DAP UI" })

vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "Debug | Hover" })

vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end, { desc = "Debug | Preview" })

vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end, { desc = "Debug | Frames" })

vim.keymap.set("n", "<Leader>dsc", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "Debug | Scopes" })
