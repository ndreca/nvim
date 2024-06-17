return {
  {
    "github/copilot.vim",
    branch = "release",
    config = function()
      -- Copilot settings
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-A>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
    event = "VimEnter",
  },
}
