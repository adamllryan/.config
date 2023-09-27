vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#70363B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#73603E gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#4C623D gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#2B5B61 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#315878 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#633C6F gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

return {
  -- Added these two plugins
  -- Indentation Highlighting
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    opts = {
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      })
    end,
  },
}
