
# 🧠 nvim-config 使用说明

## 界面

![start](img/star.gif)

![edit](img/edit.png)

---

**高性能·模块化·开箱即用**: 适用于开发者的 Neovim 配置，支持 LSP、自动补全、代码格式化、语法高亮、美化 UI 等功能。

---

## 🧰 必须软件（外部依赖）

以下是使用本配置前需要在系统中安装的软件：

- [Git](https://git-scm.com/install/): 版本 >= 2.19.0（支持部分克隆）
- 🔍 [**ripgrep (rg)**](https://github.com/BurntSushi/ripgrep):  快速文本搜索工具，Telescope 模糊搜索依赖
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md):  treesitter 所需依赖
    - 🗜️ **gcc**：编译 C 插件时使用（如 Treesitter）
- 🧵 **Node.js** + `npm`: 安装 LSP/格式化工具（如 tsserver、prettier、markdown-preview）
- 🌀 [Nerd Font](https://www.nerdfonts.com/#home):（可选）v3.0 或更高版本, **Nerd Font**  是内置图标的编程字体，用于美化终端和编辑器界面。
- 🛠 **make**: 某些插件需要构建步骤（如 `telescope-fzf-native`）
- [lazygit](https://github.com/jesseduffield/lazygit) （可选）: git 管理工具
- [curl](https://curl.se/download.html): 用于blink.cmp （补全引擎）

## 🧹 清除旧配置（重装建议）

如需重新安装配置，先清除旧版本相关目录：

```sh
rm -rf ~/.config/nvim/ ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/
```

这将删除：

- `~/.config/nvim/`：主配置文件夹
- `~/.local/share/nvim/`：插件安装目录
- `~/.local/state/nvim/`：状态信息
- `~/.cache/nvim/`：缓存目录

## ⛓️‍💥 克隆配置文件

```sh
git clone --depth 1 https://github.com/Hello-LuisWu/nvim-config.git ~/.config/nvim
```

## 🗃️ Files

nvim 主目录文件树

```sh
......
```

## 🚀 启动与首次初始化

第一次运行：

```sh
nvim
```
初始化过程中，[Lazy.nvim](https://github.com/folke/lazy.nvim) 会自动：
- 同步并安装所有插件
- 设置基础配置
- 构建所需模块（如 [Treesitter](https://www.github.com/nvim-treesitter/nvim-treesitter) 、高性能搜索器等）

如果报错，请根据提示手动安装缺失依赖。

> 你可以在这里查看所有的快捷键映射：👉 [keymaps](https://github.com/Hello-LuisWu/nvim-config/blob/main/maps.md) 

欢迎提交 [issue](https://github.com/Hello-LuisWu/nvim-config/issues) 或联系作者优化配置：[Luis Wu](https://www.github.com/Hello-LuisWu/nvim-config) 

