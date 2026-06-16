# Neovim Config

Personal Neovim config. Lua-based, lazy.nvim for plugin management.

## Philosophy

- **Minimum plugins.** If a mini.nvim module covers the need, use it. If a few lines of Lua cover it, use that. Never add a new plugin for something already solvable with what's installed.
- **Touch only what was asked.** Don't refactor surrounding code when fixing one thing. Smallest diff that works.
- **Keymaps in one place.** Global/normal-mode keymaps → `lua/core/keymaps.lua`. Insert-mode/completion keymaps → the `mini.keymap` block in `lua/plugins/mini-nvim.lua`.

## Structure

```
lua/
  core/
    options.lua      # vim options
    keymaps.lua      # all global keymaps (leader, normal, visual)
    autocmds.lua     # autocommands
  plugins/
    mini-nvim.lua    # all mini.nvim modules (including mini.keymap for insert-mode keys)
    lsp.lua          # LSP servers (mason + nvim-lspconfig)
    formatting.lua   # conform.nvim formatters
    treesitter.lua   # treesitter parsers + nvim-ts-autotag
    fzf.lua          # fzf-lua finder
    colorscheme.lua  # tokyonight
    oil.lua          # file explorer
    markdown.lua     # render-markdown + markdown-preview
    typst.lua        # typst-preview
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| mini.ai | Better text objects |
| mini.icons | File icons |
| mini-git | Git integration |
| mini.diff | Diff view in buffer |
| mini.comment | `gc` comments |
| mini.pairs | Auto-pairs |
| mini.surround | Surround motions |
| mini.jump | `f`/`t` extended jumps |
| mini.statusline | Status line |
| mini.keymap | Insert-mode multistep keymaps (Tab/CR/BS) |
| mini.completion | LSP completion (pmenu) |
| mini.clue | Which-key style hints |
| mini.bufremove | Clean buffer close |
| nvim-lspconfig | LSP client configs |
| mason.nvim | LSP/formatter installer |
| conform.nvim | Formatting (prettier, stylua, etc.) |
| nvim-treesitter | Syntax + indent |
| nvim-ts-autotag | Auto-close HTML/JSX tags |
| fzf-lua | Fuzzy finder |
| tokyonight.nvim | Color scheme |
| oil.nvim | File explorer (open with `-`) |
| render-markdown.nvim | In-buffer markdown rendering |
| markdown-preview.nvim | Browser markdown preview |
| typst-preview.nvim | Typst preview |

## Key bindings (highlights)

- `<Space>` — leader
- `<Tab>` / `<S-Tab>` — navigate completion menu (insert mode)
- `<CR>` — accept completion or smart newline with pairs
- `<leader>f*` — fzf-lua finders
- `<leader>c*` — LSP actions (rename, action, format)
- `-` — open Oil file explorer
- `<leader>y` / `<leader>Y` — yank to system clipboard

## Verification after changes

1. `nvim` → `:Lazy` — no errors, expected plugins listed
2. `:messages` — no startup errors
3. Insert mode + LSP active → Tab cycles completion items, S-Tab reverses
4. `<CR>` accepts completion; `<BS>` handles auto-pairs correctly
