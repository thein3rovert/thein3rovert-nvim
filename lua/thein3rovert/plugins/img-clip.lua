return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = "assets",
      relative_to_current_file = false,
      prompt_for_file_name = false,
      file_name = "%Y-%m-%d-%H-%M-%S",
    },
    filetypes = {
      markdown = {
        dir_path = "assets",
        relative_to_current_file = false,
        url_encode_path = false,
        template = "![](assets/$FILE_NAME)",
        prompt_for_file_name = false,
        file_name = function()
          local filename = vim.fn.expand("%:t:r")
          local timestamp = os.time()
          return filename .. "-" .. timestamp
        end,
      },
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", mode = "n", desc = "Paste image from clipboard" },
  },
}
