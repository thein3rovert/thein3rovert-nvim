local M = {}

function M.setup(capabilities)
  vim.lsp.config("nil_ls", {
    capabilities = capabilities,
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixfmt" },
        },
      },
    },
  })
end

return M
