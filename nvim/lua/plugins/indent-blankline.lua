vim.opt.termguicolors = true
--vim.cmd([[highlight IndentBlanklineIndent11 guifg=#FF0000 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#FF0000 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol:↴")

return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = false,
	config = function()
		local hl_list = {}
		-- hide first level line by color (#1E1E2E)
		local c = "#2A2B3C"
		for i, color in pairs({ "#2e3440", c, c, c, c, c, c, c, c, c, c, c, c, c }) do
			local name = "IndentBlanklineIndent" .. i
			vim.api.nvim_set_hl(0, name, { fg = color, bg = color })
			table.insert(hl_list, name)
		end
		require("indent_blankline").setup({
			space_char_blankline = "⋅",
			char_highlight_list = hl_list,
		})
	end,
}
