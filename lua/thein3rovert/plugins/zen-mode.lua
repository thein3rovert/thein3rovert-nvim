return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 0.95,
      width = 120, -- width of the Zen window
      height = 1, -- height of the Zen window (1 = 100%)
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = false },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      kitty = {
        enabled = false,
        font = "+4",
      },
    },
    on_open = function()
      -- disable diagnostics
      vim.diagnostic.config({ virtual_text = false })
    end,
    on_close = function()
      -- re-enable diagnostics
      vim.diagnostic.config({ virtual_text = true })
    end,
  },
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen mode" },
  },
}
