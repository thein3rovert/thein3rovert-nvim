return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim", -- Better buffer deletion
  },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    local keymap = vim.keymap

    -- Buffer navigation
    keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
    keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
    keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

    -- Buffer management (using bufdelete to keep window open)
    keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>", { desc = "Delete buffer" })
    keymap.set("n", "<leader>bD", "<cmd>Bdelete!<cr>", { desc = "Force delete buffer" })
    keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
    keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close buffers to the left" })
    keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close buffers to the right" })
    keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })

    -- Move buffers
    keymap.set("n", "<leader>bm", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
    keymap.set("n", "<leader>bM", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
  end,
}
