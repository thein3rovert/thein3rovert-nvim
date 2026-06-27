local M = {}

function M.setup(capabilities)
  vim.lsp.config("nixd", {
    capabilities = capabilities,
    settings = {
      nixd = {
        formatting = {
          command = { "nixfmt" },
        },
      },
    },
  })
end

return M
