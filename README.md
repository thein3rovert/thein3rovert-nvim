# Neovim Configuration

This is a custom Neovim configuration based on the Josean Martinez setup, optimized for web development and general programming.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Directory Structure](#directory-structure)
- [Key Mappings](#key-mappings)
- [Plugins Overview](#plugins-overview)
- [LSP Configuration](#lsp-configuration)
- [Common Issues & Fixes](#common-issues--fixes)
- [Customization Guide](#customization-guide)

## Overview

This configuration uses:

- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP**: Native Neovim LSP with Mason for server management
- **Completion**: nvim-cmp with multiple sources
- **Fuzzy Finder**: Telescope
- **Syntax Highlighting**: Treesitter
- **Status Line**: lualine
- **File Explorer**: nvim-tree

## Key Features

**Web Development**: Full support for TypeScript, React, Vue, Svelte, HTML, CSS, Tailwind

- **Python Development**: Black formatter, pylint linter, pyright LSP
- **Git Integration**: Gitsigns for inline git blame and diff viewing
- **Fuzzy Finding**: Telescope for files, buffers, grep, and more
- **Code Navigation**: LSP-based go-to-definition, references, diagnostics
- **AI Assistance**: GitHub Copilot integration
- **Linting & Formatting**: Automatic formatting on save

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin lockfile (auto-generated)
├── lua/
│   └── josean/
│       ├── lazy.lua           # Plugin manager setup
│       ├── lsp.lua            # LSP configuration
│       └── plugins/           # Plugin configurations
│           ├── ai.lua         # GitHub Copilot
│           ├── gitsigns.lua   # Git integration
│           ├── linting.lua    # Linters configuration
│           ├── lualine.lua    # Status line
│           ├── substitute.lua # Text substitution
│           ├── treesitter.lua # Syntax highlighting
│           └── lsp/           # LSP-specific plugins
│               └── mason.lua  # Mason setup
└── after/
    ├── lsp/                   # LSP server configs
    │   ├── emmet_ls.lua
    │   ├── eslint.lua
    │   ├── graphql.lua
    │   └── svelte.lua
    └── queries/               # Treesitter queries
        └── ecma/
            └── textobjects.scm
```

## Key Mappings

### General

- `<leader>` = Space key
- **Which-Key**: Press `<leader>` (space) and wait to see a popup with all available keymaps. LSP keymaps (like code actions, rename, go to definition) only appear when you have an LSP server active in the current buffer.

### File Navigation (press `<leader>f` to see telescope keymaps)

- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>e` - Toggle file explorer (nvim-tree)

### LSP (press `f` to see all LSP finder keymaps)

- `fr` - Find LSP references
- `fd` - Go to definition
- `fD` - Go to declaration
- `fi` - Show implementations
- `ft` - Show type definitions
- `K` - Show hover documentation
- `<leader>ca` - Code action
- `<leader>rn` - Rename symbol
- `[d` / `]d` - Previous/next diagnostic
- `<leader>d` - Show line diagnostics
- `<leader>D` - Show buffer diagnostics
- `<leader>rs` - Restart LSP

### Git

- `]c` / `[c` - Next/previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line

### Text Manipulation

- `s` - Substitute text (motion)
- `ss` - Substitute line
- `S` - Substitute to end of line
- `<leader>s` - Substitute in visual mode

### Window Management

- `<C-h/j/k/l>` - Navigate between windows
- `<leader>wv` - Split vertical
- `<leader>wh` - Split horizontal
- `<leader>we` - Make splits equal
- `<leader>wd` - Close split

### Tabs

- `<leader>to` - Open new tab
- `<leader>tx` - Close tab
- `<leader>tn` - Next tab
- `<leader>tp` - Previous tab

## Plugins Overview

### Core Plugins

1. **lazy.nvim** - Plugin manager
2. **plenary.nvim** - Lua utilities (required by many plugins)

### LSP & Completion

1. **mason.nvim** - Manage LSP servers, DAP servers, linters, and formatters
2. **mason-lspconfig.nvim** - Bridge between Mason and lspconfig
3. **mason-tool-installer.nvim** - Auto-install tools
4. **nvim-lspconfig** - LSP configuration
5. **nvim-cmp** - Completion engine
   - cmp-buffer
   - cmp-path
   - cmp-cmdline
   - cmp-nvim-lsp
   - LuaSnip (snippet engine)
   - cmp_luasnip
   - friendly-snippets

### Navigation & Search

1. **telescope.nvim** - Fuzzy finder
   - telescope-fzf-native.nvim
   - telescope-ui-select.nvim
2. **nvim-tree.lua** - File explorer
3. **nvim-web-devicons** - File icons
4. **which-key.nvim** - Keymap helper (press `<leader>` and wait to see available keymaps)

### Code Enhancement

1. **nvim-treesitter** - Syntax highlighting and code parsing
2. **nvim-treesitter-textobjects** - Text objects based on syntax
3. **gitsigns.nvim** - Git decorations
4. **comment.nvim** - Easy commenting
5. **nvim-autopairs** - Auto-close brackets/quotes
6. **nvim-surround** - Surround text objects
7. **indent-blankline.nvim** - Indentation guides

### UI

1. **lualine.nvim** - Status line
2. **bufferline.nvim** - Buffer tabs
3. **catppuccin** - Color scheme
4. **dressing.nvim** - Better UI for select/input
5. **noice.nvim** - Better UI for messages, cmdline, popupmenu
6. **notify.nvim** - Better notifications

### Tools

1. **conform.nvim** - Code formatting
2. **nvim-lint** - Linting
3. **copilot.lua** - GitHub Copilot integration
4. **todo-comments.nvim** - Highlight TODO comments
5. **trouble.nvim** - Diagnostics list

## LSP Configuration

### Installed Language Servers

- **ts_ls** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **tailwindcss** - Tailwind CSS
- **svelte** - Svelte
- **lua_ls** - Lua
- **graphql** - GraphQL
- **emmet_ls** - Emmet abbreviation expansion
- **prismals** - Prisma ORM
- **pyright** - Python
- **eslint** - ESLint

### Installed Formatters

- **prettier** - JavaScript/TypeScript/CSS/HTML/JSON/Markdown/YAML
- **stylua** - Lua
- **isort** - Python imports
- **black** - Python code

### Installed Linters

- **pylint** - Python
- **eslint_d** - JavaScript/TypeScript (faster than eslint)

## Common Issues & Fixes

### Issue: Treesitter compatibility errors with Telescope

**Error**: `attempt to call field 'ft_to_lang' (a nil value)` or `attempt to call field 'is_enabled' (a nil value)`

**Cause**: nvim-treesitter 1.0+ removed several API functions (`ft_to_lang`, `is_enabled`, `get_module`), but telescope.nvim and other plugins still use them.

**Fix**: Pinned nvim-treesitter to version v0.9.3 (before the 1.0 breaking changes) by adding `tag = "v0.9.3"` to the treesitter plugin config. This maintains compatibility with telescope.nvim and other plugins that use the old API.

### Issue: Mason packages fail to install

**Error**: Python tools (black, pylint) fail to install

**Cause**: `python3-venv` package is not installed on Ubuntu/Debian systems.

**Fix**:

```bash
sudo apt install python3-venv python3-pip
```

### Issue: Mason repository URL warnings

**Warning**: Repository moved from `mason-org` to `williamboman`

**Fix**: Run `:Lazy update` or manually update git remotes:

```bash
cd ~/.local/share/nvim/lazy/mason.nvim
git remote set-url origin https://github.com/williamboman/mason.nvim.git

cd ~/.local/share/nvim/lazy/mason-lspconfig.nvim
git remote set-url origin https://github.com/williamboman/mason-lspconfig.nvim.git
```

### Issue: Treesitter module not found

**Error**: `module 'nvim-treesitter.configs' not found`

**Cause**: The module was renamed from `configs` to `config` in newer versions.

**Fix**: Updated require statement from `require("nvim-treesitter.configs")` to `require("nvim-treesitter.config")`.

## Customization Guide

### Adding a New Language Server

1. Edit `~/.config/nvim/lua/josean/plugins/lsp/mason.lua`
2. Add the server name to `ensure_installed` in the `mason-lspconfig` section
3. Restart Neovim
4. Run `:Mason` to install the server

Example:

```lua
ensure_installed = {
  "ts_ls",
  "html",
  -- ... existing servers
  "rust_analyzer", -- add new server here
}
```

### Adding a New Formatter

1. Edit `~/.config/nvim/lua/josean/plugins/lsp/mason.lua`
2. Add the formatter to `ensure_installed` in the `mason-tool-installer` section
3. Configure it in `~/.config/nvim/lua/josean/plugins/formatting.lua` (if exists) or create conform.nvim config

Example:

```lua
ensure_installed = {
  "prettier",
  "stylua",
  -- ... existing formatters
  "rustfmt", -- add new formatter here
}
```

### Changing the Color Scheme

1. Find a colorscheme plugin you like (e.g., `folke/tokyonight.nvim`)
2. Add it to your plugins folder
3. Set it in your init.lua or main config file

Example plugin config:

```lua
return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme tokyonight")
  end,
}
```

### Adding Custom Keymaps

Edit the appropriate file in `~/.config/nvim/lua/josean/plugins/` or create a new file for keymaps.

Example:

```lua
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })
```

### Backup and Restore

**Backup current config**:

```bash
cp -r ~/.config/nvim ~/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)
```

**Restore from backup**:

```bash
rm -rf ~/.config/nvim
mv ~/.config/nvim-backup-20260205-163702 ~/.config/nvim
```

## Useful Commands

- `:Lazy` - Open plugin manager
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Sync plugins (install/update/clean)
- `:Mason` - Open Mason package manager
- `:LspInfo` - Show LSP status
- `:checkhealth` - Check Neovim health
- `:TSInstall <language>` - Install treesitter parser
- `:TSUpdate` - Update all treesitter parsers

## Resources

- [Neovim documentation](https://neovim.io/doc/)
- [Lazy.nvim documentation](https://lazy.folke.io/)
- [Mason.nvim documentation](https://github.com/williamboman/mason.nvim)
- [nvim-treesitter documentation](https://github.com/nvim-treesitter/nvim-treesitter)
- [Telescope.nvim documentation](https://github.com/nvim-telescope/telescope.nvim)

## License

This configuration is based on Josean Martinez's Neovim setup. Feel free to modify and use it as you like!
