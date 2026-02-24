return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Git diffview open" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Git diffview close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git file history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git repo history" },
  },
  opts = {
    diff_binaries = false,
    enhanced_diff_hl = false,
    git_cmd = { "git" },
    use_icons = true,
    show_help_hints = true,
    watch_index = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
      done = "✓",
    },
    view = {
      default = {
        layout = "diff2_horizontal",
        winbar_info = false,
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
        winbar_info = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        winbar_info = false,
      },
    },
    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "left",
        width = 35,
        win_opts = {},
      },
    },
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
      },
      win_config = {
        position = "bottom",
        height = 16,
        win_opts = {},
      },
    },
    commit_log_panel = {
      win_config = {
        win_opts = {},
      },
    },
    default_args = {
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
    hooks = {},
    keymaps = {
      disable_defaults = false,
      view = {
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
        { "n", "gf", "<cmd>DiffviewFocusFiles<cr>", { desc = "Focus the file panel" } },
        {
          "n",
          "g<C-x>",
          "<cmd>DiffviewClose<cr>",
          { desc = "Close diffview" },
        },
        {
          "n",
          "<leader>e",
          "<cmd>DiffviewToggleFiles<cr>",
          { desc = "Toggle the file panel" },
        },
      },
      diff1 = {
        { "n", "g?", "<cmd>h diffview-maps-diff1<cr>", { desc = "Open the help panel" } },
      },
      diff2 = {
        { "n", "g?", "<cmd>h diffview-maps-diff2<cr>", { desc = "Open the help panel" } },
      },
      diff3 = {
        { "n", "g?", "<cmd>h diffview-maps-diff3<cr>", { desc = "Open the help panel" } },
      },
      diff4 = {
        { "n", "g?", "<cmd>h diffview-maps-diff4<cr>", { desc = "Open the help panel" } },
      },
      file_panel = {
        { "n", "j", "<cmd>lua require'diffview.actions'.next_entry()<cr>", { desc = "Next entry" } },
        { "n", "k", "<cmd>lua require'diffview.actions'.prev_entry()<cr>", { desc = "Previous entry" } },
        { "n", "<cr>", "<cmd>lua require'diffview.actions'.select_entry()<cr>", { desc = "Select entry" } },
        { "n", "o", "<cmd>lua require'diffview.actions'.select_entry()<cr>", { desc = "Select entry" } },
        { "n", "s", "<cmd>lua require'diffview.actions'.toggle_stage_entry()<cr>", { desc = "Stage / unstage" } },
        { "n", "S", "<cmd>lua require'diffview.actions'.stage_all()<cr>", { desc = "Stage all entries" } },
        { "n", "U", "<cmd>lua require'diffview.actions'.unstage_all()<cr>", { desc = "Unstage all entries" } },
        { "n", "R", "<cmd>lua require'diffview.actions'.refresh_files()<cr>", { desc = "Refresh files" } },
        { "n", "L", "<cmd>lua require'diffview.actions'.open_commit_log()<cr>", { desc = "Open commit log" } },
        { "n", "<tab>", "<cmd>lua require'diffview.actions'.select_next_entry()<cr>", { desc = "Select next entry" } },
        { "n", "<s-tab>", "<cmd>lua require'diffview.actions'.select_prev_entry()<cr>", { desc = "Select previous entry" } },
        { "n", "gf", "<cmd>lua require'diffview.actions'.goto_file_edit()<cr>", { desc = "Go to file" } },
        { "n", "<C-w><C-f>", "<cmd>lua require'diffview.actions'.goto_file_split()<cr>", { desc = "Go to file in split" } },
        { "n", "<C-w>gf", "<cmd>lua require'diffview.actions'.goto_file_tab()<cr>", { desc = "Go to file in tab" } },
        { "n", "i", "<cmd>lua require'diffview.actions'.listing_style()<cr>", { desc = "Toggle listing style" } },
        { "n", "f", "<cmd>lua require'diffview.actions'.toggle_flatten_dirs()<cr>", { desc = "Toggle flatten dirs" } },
        { "n", "g<C-x>", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        { "n", "<leader>e", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
      },
      file_history_panel = {
        { "n", "g!", "<cmd>lua require'diffview.actions'.options()<cr>", { desc = "Options" } },
        { "n", "D", "<cmd>lua require'diffview.actions'.open_in_diffview()<cr>", { desc = "Open in diffview" } },
        { "n", "y", "<cmd>lua require'diffview.actions'.copy_hash()<cr>", { desc = "Copy commit hash" } },
        { "n", "L", "<cmd>lua require'diffview.actions'.open_commit_log()<cr>", { desc = "Open commit log" } },
        { "n", "X", "<cmd>lua require'diffview.actions'.restore_entry()<cr>", { desc = "Restore file" } },
        { "n", "zR", "<cmd>lua require'diffview.actions'.open_all_folds()<cr>", { desc = "Open all folds" } },
        { "n", "zM", "<cmd>lua require'diffview.actions'.close_all_folds()<cr>", { desc = "Close all folds" } },
        { "n", "j", "<cmd>lua require'diffview.actions'.next_entry()<cr>", { desc = "Next entry" } },
        { "n", "k", "<cmd>lua require'diffview.actions'.prev_entry()<cr>", { desc = "Previous entry" } },
        { "n", "<cr>", "<cmd>lua require'diffview.actions'.select_entry()<cr>", { desc = "Select entry" } },
        { "n", "o", "<cmd>lua require'diffview.actions'.select_entry()<cr>", { desc = "Select entry" } },
        { "n", "<tab>", "<cmd>lua require'diffview.actions'.select_next_entry()<cr>", { desc = "Select next entry" } },
        { "n", "<s-tab>", "<cmd>lua require'diffview.actions'.select_prev_entry()<cr>", { desc = "Select previous entry" } },
        { "n", "gf", "<cmd>lua require'diffview.actions'.goto_file_edit()<cr>", { desc = "Go to file" } },
        { "n", "<C-w><C-f>", "<cmd>lua require'diffview.actions'.goto_file_split()<cr>", { desc = "Go to file in split" } },
        { "n", "<C-w>gf", "<cmd>lua require'diffview.actions'.goto_file_tab()<cr>", { desc = "Go to file in tab" } },
        { "n", "g<C-x>", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        { "n", "<leader>e", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
      },
      option_panel = {
        { "n", "<tab>", "<cmd>lua require'diffview.actions'.select_entry()<cr>", { desc = "Select entry" } },
        { "n", "q", "<cmd>lua require'diffview.actions'.close()<cr>", { desc = "Close" } },
        { "n", "g?", "<cmd>h diffview-maps-option<cr>", { desc = "Open the help panel" } },
      },
      help_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        { "n", "<esc>", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
    },
  },
}
