# Neovim Configuration - AI Coding Instructions

## Architecture Overview

This is a personal Neovim config using **lazy.nvim** plugin manager with a modular structure:

```
init.lua           → Entry point (loads config/lazy.lua)
lua/config/
  lazy.lua         → Plugin manager setup, imports plugins/*.lua
  keymaps.lua      → Global keybindings (Telescope, window nav, Flutter)
  options.lua      → Editor options, autocmds
lua/plugins/
  lsp-config.lua   → LSP, completion (blink.cmp), formatting (conform), treesitter
  ui.lua           → UI plugins (lualine, neo-tree, bufferline, colorschemes)
  qol.lua          → QoL utilities (snacks.nvim, toggleterm, mini.*, multicursor)
  extras.lua       → Language-specific (flutter-tools, LuaSnip)
```

## Plugin Configuration Patterns

- Return an **array of plugin specs** from each `lua/plugins/*.lua` file
- Use `opts = {}` for simple configurations (lazy.nvim auto-calls `.setup(opts)`)
- Use `config = function()` only for complex setup requiring custom logic
- Lazy-load with `event`, `cmd`, `ft`, or `keys` where possible

Example pattern:
```lua
return {
  { "plugin/name", opts = { setting = value } },
  { "complex/plugin", config = function() ... end },
}
```

## Code Style

- **2-space indentation** for all Lua files
- Leader: `<Space>`, LocalLeader: `\`
- Keymap descriptions follow `[X]word [Y]word` pattern (e.g., `[S]earch [F]iles`)
- Use `vim.keymap.set()` with `desc` for discoverability via which-key

## Key Integrations

| Component | Plugin | Notes |
|-----------|--------|-------|
| Completion | blink.cmp | "enter" preset, LSP + snippets via LuaSnip |
| Formatting | conform.nvim | Format-on-save enabled, `stylua` for Lua |
| File Explorer | neo-tree | Opens on right (`<C-n>`), space remapped |
| Fuzzy Finder | Telescope + Snacks.picker | Both available, Snacks for most keybinds |
| Terminal | toggleterm (`<A-i>`) + Snacks.terminal (`<C-/>`) | Float mode |

## Language-Specific Support

- **Flutter/Dart**: flutter-tools.nvim with keymaps `<C-f>o/r/l`
- **Godot/GDScript**: vim-godot + gdscript treesitter, LSP via native `gdscript` config
- **Lua**: lazydev.nvim for Neovim API completion, stylua formatting

## UI Conventions

- **Transparent mode enabled** via transparent.nvim (gruvbox theme)
- Centered scrolling: movements (`hjkl`, `<C-d>`, `<C-u>`) auto-center with `zz`
- Buffer switching: `<Tab>`/`<S-Tab>` for next/prev

## When Modifying This Config

1. **Adding a plugin**: Create spec in the appropriate `lua/plugins/*.lua` file
2. **Adding keymaps**: Prefer adding to the plugin's `keys = {}` spec; use `config/keymaps.lua` for global/cross-plugin bindings
3. **LSP servers**: Add to `servers` table in [lsp-config.lua](lua/plugins/lsp-config.lua#L400) — Mason auto-installs
4. **Formatters**: Add to `formatters_by_ft` table in conform.nvim config
5. **Treesitter parsers**: Add to `ensure_installed` in treesitter config

## Testing Changes

Run `:Lazy sync` after modifying plugin specs. Use `:checkhealth` to verify LSP/treesitter setup.
