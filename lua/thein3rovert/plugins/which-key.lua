return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  -- init = function()
  --   vim.o.timeout = true
  --   vim.o.timeoutlen = 500
  -- end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = "helix",
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>b", group = "Buffers" },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>m", group = "Format" },
      { "<leader>n", group = "Notifications" },
      { "<leader>t", group = "Tabs/Terminal" },
      { "<leader>u", group = "UI" },
      { "<leader>w", group = "Window/Workspace" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
