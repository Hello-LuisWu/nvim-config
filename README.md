
# 🧠 nvim-config User Guide

## Interface

![start](img/star.gif)

![edit](img/edit.png)

---

**High Performance · Modular · Out-of-the-box**: Neovim configuration for developers, supporting LSP, auto-completion, code formatting, syntax highlighting, UI beautification, and more.

---

## 🧰 Required Software (External Dependencies)

The following software must be installed in your system before using this configuration:

| Tool Name           | Description                                              |
| ------------------- | -------------------------------------------------------- |
| 🧹 **stylua**       | Lua code formatter, auto-formats Lua plugin code         |
| 🔍 **ripgrep (rg)** | Fast text search tool, Telescope fuzzy search dependency |
| 🗜️ **gcc**          | Used for compiling C plugins (e.g., Treesitter)          |

### 🧪 Recommended Optional Dependencies:

| Tool Name                  | Purpose                                                                                                                         |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| 🐍 **Python 3** + `pynvim` | Supports Python plugins (e.g., some LSP tools)                                                                                  |
| 🧵 **Node.js** + `npm`     | Install LSP/formatters (e.g., tsserver, prettier)                                                                               |
| 🛠 **make**                | Required for building some plugins (e.g., `telescope-fzf-native`)                                                               |
| 🌀 **Nerd Font**           | [Nerd Font](https://www.nerdfonts.com/#home) is a programming font with built-in icons, used to enhance terminal and editor UI. |
| 🔯**cmatrix**              | Home page digital rain effect tool
                                                                                                              |

## 🧹 Clean Old Config (Reinstallation Recommendation)

To reinstall the configuration, first delete the old version directories:
```sh
rm -rf ~/.config/nvim/ ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/
```

This will delete:

- `~/.config/nvim/`: Main configuration folder
- `~/.local/share/nvim/`: Plugin installation directory
- `~/.local/state/nvim/`: State information
- `~/.cache/nvim/`: Cache directory

## ⛓️‍💥 Clone Configuration Files

```sh
git clone --depth 1 https://github.com/Hello-LuisWu/nvim-config.git ~/.config/nvim
```

## 🗃️ Files Structure

nvim home directory file tree

```sh

├── img
│   ├── edit.png
│   └── star.gif
├── init.lua
├── lazy-lock.json
├── lua
│   ├── cmp.lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── hl.luaaaa
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   └── s.lua
│   └── plugins
│       ├── aerial.lua
│       ├── alpha.lua
│       ├── autopairs.lua
│       ├── blink.lua
│       ├── bufferline.lua
│       ├── colorizer.lua
│       ├── comment.lua
│       ├── conform.lua
│       ├── flash.lua
│       ├── gemini.lua
│       ├── lsp.lua
│       ├── lspsaga.lua
│       ├── lualine.lua
│       ├── md.lua
│       ├── mini.indentscope.lua
│       ├── neotree.lua
│       ├── rainbow-delimiters.lua
│       ├── snacks.lua
│       ├── surround.lua
│       ├── todo-comments.lua
│       ├── toggleterm.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       ├── ufo.lua
│       ├── ui.lua
│       └── which-key.lua
├── maps.md
├── README-CN.md
├── README.md
├── stylua.toml
└── vscodeVim
    └── settings.json
```

## 🚀 Launch and Initial Setup

First run:

```sh
nvim
```

During initialization, [Lazy.nvim](https://github.com/folke/lazy.nvim) will automatically:
- Sync and install all plugins
- Set up basic configurations
- Build required modules (e.g., [Treesitter](https://www.github.com/nvim-treesitter/nvim-treesitter), high-performance searchers, etc.)

If errors occur, please manually install missing dependencies according to the prompts.

> 中文使用说明：👉 [README-CN](https://github.com/Hello-LuisWu/nvim-config/blob/main/README-CN.md)  
>  You can view all key mappings here: 👉 [keymaps](https://github.com/Hello-LuisWu/nvim-config/blob/main/maps.md) 

Welcome to submit [issue](https://github.com/Hello-LuisWu/nvim-config/issues) or contact the author for configuration optimization: [Luis Wu](https://www.github.com/Hello-LuisWu/nvim-config) 
