local map = require("utils.map")

--------------------------------------------------------
-- PORTED FROM nvim-0.12.0 BRANCH
-- Original location: lua/config/keymaps.lua
--------------------------------------------------------

-- Saving
map("n", "++", "<cmd>write!<CR>", { desc = "Quick save (force)" })

-- Tmux Navigation (disabled - using normal tmux)
-- map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
-- map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
-- map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
-- map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

--------------------------------------------------------
-- Navigation
--------------------------------------------------------
map("n", "j", "gj", { desc = "Move down (wrapped lines)" })
map("n", "k", "gk", { desc = "Move up (wrapped lines)" })
map("n", "n", "nzzzv", { desc = "Next search match (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search match (centered)" })
-- <C-d>/<C-u> centered scroll already in custom.lua

--------------------------------------------------------
-- Buffers (commented out - using bufferline keymaps instead)
--------------------------------------------------------
-- map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
-- map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>,", function()
  Snacks.picker.buffers({ sort_mru = true, current = false })
end, { desc = "Buffer picker" })
map("n", "<leader>fb", function()
  Snacks.picker.buffers({ sort_mru = true, current = false })
end, { desc = "Find buffers" })
-- Buffer close/management keymaps are in bufferline.lua
-- map("n", "<leader>bd", function()
--   require("utils.window").safe_buf_action(function()
--     require("nvchad.tabufline").close_buffer()
--   end)()
-- end, { desc = "Close buffer" })
-- map("n", "<leader>bo", ":%bd|e#|bd#<cr>", { desc = "Close other buffers" })
-- map("n", "<leader>bh", ":%bd|e#<cr>", { desc = "Close hidden buffers" })
-- map("n", "<leader>bl", ":%bd|e#<cr>", { desc = "Close hidden buffers (alt)" })

--------------------------------------------------------
-- Quickfix
--------------------------------------------------------
map("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<C-m>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix item" })
map("n", "<leader>q", "<cmd>copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>a", "<cmd>cclose<CR>", { desc = "Close quickfix" })

--------------------------------------------------------
-- Search
--------------------------------------------------------
-- <Esc> nohl already in custom.lua
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })
map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Live grep" })
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "Find words (grep)" })
map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Find help" })

--------------------------------------------------------
-- Diagnostics
--------------------------------------------------------
map("n", "<leader>d", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostic picker" })
map("n", "<leader>dd", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show diagnostic float" })
map("n", "<leader>dl", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostics to loclist" })

--------------------------------------------------------
-- Git
--------------------------------------------------------
-- <leader>gg LazyGit already in git.lua
-- <leader>gd was MiniDiff in old, but new uses DiffviewOpen (in git.lua) - keeping new
-- map("n", "<leader>gd", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "Toggle MiniDiff" })

--------------------------------------------------------
-- File explorer (nvim-tree)
--------------------------------------------------------
local function safe_tree_toggle()
  local ok, api = pcall(require, "nvim-tree.api")
  if not ok then
    vim.cmd("NvimTreeToggle")
    return
  end
  -- Close existing tree buffer if it exists but is in a broken state
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("NvimTree_") and not api.tree.is_visible() then
      pcall(vim.api.nvim_buf_delete, buf, { force = true })
    end
  end
  api.tree.toggle()
end

map("n", "<leader>e", safe_tree_toggle, { desc = "Toggle file explorer" })
map("n", "<leader>ee", safe_tree_toggle, { desc = "Toggle file explorer" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find file in explorer" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse explorer" })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh explorer" })

--------------------------------------------------------
-- Window management
--------------------------------------------------------
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>we", "<C-w>=", { desc = "Equal window sizes" })
map("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Window right" })

--------------------------------------------------------
-- Tabs (old leader-based, complementing new tn/tq style)
--------------------------------------------------------
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Prev tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open file in new tab" })

--------------------------------------------------------
-- Increment/decrement numbers
--------------------------------------------------------
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

--------------------------------------------------------
-- Toggle options
--------------------------------------------------------
map("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })
map("n", "<leader>us", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })

--------------------------------------------------------
-- Reload config
--------------------------------------------------------
map("n", "<leader>R", "<cmd>source ~/.config/nvim/init.lua<CR>", { desc = "Reload config" })

--------------------------------------------------------
-- Mason
--------------------------------------------------------
map("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Open Mason" })

--------------------------------------------------------
-- Terminal (commented out - NvChad terminal no longer available)
-- Use toggleterm or snacks terminal instead
--------------------------------------------------------
-- map({ "n", "t" }, "<leader>tt", function()
--   require("nvchad.term").toggle({ pos = "float", id = "personal_term" })
-- end, { desc = "Toggle floating terminal" })
-- map("n", "<leader>th", function()
--   require("nvchad.term").toggle({ pos = "sp", id = "personal_term_h", size = 0.3 })
-- end, { desc = "Toggle horizontal terminal" })
-- map("n", "<leader>tv", function()
--   require("nvchad.term").toggle({ pos = "vsp", id = "personal_term_v", size = 0.4 })
-- end, { desc = "Toggle vertical terminal" })

-- Terminal navigation (keep these)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: window left" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: window down" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: window up" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: window right" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal: exit to normal" })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal: exit to normal" })

--------------------------------------------------------
-- Spelling suggestions (adapted from MiniPick to Snacks)
--------------------------------------------------------
map("n", "<leader>s", function()
  local word = vim.fn.expand("<cword>")
  local suggestions = vim.fn.spellsuggest(word, 25)
  vim.ui.select(suggestions, {
    prompt = "Spelling: " .. word,
  }, function(item)
    if item then
      vim.schedule(function()
        vim.cmd("normal! ciw" .. item)
        vim.cmd("stopinsert")
      end)
    end
  end)
end, { desc = "Spelling suggestions" })

--------------------------------------------------------
-- Editing
--------------------------------------------------------
map("n", "J", "mzJ`z", { desc = "Join line (keep cursor)" })
map("n", "YY", "va{Vy", { desc = "Yank block { }" })
-- map("x", "p", '"_dP', { desc = "Paste without yank" }) -- already in custom.lua

--------------------------------------------------------
-- Insert mode
--------------------------------------------------------
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {
  expr = true,
  noremap = true,
  silent = true,
  desc = "Completion next / C-j",
})
map("i", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {
  expr = true,
  noremap = true,
  silent = true,
  desc = "Completion prev / C-k",
})

--------------------------------------------------------
-- Visual mode
--------------------------------------------------------
-- < and > with reselect already in custom.lua
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
