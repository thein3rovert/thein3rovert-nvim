# Neovim Keymaps Reference

## Core Keymaps

### General
| Keymap | Function |
|--------|----------|
| `jk` (insert) | Exit insert mode |
| `<leader>nh` | Clear search highlights |

### Numbers
| Keymap | Function |
|--------|----------|
| `<leader>+` | Increment number |
| `<leader>-` | Decrement number |

### Window Management
| Keymap | Function |
|--------|----------|
| `<leader>wv` | Split window vertically |
| `<leader>ws` | Split window horizontally |
| `<leader>we` | Make splits equal size |
| `<leader>wd` | Close current split |

### Window Navigation
| Keymap | Function |
|--------|----------|
| `<leader>wh` | Go to left window |
| `<leader>wj` | Go to bottom window |
| `<leader>wk` | Go to top window |
| `<leader>wl` | Go to right window |

### Tab Management
| Keymap | Function |
|--------|----------|
| `<leader>to` | Open new tab |
| `<leader>tx` | Close current tab |
| `<leader>tn` | Go to next tab |
| `<leader>tp` | Go to previous tab |
| `<leader>tf` | Open current buffer in new tab |

---

## Telescope (Fuzzy Finder)

| Keymap | Function |
|--------|----------|
| `<leader><leader>` | Find files |
| `<leader>ff` | Find files in cwd |
| `<leader>fr` | Find recent files |
| `<leader>/` | Live grep (search string) |
| `<leader>fc` | Grep string under cursor |
| `<leader>fb` | Find buffers |
| `<leader>,` | Switch buffer |
| `<leader>ft` | Find todos |
| `<leader>fk` | Find keymaps |
| `<leader>fp` | Find plugin files |

### Inside Telescope (Insert Mode)
| Keymap | Function |
|--------|----------|
| `<C-j>` | Next result |
| `<C-k>` | Previous result |
| `<C-q>` | Send to quickfix list |

---

## File Explorer (NvimTree)

| Keymap | Function |
|--------|----------|
| `<leader>e` | Toggle file explorer |
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Find current file in explorer |
| `<leader>ec` | Collapse file explorer |
| `<leader>er` | Refresh file explorer |

---

## Buffers (Bufferline)

### Navigation
| Keymap | Function |
|--------|----------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `[b` | Previous buffer |
| `]b` | Next buffer |

### Management
| Keymap | Function |
|--------|----------|
| `<leader>bd` | Delete buffer |
| `<leader>bD` | Force delete buffer |
| `<leader>bo` | Close other buffers |
| `<leader>bl` | Close buffers to the left |
| `<leader>br` | Close buffers to the right |
| `<leader>bp` | Pin buffer |
| `<leader>bm` | Move buffer left |
| `<leader>bM` | Move buffer right |

---

## Terminal (ToggleTerm)

| Keymap | Function |
|--------|----------|
| `<C-\>` | Toggle terminal |
| `<leader>tt` | Toggle floating terminal |
| `<leader>th` | Toggle horizontal terminal |
| `<leader>tv` | Toggle vertical terminal |

### Inside Terminal
| Keymap | Function |
|--------|----------|
| `<Esc>` | Exit terminal mode |
| `<C-h/j/k/l>` | Navigate to other windows |

---

## Code (LSP)

| Keymap | Function |
|--------|----------|
| `<leader>cr` | Show references |
| `<leader>cd` | Show definition / line diagnostics |
| `<leader>cD` | Go to declaration / buffer diagnostics |
| `<leader>ci` | Show implementations |
| `<leader>ct` | Show type definitions |
| `<leader>ca` | Code actions |
| `<leader>cn` | Rename symbol |
| `<leader>cR` | Restart LSP |
| `K` | Show hover documentation |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

---

## Git

### Navigation
| Keymap | Function |
|--------|----------|
| `]h` | Next hunk |
| `[h` | Previous hunk |

### Actions
| Keymap | Function |
|--------|----------|
| `<leader>gg` | Open LazyGit |
| `<leader>gs` | Git stage hunk |
| `<leader>gr` | Git reset hunk |
| `<leader>gS` | Git stage buffer |
| `<leader>gR` | Git reset buffer |
| `<leader>gu` | Git undo stage hunk |
| `<leader>gp` | Git preview hunk |
| `<leader>gb` | Git blame line |
| `<leader>gB` | Git toggle line blame |
| `<leader>gd` | Git diff this |
| `<leader>gD` | Git diff this ~ |

---

## Trouble (Diagnostics)

| Keymap | Function |
|--------|----------|
| `<leader>xx` | Toggle workspace diagnostics |
| `<leader>xd` | Toggle document diagnostics |
| `<leader>xq` | Toggle quickfix list |
| `<leader>xl` | Toggle location list |
| `<leader>xt` | Toggle todos |

---

## Notifications (Noice)

| Keymap | Function |
|--------|----------|
| `<leader>nd` | Dismiss notifications |
| `<leader>nh` | Notification history |

---

## Todo Comments

| Keymap | Function |
|--------|----------|
| `]t` | Next todo comment |
| `[t` | Previous todo comment |

---

## Substitute

| Keymap | Function |
|--------|----------|
| `<leader>r` | Substitute with motion |
| `<leader>rr` | Substitute line |
| `<leader>R` | Substitute to end of line |

---

## Formatting & Linting

| Keymap | Function |
|--------|----------|
| `<leader>mp` | Format file or range |
| `<leader>l` | Trigger linting |

---

## Sessions (Auto-Session)

| Keymap | Function |
|--------|----------|
| `<leader>wr` | Restore session for cwd |
| `<leader>ws` | Save session |

---

## Splits

| Keymap | Function |
|--------|----------|
| `<leader>sm` | Maximize/minimize split |

---

## Completion (nvim-cmp)

| Keymap | Function |
|--------|----------|
| `<C-j>` | Next suggestion |
| `<C-k>` | Previous suggestion |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |
| `<C-Space>` | Show suggestions |
| `<C-e>` | Close completion |
| `<CR>` | Confirm selection |

---

## Treesitter Text Objects

### Selection
| Keymap | Function |
|--------|----------|
| `af` | Select outer function call |
| `if` | Select inner function call |
| `am` | Select outer method/function |
| `im` | Select inner method/function |
| `ac` | Select outer class |
| `ic` | Select inner class |
| `ai` | Select outer conditional |
| `ii` | Select inner conditional |
| `al` | Select outer loop |
| `il` | Select inner loop |
| `a=` | Select outer assignment |
| `i=` | Select inner assignment |

### Navigation
| Keymap | Function |
|--------|----------|
| `]f` | Next function call |
| `[f` | Previous function call |
| `]m` | Next method/function |
| `[m` | Previous method/function |
| `]c` | Next class |
| `[c` | Previous class |

### Swap
| Keymap | Function |
|--------|----------|
| `<leader>na` | Swap argument with next |
| `<leader>pa` | Swap argument with previous |
| `<leader>nm` | Swap function with next |
| `<leader>pm` | Swap function with previous |

---

## Surround (nvim-surround)

| Keymap | Function |
|--------|----------|
| `ys{motion}{char}` | Add surround |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |

Examples:
- `ysiw"` - Surround word with quotes
- `ds"` - Delete surrounding quotes
- `cs"'` - Change " to '
