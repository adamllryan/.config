return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "doom-one",
        theme = "nordfox",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "NvimTree",
          },
          winbar = {
            "NvimTree",
          },
        },
        ignore_focus = {
          "NvimTree",
        },
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          {
            "branch",
            separator = { left = "" },
            right_padding = 2,
          },
        },
        lualine_c = { "diff", "buffers", { "filename", file_status = true, path = 1 } },
        -- lualine_c = { "diff" }, -- lualine_c = { { "filename", file_status = true, path = 1 } },
        -- lualine_c = { "fileformat" },
        --lualine_x = {
        --  {
        --    require("lazy.status").updates,
        --   cond = require("lazy.status").has_updates,
        -- },
        --},
        lualine_x = {
          "encoding",
          "filesize",
          "os.date('%Y-%m-%d %H:%M:%S')",
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          {
            "location",
            separator = { right = "" },
            left_padding = 2,
          },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}
