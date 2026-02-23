return {
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  on_attach = function(client, bufnr)
    -- Disable ESLint diagnostics (only use for formatting/code actions)
    client.server_capabilities.diagnosticProvider = false
  end,
}
