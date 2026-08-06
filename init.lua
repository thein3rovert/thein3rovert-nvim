-- I am not a real vim user
-- vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/" -- NvChad base46 cache (disabled)
vim.g.mapleader = " "

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup({
  { import = "plugins" },
}, require("configs.lazy"))

-- load theme (NvChad base46 - disabled in favor of standalone onedark)
-- for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
--   dofile(vim.g.base46_cache .. v)
-- end
--
-- -- Override with onedark colorscheme after base46 loads
-- vim.schedule(function()
--   require("onedark").load()
-- end)

require("configs.options")
require("configs.cmds")
require("configs.highlights")

vim.schedule(function()
  require("configs.autocmds")
  require("configs.mappings.mappings")
end)

require("utils.system").setup_mason_path()
