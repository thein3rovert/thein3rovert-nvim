return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    -- Configure nvim-notify timeout
    require("notify").setup({
      timeout = 2000, -- 2 seconds (adjust to your preference: 1000 = 1 second)
      stages = "fade", -- Animation style
      render = "default",
      background_colour = "#000000",
      max_width = 50,
      max_height = 10,
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss notifications" })
    keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "Notification history" })
  end,
}
