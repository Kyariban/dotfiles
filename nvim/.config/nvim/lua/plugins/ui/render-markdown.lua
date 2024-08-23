vim.cmd([[
    function! OpenMarkdownPreview(url)
        execute "silent ! open -a Firefox -n --args --new-window " . a:url
    endfunction
    let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	keys = {
		{ "<leader>Mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown | Preview" } },
		{ "<leader>Ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown | Stop preview" } },
		{ "<leader>Mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown | Toggle preview" } },
	},
}
