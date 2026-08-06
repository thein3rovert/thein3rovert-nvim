local M = {}

function M.setup(capabilities)
  -- nixd (better diagnostics and NixOS-specific features)
  vim.lsp.config("nixd", {
    capabilities = capabilities,
    settings = {
      nixd = {
        formatting = {
          command = { "nixfmt" },
        },
        options = {
          -- Uncomment and adjust for your NixOS config path
          -- nixos = {
          --   expr = '(builtins.getFlake "/home/thein3rovert/nixos-config").nixosConfigurations.nixos.options',
          -- },
          -- home_manager = {
          --   expr = '(builtins.getFlake "/home/thein3rovert/nixos-config").homeConfigurations."thein3rovert@nixos".options',
          -- },
        },
      },
    },
  })

  -- nil_ls (commented out in favor of nixd)
  -- vim.lsp.config("nil_ls", {
  --   capabilities = capabilities,
  --   settings = {
  --     ["nil"] = {
  --       formatting = {
  --         command = { "nixfmt" },
  --       },
  --     },
  --   },
  -- })
end

return M
