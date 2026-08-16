return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  init = function()
    -- Track the last window before opening nvim-tree
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.bo.filetype ~= "NvimTree" then
          vim.g.nvim_tree_last_window = vim.api.nvim_get_current_win()
        end
      end,
    })
  end,
  opts = function()
    return {
      filters = {
        dotfiles = false,
        git_ignored = false,
        custom = { "assets", "node_modules", ".cache", "__pycache__", ".obsidian" },
      },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 40,
        side = "left",
        preserve_window_proportions = true,
      },

      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
            picker = function()
              -- Use the last window we were in
              local last_win = vim.g.nvim_tree_last_window
              if last_win and vim.api.nvim_win_is_valid(last_win) then
                return last_win
              end
              return vim.api.nvim_get_current_win()
            end,
          },
        },
      },

      git = {
        enable = true, -- Re-enabled (wasn't the issue)
        ignore = true, -- Respect .gitignore (from main)
        show_on_dirs = true, -- Show git status on directories
        timeout = 400,
      },

      diagnostics = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },

      renderer = {
        group_empty = true,
        root_folder_label = false,
        highlight_git = "name", -- Highlight filename for git changes
        highlight_opened_files = "none", -- Don't highlight opened files
        highlight_modified = "none", -- Don't highlight modified files  
        special_files = {}, -- Don't highlight special/executable files
        indent_markers = { enable = true },
        icons = {
          git_placement = "after",
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "󰈚",
            git = {
              -- Icon symbols from main branch
              unstaged = "●",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "✗",
              ignored = "◌",
              
              -- Letter symbols from experimental (commented out)
              -- unstaged = "M",
              -- staged = "S",
              -- unmerged = "",
              -- renamed = "R",
              -- untracked = "U",
              -- deleted = "D",
              -- ignored = "",
            },
          },
        },
      },

      on_attach = function(bufnr)
        local map = vim.keymap.set
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "r", function()
          local node = api.tree.get_node_under_cursor()
          if not node or node.name == ".." then
            return
          end

          local old_path = node.absolute_path
          local old_name = vim.fs.basename(old_path)

          vim.ui.input({ prompt = "Rename to: ", default = old_name }, function(input)
            if not input or input == "" or input == old_name then
              return
            end
            Snacks.rename.rename_file({
              from = old_path,
              to = vim.fs.joinpath(vim.fs.dirname(old_path), input),
            })
          end)
        end, { buffer = bufnr })

        map("n", "<ESC>", "<nop>", { buffer = bufnr, desc = "fucking nothing" })
        map("n", "<C-S-Up>", api.node.show_info_popup, { buffer = bufnr, desc = "Info" })
        map("n", "<C-]>", api.tree.change_root_to_node, { buffer = bufnr, desc = "cd" })
        map("n", "<C-[>", api.tree.change_root_to_parent, { buffer = bufnr, desc = "cd .." })
      end,
    }
  end,

  keys = {
    { "<M-e>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
}
