# Language Configuration

Each file in this directory configures LSP servers, formatters, and linters for a specific language or framework.

## Structure

```lua
return {
  lsp = {
    "server_name", -- LSP server
  },
  formatters = {
    "formatter_name", -- Code formatter
  },
  linters = {
    "linter_name", -- Code linter
  },
}
```

## How to Disable a Language

To disable a language completely:
1. Simply delete or rename the file (e.g., `mv python.lua python.lua.disabled`)
2. Restart Neovim or run `:Lazy sync`

## How to Disable Specific Tools

To disable only formatters or linters for a language:
1. Open the language file
2. Set the array to empty: `formatters = {},` or `linters = {},`
3. Restart Neovim

## Available Languages

- `typescript.lua` - JavaScript/TypeScript (vtsls, eslint, prettier)
- `python.lua` - Python (pyright, black, isort, pylint)
- `lua.lua` - Lua (lua_ls, stylua)
- `web.lua` - HTML/CSS/Tailwind (html, cssls, tailwindcss, emmet_ls)
- `svelte.lua` - Svelte framework
- `graphql.lua` - GraphQL
- `prisma.lua` - Prisma ORM
- `nix.lua` - Nix language
- `ansible.lua` - Ansible automation

## Adding a New Language

Create a new file like `rust.lua`:

```lua
-- Rust language
return {
  lsp = {
    "rust_analyzer", -- Rust LSP
  },
  formatters = {
    "rustfmt", -- Rust formatter
  },
  linters = {},
}
```

Then restart Neovim and the tools will be automatically installed.
