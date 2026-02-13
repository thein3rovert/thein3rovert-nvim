return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      sync_root_with_cwd = false,
      respect_buf_cwd = false,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 50,
        relativenumber = true,
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 400,
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {
          "node_modules",
          ".git",
          "target",
          "dist",
          "build",
        },
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_git = "name",
        root_folder_label = false,
        icons = {
          git_placement = "after",
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = false,
          },
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
            git = {
              unstaged = "●",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "✗",
              ignored = "◌",
            },
          },
        },
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}
