-- JavaScript/TypeScript language servers and tools
return {
  lsp = {
    "vtsls", -- TypeScript/JavaScript LSP
    "eslint", -- ESLint LSP
  },
  formatters = {
    "prettier", -- JavaScript/TypeScript formatter
    "eslint_d", -- ESLint daemon for faster linting
  },
  linters = {
    "eslint_d",
  },
}
