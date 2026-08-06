-- Main branch config (simpler, with icon symbols)
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ft = { "markdown" },
  opts = {
    file_types = { "markdown" },
    code = {
      sign = false,
      width = "block",
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
  },
}

-- Experimental config (commented out - has more features like LaTeX, LSP completions)
-- return {
--   "MeanderingProgrammer/render-markdown.nvim",
--   enabled = true,
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "nvim-tree/nvim-web-devicons",
--   },
--   opts = {
--     render_modes = true,
--
--     completions = {
--       lsp = {
--         enabled = true,
--       },
--     },
--
--     latex = {
--       enabled = true,
--     },
--
--     heading = {
--       atx = false,
--       icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
--     },
--
--     bullet = {
--       icons = { "-", "-", "-", "-" },
--     },
--
--     code = {
--       conceal_delimiters = true,
--     },
--
--     anti_conceal = {
--       enabled = false,
--     },
--
--     sign = {
--       enabled = false,
--     },
--
--     win_options = {
--       conceallevel = { default = vim.o.conceallevel, rendered = 3 },
--     },
--
--     link = {
--       enabled = true,
--     },
--   },
--   ft = { "copilot-chat", "markdown" },
-- }
