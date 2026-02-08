return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions (g = git)
      map("n", "<leader>gs", gs.stage_hunk, "Git stage hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Git reset hunk")
      map("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Git stage hunk")
      map("v", "<leader>gr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Git reset hunk")

      map("n", "<leader>gS", gs.stage_buffer, "Git stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Git reset buffer")

      map("n", "<leader>gu", gs.undo_stage_hunk, "Git undo stage hunk")

      map("n", "<leader>gp", gs.preview_hunk, "Git preview hunk")

      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, "Git blame line")
      map("n", "<leader>gB", gs.toggle_current_line_blame, "Git toggle line blame")

      map("n", "<leader>gd", gs.diffthis, "Git diff this")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Git diff this ~")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}
