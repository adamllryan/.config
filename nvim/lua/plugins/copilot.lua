local is_public_project = function()
  local current_dir = vim.fn.getcwd()
  local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")
  local repos_path = home_dir .. "/code/repos"
  local work_path = repos_path .. "/doktor" -- TODO: change this to a "work" or "work/private" folder at some point
  local is_work = string.find(current_dir, work_path) == 1

  if is_work then
    return false
  else
    return true
  end
end

return {
  -- custom config which piggybacks on the copilot extras in lazy.lua.
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
        },
        filetypes = {
          markdown = true,

          ["."] = true,
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end

      -- disable copilot if we are in a private project
      if not is_public_project() then
        vim.cmd("Copilot disable")
      end
    end,
  },
}
