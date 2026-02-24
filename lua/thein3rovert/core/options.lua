vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- opt.smarttab = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true
opt.softtabstop = 4

-- auto-reload files when changed outside nvim
opt.autowrite = true
opt.autoread = true

opt.laststatus = 3
opt.showmode = false
opt.ruler = false
-- opt.autoindent = true -- copy indent from current line when starting new one

opt.smoothscroll = true

opt.list = true
opt.listchars = {

  tab = "▸ ",
  trail = "·",
  precedes = "←",
  extends = "→",
  nbsp = "+",
  -- eol = "↲",
}

-- wrapping settings for when wrap is enabled
opt.linebreak = true -- wrap at word boundaries, not mid-word
opt.breakindent = true -- wrapped lines maintain indent
opt.wrap = true

opt.conceallevel = 2

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.undofile = true
opt.undolevels = 10000

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.equalalways = true
opt.splitkeep = "screen"

-- turn off swapfile
opt.swapfile = false

-- reduce key sequence timeout to fix keymap delays
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

opt.updatetime = 100 -- faster file reload (default is 4000ms)

-- trigger autoread when cursor stops moving
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- notification after file change
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

-- Auto-check for file changes every 100ms (no cursor movement required)
-- local timer = vim.loop.new_timer()
-- timer:start(100, 100, vim.schedule_wrap(function()
--   vim.cmd("checktime")
-- end))
