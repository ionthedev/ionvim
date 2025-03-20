# Neovim Configuration

A modern, feature-rich Neovim setup with LSP support, code completion, syntax highlighting, and productivity tools.

## Features

- 🚀 **Fast startup** with lazy-loading via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🎨 **Beautiful UI** with [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) theme and custom dashboard
- 🔍 **Powerful search** with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- 🌳 **File navigation** with [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- 🧠 **Smart code completion** via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- 📝 **LSP support** for multiple languages
- 🐛 **Debugging** capabilities with [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- 🔍 **Code formatting** and linting via [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- 🌲 **Advanced syntax highlighting** with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- 📌 **Quick file navigation** with [Harpoon](https://github.com/ThePrimeagen/harpoon)
- 📊 **Status line** with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- 🔑 **Keybinding hints** with [which-key.nvim](https://github.com/folke/which-key.nvim)
- 📂 **Code folding** via [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

## Prerequisites

- Neovim 0.9.0 or higher
- Git
- A terminal with true color support
- [Optional] A Nerd Font for proper icon display

### C# Development Requirements

- [.NET SDK](https://dotnet.microsoft.com/download) (for building and running C# projects)
- [OmniSharp Language Server](https://github.com/OmniSharp/omnisharp-roslyn) (installed via Mason)
- [netcoredbg](https://github.com/Samsung/netcoredbg/releases) for debugging .NET applications
- [CSharpier](https://csharpier.com/) for code formatting (install with `dotnet tool install -g csharpier`)

## Installation

1. Back up your existing Neovim configuration (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:

```bash
git clone https://github.com/ionthedev/ionvim.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

The configuration will automatically install [lazy.nvim](https://github.com/folke/lazy.nvim) package manager and all the plugins on first startup.

## Key Bindings

### General

- `<Space>` - Leader key
- `<Space>s` - Save file
- `<Space>y` - Copy to system clipboard (visual mode)

### File Navigation

- `<C-p>` - Find files
- `<C-n>` - Toggle file explorer (Neo-tree)
- `<Space>fg` - Live grep (search in files)
- `<Space>;` - Find files
- `<Space>?` - Grep in all files
- `<Space>to` - Recently opened files

### Harpoon (Quick File Navigation)

- `<Space>ha` - Add file to harpoon
- `<Space>hl` - Toggle quick menu
- `<Space>hn` - Navigate to next file
- `<Space>hp` - Navigate to previous file
- `<Space>h1-4` - Navigate to file 1-4

### LSP

- `K` - Show hover documentation
- `gd` - Go to definition
- `<Space>ca` - Code actions
- `<Space>gf` - Format code

### Debugging

- `<Space>dc` - Continue debugging
- `<Space>do` - Step over
- `<Space>di` - Step into
- `<Space>dO` - Step out
- `<Space>dt` - Toggle breakpoint
- `<Space>dB` - Set breakpoint

### C# Specific

- `<Space>ct` - Debug C# test at cursor
- `<Space>cb` - Build C# project
- `<Space>cr` - Run C# project

### Code Folding

- `<Space>ff` - Fold functions only
- `zM` - Close all folds
- `zR` - Open all folds
- `zK` - Peek fold

### Git

- `<Space>gb` - Git branches
- `<Space>gp` - Git push
- `<Space>gs` - Git status
- `<Space>gz` - Toggle git blame on line

## Languages Support

This configuration comes with LSP support for:

- Lua
- C/C++
- Python
- Rust
- C# (Cross-platform support for Windows, macOS, and Linux)

Additional languages can be added by installing the appropriate servers via Mason.

## Customization

Most of the configuration is organized under the `lua/plugins/` directory, where each plugin has its own file. To customize or add new plugins, you can:

1. Modify the existing files in `lua/plugins/`
2. Create new files in `lua/plugins/` for additional plugins

Basic vim options are set in `lua/vim-options.lua`.

## Theme

This configuration uses the [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) color scheme. 

Other themes are included but commented out:
- Catppuccin
- Rose Pine

To switch themes, edit the theme configuration files and uncomment the colorscheme line.

## Credits

This configuration uses many amazing plugins created by the Neovim community. Special thanks to all the plugin authors who made this setup possible.

## License

MIT
