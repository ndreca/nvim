vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- local bufs = vim.fn.getbufinfo({buflisted = 1})
    --if #bufs == 1 and bufs[1].name == "" then
    vim.cmd "NvimTreeFindFile"
    vim.cmd "wincmd p"
    -- require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
    -- vim.cmd("wincmd p")
    vim.cmd "stopinsert"
    require("base46").load_all_highlights()
    vim.api.nvim_exec_autocmds("User", { pattern = "NvChadThemeReload" })
    --:end
  end,
})

vim.schedule(function()
  require "mappings"
end)
