# nvim-config

## 必须软件

nvim插件必须

1. stylua
2. ripgrep
3. gcc

## 清除文件

```sh
rm -rf ~/.config/nvim/ ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/
```

## 克隆配置文件

```sh 
git clone --depth 1 https://github.com/Hello-LuisWu/nvim-config.git ~/.config/nvim
```
## Neovim 快捷键配置整理（Markdown 表格）:

### 🧠 基础操作

| 快捷键     | 模式       | 功能说明              | 映射命令                          |
|------------|------------|-----------------------|-----------------------------------|
| `jj`       | Insert     | 快速退出插入模式      | `<C-[>`                           |
| `<BS>`     | Normal     | 切换搜索高亮          | `:set hlsearch!<CR>`              |
| `<Tab>`    | Normal     | 打开命令行（冒号）    | `:`                               |
| `<S-Tab>`  | Normal     | 启动搜索（斜杠）      | `/`                               |
| `W` / `B`  | Normal     | 快速跳词              | `5w` / `5b`                       |
| `j` / `k`  | Normal     | 支持换行跳转          | `gj` / `gk`                       |
| `U`        | Normal     | 重做（重绑定）        | `<C-r>`                           |

### ✏️ 编辑增强

| 快捷键       | 模式          | 功能说明                 | 映射命令                 |
| ------------ | ------------- | ------------------------ | ------------------------ |
| `<leader>ha` | Normal        | 全局替换当前单词（确认） | `:%s/\<<C-r><C-w>\>//gc` |
| `<leader>hh` | Normal        | 当前行替换当前单词       | `:s/<C-r><C-w>//`        |
| `<leader>hj` | Normal        | 全局替换当前单词         | `:%s/<C-r><C-w>/`        |
| `<leader>hJ` | Normal        | 手动输入替换（确认）     | `:%s//gc`                |
| `<leader>hh` | Visual        | 全局替换选中文本         | `"hy:%s/<C-r>h//g`       |
| `<leader>hH` | Visual        | 全局替换选中文本（确认） | `"hy:%s/<C-r>h//gc`      |
| `<leader>hw` | Normal        | 高亮当前单词             | `let @/ = '\<word\>'`    |
| `gF`         | Normal/Visual | 自动缩进全文件           | `gg=G`                   |
| `<C-d>`      | Normal/Insert | 快速复制当前行           | `yyp` / `yypA`           |

### 📄 拼写检查

| 快捷键       | 模式          | 功能说明       | 命令          |
| ------------ | ------------- | -------------- | ------------- |
| `<leader>ss` | Normal/Visual | 切换拼写检查   | `:set spell!` |
| `<leader>sj` | Normal/Visual | 下一个拼写错误 | `]s`          |
| `<leader>sk` | Normal/Visual | 上一个拼写错误 | `[s`          |
| `<leader>sa` | Normal/Visual | 添加到词典     | `zg`          |
| `<leader>sc` | Normal/Visual | 移出词典       | `zw`          |
| `<leader>su` | Normal/Visual | 撤销 zg/zw     | `zu`          |
| `<leader>su` | Normal/Visual | 替换错误单词   | `:spellr`     |

### 🗂️ Buffer 操作

| 快捷键       | 模式   | 功能说明        | 映射命令     |
| ------------ | ------ | --------------- | ------------ |
| `<leader>bl` | Normal | 下一个 buffer   | `:bnext`     |
| `<leader>bh` | Normal | 上一个 buffer   | `:bprevious` |
| `<leader>bq` | Normal | 关闭当前 buffer | `:bd`        |

### 🪟 窗口管理

| 快捷键             | 模式   | 功能说明                 | 映射命令           |
| ------------------ | ------ | ------------------------ | ------------------ |
| `<C-h/j/k/l>`      | Normal | 窗口间跳转               | `<C-w>h/j/k/l`     |
| `<leader>wc`       | Normal | 关闭窗口或 cd 到当前目录 | `:close` / `:cd %` |
| `<leader>wo`       | Normal | 关闭其他窗口             | `:only`            |
| `<leader>ws`       | Normal | 垂直分屏                 | `:vsplit`          |
| `<leader>wS`       | Normal | 水平分屏                 | `:split`           |
| `<leader>w= `      | Normal | 等宽高                   | `<C-w>=`           |
| `<leader>wn`       | Normal | 新建空白窗口             | `<C-w>n`           |
| `<leader>wr`       | Normal | 重命名文件               | `:Rename <name>`   |
| `<leader>wh/l/k/j` | Normal | 移动窗口位置             | `<C-w>H/L/K/J`     |

### 🔁 翻页跳转

| 快捷键  | 模式   | 功能说明       | 映射命令      |
| ------- | ------ | -------------- | ------------- |
| `<C-f>` | Normal | 向下翻页居中   | `<C-f>zz`     |
| `<C-b>` | Normal | 向上翻页居中   | `<C-b>zz`     |
| `n/N`   | Normal | 搜索后结果居中 | `nzzzv/Nzzzv` |

### 🔡 文本操作增强

| 快捷键          | 模式   | 功能说明         | 映射命令              |
| --------------- | ------ | ---------------- | --------------------- |
| `<C-j/k>`       | Visual | 上下移动选中文本 | `:m '<-2` / `:m '>+1` |
| `<tab>/<S-tab>` | Visual | 缩进并保持选中   | `>gv` / `<gv`         |
| `<leader>aa`    | Normal | 全选全文         | `ggVG`                |

### 💾 文件保存与复制粘贴

| 快捷键  | 模式          | 功能说明         | 映射命令    |
| ------- | ------------- | ---------------- | ----------- |
| `<C-s>` | Normal/Visual | 保存文件         | `:w`        |
| `<C-c>` | Visual        | 复制到系统剪贴板 | `"+y`       |
| `<C-v>` | Insert        | 粘贴剪贴板内容   | `<Esc>"+pa` |

### 📏 窗口尺寸调整

| 快捷键           | 模式   | 功能说明 | 映射命令              |
| ---------------- | ------ | -------- | --------------------- |
| `<S-Left/Right>` | Normal | 调整宽度 | `:vertical resize ±5` |
| `<S-Up/Down>`    | Normal | 调整高度 | `:resize ±5`          |

### 🧼 禁用键位

| 快捷键 | 模式            | 功能说明     | 映射命令 |
| ------ | --------------- | ------------ | -------- |
| 方向键 | Normal/Insert等 | 禁用方向键   | `<Nop>`  |
| `q:`   | Normal/Visual   | 禁用命令记录 | `<Nop>`  |

### 🧾 Markdown 插入（自动命令）

> 当文件类型为 `markdown` 时生效

| 快捷键   | 模式   | 功能说明           | 插入内容                           |
| -------- | ------ | ------------------ | ---------------------------------- |
| `\\\\`   | Insert | 插入 `<++>` 等标记 | `<C-[>/<++><CR>:nohlsearch<CR>c4l` |
| `BB`     | Insert | 加粗               | `**** <++>`                        |
| `DD`     | Insert | 加粗 + 斜体        | `****** <++>`                      |
| `II`     | Insert | 斜体               | `** <++>`                          |
| `SS`     | Insert | 删除线             | `~~~~ <++>`                        |
| `UU`     | Insert | 下划线             | `<u></u> <++>`                     |
| `LS`     | Insert | 折叠列表           | `<details>...<summary>...`         |
| `~~`     | Insert | 格式化代码块       | `~~~`                              |
| `PP`     | Insert | 添加图片           | `![](<++>) <++>`                   |
| `PPP`    | Insert | 添加链接           | `[](<++>) <++>`                    |
| `@@`     | Insert | 二级标题           | `### `                              |
| `###`     | Insert | 三级标题           | `### `                             |
| `$$`     | Insert | 四级标题           | `##### `                            |
| `<C-CR>` | Insert | 插入下一行带计数   | `<Esc>0yf o<Esc>p0<C-a>$a`         |

### 🏠 启动首页（alpha-nvim）

| 快捷键      | 模式   | 功能说明       | 映射命令     |
| ----------- | ------ | -------------- | ------------ |
| `<leader>a` | Normal | 打开仪表盘首页 | `:Alpha<CR>` |

### ⚡ 补全与片段（blink.cmp）

| 快捷键    | 模式           | 功能说明                                 | 行为组合                                           |
| --------- | -------------- | ---------------------------------------- | -------------------------------------------------- |
| `<C-\>`  | Insert/Command | 显示补全、显示文档、隐藏文档             | `show`, `show_documentation`, `hide_documentation` |
| `<CR>`    | Insert/Command | 接受选中项或执行回车原有操作（回车换行） | `accept`, `fallback`                               |
| `<Tab>`   | Insert         | 选择下一个补全项（优先）或片段跳转前     | `select_next`, `snippet_forward`, `fallback`       |
| `<S-Tab>` | Insert         | 选择上一个补全项或片段跳转后             | `select_prev`, `snippet_backward`, `fallback`      |
| `<C-b>`   | Insert         | 上滚补全文档                             | `scroll_documentation_up`, `fallback`              |
| `<C-f>`   | Insert         | 下滚补全文档                             | `scroll_documentation_down`, `fallback`            |
| `<C-e>`   | Insert         | 片段跳转优先，其次选择下一个补全项       | `snippet_forward`, `select_next`, `fallback`       |
| `<C-u>`   | Insert         | 片段后退优先，其次选择上一个补全项       | `snippet_backward`, `select_prev`, `fallback`      |

### 📑 标签页管理（bufferline.nvim）

| 快捷键           | 模式   | 功能说明             | 映射命令                       |
| ---------------- | ------ | -------------------- | ------------------------------ |
| `<leader><tab>p` | Normal | 固定/取消固定缓冲区  | `:BufferLineTogglePin<CR>`     |
| `<leader><tab>c` | Normal | 选择并关闭缓冲区     | `:BufferLinePickClose<CR>`     |
| `<leader><tab>h` | Normal | 上一个缓冲区         | `:BufferLineCyclePrev<CR>`     |
| `<leader><tab>l` | Normal | 下一个缓冲区         | `:BufferLineCycleNext<CR>`     |
| `<leader><tab>1` | Normal | 切换到第 1 个缓冲区  | `:BufferLineGoToBuffer 1<CR>`  |
| `<leader><tab>2` | Normal | 切换到第 2 个缓冲区  | `:BufferLineGoToBuffer 2<CR>`  |
| `<leader><tab>3` | Normal | 切换到第 3 个缓冲区  | `:BufferLineGoToBuffer 3<CR>`  |
| `<leader><tab>4` | Normal | 切换到第 4 个缓冲区  | `:BufferLineGoToBuffer 4<CR>`  |
| `<leader><tab>5` | Normal | 切换到第 5 个缓冲区  | `:BufferLineGoToBuffer 5<CR>`  |
| `<leader><tab>6` | Normal | 切换到第 6 个缓冲区  | `:BufferLineGoToBuffer 6<CR>`  |
| `<leader><tab>7` | Normal | 切换到第 7 个缓冲区  | `:BufferLineGoToBuffer 7<CR>`  |
| `<leader><tab>8` | Normal | 切换到第 8 个缓冲区  | `:BufferLineGoToBuffer 8<CR>`  |
| `<leader><tab>9` | Normal | 切换到第 9 个缓冲区  | `:BufferLineGoToBuffer 9<CR>`  |
| `<leader><tab>$` | Normal | 切换到最后一个缓冲区 | `:BufferLineGoToBuffer -1<CR>` |

### 🎨 颜色高亮（nvim-colorizer.lua）

| 快捷键       | 模式                               | 功能说明     | 映射命令               |
| ------------ | ---------------------------------- | ------------ | ---------------------- |
| `<leader>oc` | Normal / Visual / Operator-pending | 切换颜色高亮 | `:ColorizerToggle<CR>` |

### 💬 注释快捷键（Comment.nvim）

| 快捷键       | 模式            | 功能说明               | 映射命令描述                |
| ------------ | --------------- | ---------------------- | --------------------------- |
| `<C-\>`      | Normal          | 注释当前行             | toggler.line                |
| `<leader>\`  | Normal          | 注释当前块             | toggler.block               |
| `gc`         | Normal / Visual | 注释选中行/多行        | 通用行注释（操作符模式）    |
| `gb`         | Normal / Visual | 块注释选中内容         | 通用块注释（操作符模式）    |
| `<C-\>`      | Visual          | 注释选中行/多行        | opleader.line               |
| `<leader>\`  | Visual          | 块注释选中内容         | opleader.block              |
| `<leader>gk` | Normal          | 当前行**上方**插入注释 | extra.above（进入插入模式） |
| `<leader>gj` | Normal          | 当前行**下方**插入注释 | extra.below（进入插入模式） |
| `<leader>ga` | Normal          | 当前行**尾部**插入注释 | extra.eol（进入插入模式）   |

### 🩰 jump

| 快捷键 | 模式    | 功能描述             | 备注                       |
| ------ | ------- | -------------------- | -------------------------- |
| s      | n, x, o | 触发 Flash 跳转      | 普通、可视、操作模式通用   |
| S      | n, o, x | 使用 Treesitter 跳转 | 结构化语法树跳转           |
| r      | o       | 远程 Flash           | 操作模式下远程跳转         |
| R      | o, x    | Treesitter 搜索      | 操作、可视模式下语法树搜索 |
| <C-s>  | c       | 切换 Flash 搜索      | 命令行模式下切换搜索状态   |

### 🔬 LSP

| 快捷键 | 模式 | 功能描述         | 备注                   |
| ------ | ---- | ---------------- | ---------------------- |
| gk     | n    | 显示悬停信息     | 显示光标下符号文档信息 |
| gd     | n    | 跳转到定义       |                        |
| gD     | n    | 跳转到声明       |                        |
| gi     | n    | 跳转到实现       |                        |
| go     | n    | 跳转到类型定义   |                        |
| gy     | n    | 查看引用         |                        |
| gs     | n    | 显示函数签名帮助 |                        |
| gr     | n    | 重命名符号       |                        |
| gf     | n, x | 代码格式化       | 支持可视模式           |
| gc     | n    | 代码操作         | 代码动作               |
| gwa    | n    | 添加工作空间目录 |                        |
| gwr    | n    | 移除工作空间目录 |                        |
| gwl    | n    | 列出工作空间目录 |                        |

### 📃markdown plugins

| 快捷键          | 模式                | 功能描述            | 备注                             |
| --------------- | ------------------- | ------------------- | -------------------------------- |
| <leader>md      | n                   | Markdown 预览切换   | 调用 MarkdownPreviewToggle 命令  |
| <leader>mp      | n（markdown缓冲区） | 粘贴剪贴板图片      | 调用 mdip#MarkdownClipboardImage |
| <leader><TAB>   | n, i                | 表格下一单元格      | table-nvim 插件                  |
| <leader><S-TAB> | n, i                | 表格上一单元格      | table-nvim 插件                  |
| <A-k>           | n, i                | 在当前行上方插入行  | table-nvim 插件                  |
| <A-j>           | n, i                | 在当前行下方插入行  | table-nvim 插件                  |
| <A-S-k>         | n, i                | 上移当前行          | table-nvim 插件                  |
| <A-S-j>         | n, i                | 下移当前行          | table-nvim 插件                  |
| <A-h>           | n, i                | 在当前列左侧插入列  | table-nvim 插件                  |
| <A-l>           | n, i                | 在当前列右侧插入列  | table-nvim 插件                  |
| <A-S-h>         | n, i                | 左移当前列          | table-nvim 插件                  |
| <A-S-l>         | n, i                | 右移当前列          | table-nvim 插件                  |
| <A-t>           | n, i                | 插入新表格          | table-nvim 插件                  |
| <A-S-t>         | n, i                | 插入不带管道符表格  | table-nvim 插件                  |
| <A-d>           | n, i                | 删除当前列          | table-nvim 插件                  |
| <leader>mt      | n                   | 添加文档目录（TOC） | nvim-toc 插件                    |

### 📂 Neotree

| 快捷键    | 模式    | 功能描述                         |
| --------- | ------- | -------------------------------- |
| <leader>e | n, i, v | NeoTree: 定位当前文件            |
| <C-e>     | n, i, v | NeoTree: 定位当前 Buffer         |
| <C-r>     | n, i, v | NeoTree: 定位当前文件 git status |

### 🧩 环绕操作（nvim-surround）

| 快捷键   | 模式        | 功能说明                   | 映射命令                        |
| -------- | ----------- | -------------------------- | ------------------------------- |
| `ys`     | Normal      | 添加环绕符号               | `nvim-surround-normal`          |
| `yss`    | Normal      | 当前行添加环绕符号         | `nvim-surround-normal-cur`      |
| `yS`     | Normal      | 跨行添加环绕符号           | `nvim-surround-normal-line`     |
| `ySS`    | Normal      | 当前整行添加多行环绕       | `nvim-surround-normal-cur-line` |
| `D`      | Visual      | 可视模式添加环绕符号       | `nvim-surround-visual`          |
| `gS`     | Visual Line | 可视行模式添加多行环绕符号 | `nvim-surround-visual-line`     |
| `ds`     | Normal      | 删除环绕符号               | `nvim-surround-delete`          |
| `cs`     | Normal      | 更改环绕符号               | `nvim-surround-change`          |
| `cS`     | Normal      | 更改多行环绕符号           | `nvim-surround-change-line`     |
| `<C-g>s` | Insert      | 插入模式添加环绕符号       | `nvim-surround-insert`          |
| `<C-g>S` | Insert      | 插入模式添加多行环绕符号   | `nvim-surround-insert-line`     |

### 🔭 文件搜索（telescope.nvim）

| 快捷键       | 模式   | 功能说明             | 映射命令        |
| ------------ | ------ | -------------------- | --------------- |
| `<leader>ff` | Normal | 文件搜索             | `find_files()`  |
| `<leader>fg` | Normal | 全局内容搜索（Grep） | `live_grep()`   |
| `<leader>fo` | Normal | 最近打开的文件       | `oldfiles()`    |
| `<leader>fb` | Normal | 打开缓冲区列表       | `buffers()`     |
| `<leader>fh` | Normal | 搜索帮助文档         | `help_tags()`   |
| `<leader>fc` | Normal | 主题颜色选择器       | `colorscheme()` |

### 📝 待办注释（todo-comments.nvim）

| 快捷键       | 模式   | 功能说明       | 映射命令         |
| ------------ | ------ | -------------- | ---------------- |
| `<leader>ft` | Normal | 查找待办注释项 | `:TodoTelescope` |

### 🖥️ 终端操作（toggleterm.nvim）

| 快捷键  | 模式   | 功能说明     | 映射命令          |
| ------- | ------ | ------------ | ----------------- |
| `<C-t>` | Normal | 打开浮动终端 | `:ToggleTerm<CR>` |

### 🌲 Treesitter 操作（nvim-treesitter）

| 快捷键 | 模式   | 功能说明           | 映射命令            |
| ------ | ------ | ------------------ | ------------------- |
| `tnn`  | Normal | 初始化语法节点选择 | `init_selection`    |
| `trn`  | Normal | 增量选择语法节点   | `node_incremental`  |
| `trc`  | Normal | 扩展选择作用域范围 | `scope_incremental` |
| `trm`  | Normal | 缩减语法节点选择   | `node_decremental`  |


