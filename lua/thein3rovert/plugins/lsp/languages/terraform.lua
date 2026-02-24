-- Terraform infrastructure as code
return {
  lsp = {
    "terraformls", -- Terraform LSP
  },
  formatters = {
    "terraform_fmt", -- Terraform formatter
  },
  linters = {
    "tflint", -- Terraform linter
  },
}
