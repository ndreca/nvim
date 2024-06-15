return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("telescope").load_extension("lazygit")
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "lazy git" })
    end,
    event = "VimEnter"
  },
}
