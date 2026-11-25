# Dotfiles

Personal Neovim configuration and shell tools built with [Lazy.nvim](https://github.com/folke/lazy.nvim).

## Prerequisites

- Neovim >= 0.9
- Lua >= 5.1
- Ollama (for the side chat feature)

## Quick Start

```bash
# Clone this repository into your dotfiles directory
cd ~/dotfiles || mkdir -p ~/.config && cd ~/.config

# Install dependencies using lazy.nvim
lazy sync

# Source your config
nvim --clean
```

## Configuration Structure

```
.config/
├── nvim/              # Neovim configuration
│   └── lua/
│       ├── functions/ # Custom functions and utilities
│       │   ├── side-claude.lua   # Floating Claude chat window
│       │   ├── floating-terminal.lua  # Toggle floating terminal
│       │   └── lsp-status.lua    # LSP progress status handler
│       └── ...         # Other Lazy plugins
└── ...
```

## Custom Functions

### `side-claude.lua` — Floating Claude Chat Window

A floating window that runs Ollama's Claude model alongside your current file.

**Features:**
- Anchored to the top-right of your current window (perfect for coding)
- Runs Ollama's Claude with Qwen3.5:9b-64k model
- Persistent window until closed or toggled off
- Full chat interface in Neovim terminal

**Usage:**
```vim
:Sidechat                 " User command
<leader>cl                " Normal mode keybinding
```

**Model Command:**
```bash
ollama launch claude --model qwen3.5:9b-64k --yes
```

---

### `floating-terminal.lua` — Floating Terminal

A centered floating terminal that you can toggle on/off.

**Features:**
- Centered floating window (80% of screen by default)
- Toggles visible/hidden state
- Full terminal capabilities inside the float

**Usage:**
```vim
:Floaterminal             " User command
<leader>t                 " Normal mode keybinding
```

---

### `lsp-status.lua` — LSP Progress Status

Listens to LSP progress events and updates a global status variable for display by statusline plugins.

**Features:**
- Tracks LSP operations (hover, definition, etc.)
- Provides data for statusline integration

---

## Setup Notes

### Ollama Configuration

For `side-claude.lua` to work, ensure Ollama is running with the Claude model:

```bash
# Pull the Claude model
ollama pull qwen3.5:9b-64k

# Start Ollama server
ollama serve
```

### Recommended Plugins

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Common plugins you may want to add:

- `nvim-lualine/nvim-lualine` — Statusline (to display LSP status)
- `nvim-tree/nvim-tree.lua` — File explorer
- `nvim-treesitter/nvim-treesitter` — Syntax trees

## Troubleshooting

### Side chat won't start

Make sure Ollama is running:
```bash
ollama serve
```

Pull the model if needed:
```bash
ollama pull qwen3.5:9b-64k
```

### Floating terminal not appearing

Check that your Neovim version supports floating windows (0.9+).

## Contributing

This is a personal configuration. Feel free to fork and customize!
