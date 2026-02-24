-- Terraform infrastructure as code
return {
  lsp = {
    "terraformls", -- Terraform LSP (includes formatting)
  },
  formatters = {},
  linters = {
    "tflint", -- Terraform linter
  },
}
