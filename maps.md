# 🛠️ Neovim 快捷键配置整理

## 🧱 基础键位
| 快捷键       | 模式  | 功能说明               | 映射命令                                                     |
| ------------ | ----- | ---------------------- | ------------------------------------------------------------ |
| jj           | i     | 退出插入模式           | `<C-[>`                                                      |
| `<Tab>`      | n     | 进入命令模式           | `:`                                                          |
| `<S-Tab>`    | n     | 进入搜索模式           | `/`                                                          |
| `<BS>`       | n     | 切换搜索高亮           | `:set hlsearch!<CR>`                                         |
| `<leader>0`  | n     | 切换换行模式           | `:set wrap!<CR>`                                             |
| p            | v     | 粘贴不覆盖寄存器       | `P`                                                          |
| `<leader>j`  | n,x   | 向下融合行             | `J`                                                          |
| gF           | n,v   | 全局自动缩进           | `gg=G`                                                       |
| `<leader>ss` | n,v   | 切换拼写检查           | `:set spell!<CR>`                                            |
| `<leader>sj` | n,v   | 下一个拼写错误         | `]s`                                                         |
| `<leader>sk` | n,v   | 上一个拼写错误         | `[s`                                                         |
| `<leader>sa` | n,v   | 添加单词到词典         | `zg`                                                         |
| `<leader>sc` | n,v   | 移除词典单词           | `zw`                                                         |
| `<leader>su` | n,v   | 撤销词典操作           | `zu`                                                         |
| W            | n     | 跳5个单词              | `5w`                                                         |
| B            | n     | 回跳5个单词            | `5b`                                                         |
| L            | n,o,v | 行尾                   | `$`                                                          |
| H            | n,o,v | 行首                   | `0`                                                          |
| J            | n,o,v | 文件尾                 | `G`                                                          |
| K            | n,o,v | 文件头                 | `gg`                                                         |
| `<C-f>`      | n     | 下翻页居中             | `<C-f>zz`                                                    |
| `<C-b>`      | n     | 上翻页居中             | `<C-b>zz`                                                    |
| n            | n     | 搜索结果居中           | `nzzzv`                                                      |
| N            | n     | 反向搜索结果居中       | `Nzzzv`                                                      |
| `<C-j>`      | v,x   | 下移选中行             | `:m '>+1<CR>gv=gv`                                           |
| `<C-k>`      | v,x   | 上移选中行             | `:m '<-2<CR>gv=gv`                                           |
| `<`          | v     | 向左缩进               | `<gv`                                                        |
| `>`          | v     | 向右缩进               | `>gv`                                                        |
| `<S-Tab>`    | v     | 向左缩进               | `<gv`                                                        |
| `<Tab>`      | v     | 向右缩进               | `>gv`                                                        |
| j            | n     | 按显示行移动           | `gj`                                                         |
| k            | n     | 按显示行移动           | `gk`                                                         |
| HH           | i     | 行首插入               | `<C-[>I`                                                     |
| LL           | i     | 行尾插入               | `<C-[>A`                                                     |
| `<C-d>`      | i     | 复制当前行             | `<C-[>yypA`                                                  |
| `<C-d>`      | n     | 复制当前行             | `yyp`                                                        |
| `<leader>ha` | n     | 全局替换单词(确认)     | `:%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>`                 |
| `<leader>hj` | n     | 全局替换单词           | `:%s/<C-r><C-w>/`                                            |
| `<leader>hJ` | n     | 手动全局替换(确认)     | `:%s//gc<left><left><left>`                                  |
| `<leader>hh` | n     | 当前行替换单词         | `:s/<C-r><C-w>//<left>`                                      |
| `<leader>hh` | v     | 全局替换选中文本       | `"hy:%s/<C-r>h//g<left><left>`                               |
| `<leader>hH` | v     | 全局替换选中文本(确认) | `"hy:%s/<C-r>h//gc<left><left><left>`                        |
| `<leader>hw` | n     | 高亮当前单词           | `:let @/ = '\<'.expand('<cword>').'\>'<bar>set hlsearch<CR>` |
| `<C-h>`      | n     | 左窗口                 | `<C-w>h`                                                     |
| `<C-j>`      | n     | 下窗口                 | `<C-w>j`                                                     |
| `<C-k>`      | n     | 上窗口                 | `<C-w>k`                                                     |
| `<C-l>`      | n     | 右窗口                 | `<C-w>l`                                                     |
| `<leader>wc` | n     | 关闭窗口               | `:close<CR>`                                                 |
| `<leader>wo` | n     | 关闭其他窗口           | `:only<CR>`                                                  |
| `<leader>ws` | n     | 垂直分屏               | `:vsplit<CR>`                                                |
| `<leader>wS` | n     | 水平分屏               | `:split<CR>`                                                 |
| `<leader>aa` | n     | 全选                   | `ggVG`                                                       |
| `<C-s>`      | n,v   | 保存文件               | `:w<CR>`                                                     |
| `<C-c>`      | v     | 复制到系统剪贴板       | `"+y`                                                        |
| `<C-v>`      | i     | 粘贴系统剪贴板         | `<Esc>"+pa`                                                  |
| `<S-Left>`   | n     | 左调窗口宽度           | `:vertical resize -5<CR>`                                    |
| `<S-Right>`  | n     | 右调窗口宽度           | `:vertical resize +5<CR>`                                    |
| `<S-Up>`     | n     | 上调窗口高度           | `:resize -5<CR>`                                             |
| `<S-Down>`   | n     | 下调窗口高度           | `:resize +5<CR>`                                             |
| U            | n     | 重做                   | `<C-r>`                                                      |

## 📝 Markdown
| 快捷键       | 模式 | 功能说明   | 映射命令                                                                                       |
| ------------ | ---- | ---------- | ---------------------------------------------------------------------------------------------- |
| `\\\\`       | i    | 清除标记   | `<ESC>/<++><CR>:nohls<CR>c4l`                                                                  |
| `<C-CR>`     | i    | 插入斜体   | `<Esc>0yf o<Esc>p0<C-a>$a`                                                                     |
| BB           | i    | 加粗文本   | `**** <++><Esc>6hi`                                                                            |
| DD           | i    | 加粗斜体   | `****** <++><Esc>7hi`                                                                          |
| II           | i    | 斜体文本   | `** <++><Esc>F*i`                                                                              |
| SS           | i    | 删除线     | `~~~~ <++><esc>6hi`                                                                            |
| UU           | i    | 下划线     | `<u></u> <++><Esc>2F<i`                                                                        |
| LS           | i    | 可折叠列表 | `<details><Enter><summary></summary><Enter><++><Enter></details><Enter><Enter><++><Esc>4k$F<i` |
| `~~`         | i    | 代码块     | `~~~<Enter><Enter>~~~<Enter><++><Esc>2kA`                                                      |
| PP           | i    | 插入图片   | `![](<++>) <++><Esc>F[a`                                                                       |
| AA           | i    | 插入链接   | `[](<++>) <++><Esc>F[a`                                                                        |
| @@           | i    | 二级标题   | `##<Space>`                                                                                    |
| `##`         | i    | 三级标题   | `##<Space>`                                                                                   |
| `$$`         | i    | 四级标题   | `###<Space>`                                                                                  |
| `<leader>mp` | n    | 粘贴图片   | `:call mdip#MarkdownClipboardImage()<CR>`                                                      |
| `<leader>mt` | n    | 生成目录   | `:TOC<CR>`                                                                                     |

## 🏠 Alpha-nvim
| 快捷键      | 模式 | 功能说明 | 映射命令     |
| ----------- | ---- | -------- | ------------ |
| `<leader>a` | n    | 打开主页 | `:Alpha<CR>` |

## 💡 blink.cmp
| 快捷键    | 模式 | 功能说明          |
| --------- | ---- | ----------------- |
| `<C-\>`   | c    | 显示/隐藏文档     |
| `<CR>`    | c    | 接受并执行        |
| `<S-Tab>` | c    | 上选/代码片段后退 |
| `<Tab>`   | c    | 下选/代码片段前进 |
| `<C-b>`   | c    | 文档上滚          |
| `<C-f>`   | c    | 文档下滚          |
| `<C-e>`   | c    | 代码片段前进/下选 |
| `<C-u>`   | c    | 代码片段后退/上选 |

## 📂 bufferline.nvim
| 快捷键             | 模式 | 功能说明         |
| ------------------ | ---- | ---------------- |
| `<leader><tab>c`   | n    | 关闭当前buffer   |
| `<leader><tab>C`   | n    | 强制关闭buffer   |
| `<leader>tc`       | n    | 关闭当前Tab页    |
| `<leader>tn`       | n    | 按文件名排序     |
| `<leader>te`       | n    | 按扩展名排序     |
| `<leader>td`       | n    | 按目录排序       |
| `<leader>to`       | n    | 按打开顺序排序   |
| `<leader><tab>y`   | n    | 关闭右侧buffer   |
| `<leader><tab>z`   | n    | 关闭左侧buffer   |
| `<leader><tab>o`   | n    | 关闭其他buffer   |
| `<leader><tab>p`   | n    | 固定/取消缓冲区  |
| `<leader><tab>B`   | n    | 快速关闭标签     |
| `<leader><tab>b`   | n    | 快速跳转标签     |
| `<leader><tab>h`   | n    | 上一个缓冲区     |
| `<leader><tab>l`   | n    | 下一个缓冲区     |
| `<leader><tab>L`   | n    | 右移缓冲区       |
| `<leader><tab>H`   | n    | 左移缓冲区       |
| `<leader><tab>1-9` | n    | 跳转到指定缓冲区 |
| `<leader><tab>$`   | n    | 最后一个缓冲区   |

## 🎨 nvim-colorizer.lua
| 快捷键       | 模式 | 功能说明     | 映射命令               |
| ------------ | ---- | ------------ | ---------------------- |
| `<leader>oc` | n    | 颜色高亮开关 | `:ColorizerToggle<CR>` |

## 💬 Comment.nvim
| 快捷键       | 模式 | 功能说明       |
| ------------ | ---- | -------------- |
| `<C-\>`      | n    | 行注释         |
| `<leader>\`  | n    | 块注释         |
| gc           | n,v  | 注释选中行/块  |
| gb           | n,v  | 块注释选中内容 |
| `<leader>gk` | n    | 上方插入注释   |
| `<leader>gj` | n    | 下方插入注释   |
| `<leader>ga` | n    | 行尾插入注释   |

## ✨ conform.nvim
| 快捷键       | 模式 | 功能说明   | 映射命令                      |
| ------------ | ---- | ---------- | ----------------------------- |
| `<leader>gf` | n    | 格式化代码 | `require("conform").format()` |

## ⚡ flash.nvim
| 快捷键  | 模式  | 功能说明       |
| ------- | ----- | -------------- |
| s       | n,x,o | 快速跳转       |
| S       | n,o,x | Treesitter跳转 |
| r       | o     | 远程跳转       |
| R       | o,x   | Treesitter搜索 |
| `<c-s>` | c     | 搜索开关       |

## 🔧 nvim-lspconfig
| 快捷键 | 模式 | 功能说明   | 映射命令                        |
| ------ | ---- | ---------- | ------------------------------- |
| gk     | n    | 悬停信息   | `vim.lsp.buf.hover()`           |
| gd     | n    | 跳转定义   | `vim.lsp.buf.definition()`      |
| gD     | n    | 跳转声明   | `vim.lsp.buf.declaration()`     |
| gi     | n    | 跳转实现   | `vim.lsp.buf.implementation()`  |
| go     | n    | 类型定义   | `vim.lsp.buf.type_definition()` |
| gy     | n    | 查看引用   | `vim.lsp.buf.references()`      |
| gs     | n    | 函数签名   | `vim.lsp.buf.signature_help()`  |
| gr     | n    | 重命名符号 | `vim.lsp.buf.rename()`          |
| gf     | n,x  | 代码格式化 | `vim.lsp.buf.format()`          |
| gc     | n    | 代码操作   | `vim.lsp.buf.code_action()`     |

## 🌳 neo-tree.nvim
| 快捷键      | 模式  | 功能说明    | 映射命令                                       |
| ----------- | ----- | ----------- | ---------------------------------------------- |
| `<leader>e` | n,v   | 文件树开关  | `:Neotree toggle reveal source=filesystem<CR>` |
| `<C-e>`     | n,i,v | 显示缓冲区  | `:Neotree toggle reveal float buffers<CR>`     |
| `<C-r>`     | n,i,v | 显示Git状态 | `:Neotree toggle reveal float git_status<CR>`  |

## 🔄 nvim-surround
| 快捷键   | 模式 | 功能说明       |
| -------- | ---- | -------------- |
| `<C-g>s` | i    | 添加环绕符号   |
| `<C-g>S` | i    | 添加跨行环绕   |
| ys       | n    | 添加环绕       |
| yss      | n    | 当前行环绕     |
| yS       | n    | 跨行环绕       |
| ySS      | n    | 当前行跨行环绕 |
| D        | v    | 可视模式环绕   |
| ds       | n    | 删除环绕       |
| cs       | n    | 更改环绕       |
| cS       | n    | 跨行更改环绕   |

## 🧩 Snacks 快捷键总览

| 快捷键        | 模式 | 功能说明             | 映射命令                                       |
|---------------|------|----------------------|------------------------------------------------|
| `<leader>cR`  | n    | 重命名文件           | `Snacks.rename.rename_file()`                 |
| `<leader>gB`  | n/v  | Git 浏览器           | `Snacks.gitbrowse()`                          |
| `<leader>fd`  | n    | 命令历史             | `Snacks.picker.command_history()`             |
| `<leader>fh`  | n    | 帮助文档             | `Snacks.picker.help()`                        |
| `<leader>fi`  | n    | 图标列表             | `Snacks.picker.icons()`                       |
| `<leader>fj`  | n    | 跳转历史             | `Snacks.picker.jumps()`                       |
| `<leader>fk`  | n    | 按键映射             | `Snacks.picker.keymaps()`                     |
| `<leader>fl`  | n    | 位置列表             | `Snacks.picker.loclist()`                     |
| `<leader>fH`  | n    | 高亮组               | `Snacks.picker.highlights()`                  |
| `<leader>fn`  | n    | 通知历史             | `Snacks.picker.notifications()`               |
| `<leader>fa`  | n    | 自动命令             | `Snacks.picker.autocmds()`                    |
| `<leader>fp`  | n    | 寄存器               | `Snacks.picker.registers()`                   |
| `<leader>ff`  | n    | 查找文件             | `Snacks.picker.files()`                       |
| `<leader>fb`  | n    | 缓冲区               | `Snacks.picker.buffers()`                     |
| `<leader>fg`  | n    | 查找 Git 文件        | `Snacks.picker.git_files()`                   |
| `<leader>fr`  | n    | 最近打开             | `Snacks.picker.recent()`                      |
| `<leader>e`   | n    | 文件浏览器           | `Snacks.explorer()`                           |
| `<leader>ft`  | n    | 终端                 | `Snacks.terminal()`                           |
| `<leader>fz`  | n    | 专注模式             | `Snacks.zen()`                                |
| `<leader>fc`  | n    | 主题切换             | `Snacks.picker.colorschemes()`                |
| `<leader>sb`  | n    | 当前缓冲区行           | `Snacks.picker.lines()`            |
| `<leader>sB`  | n    | 在所有缓冲区中搜索     | `Snacks.picker.grep_buffers()`     |
| `<leader>sg`  | n    | 全局搜索               | `Snacks.picker.grep()`             |
| `<leader>sw`  | n/x  | 搜索选中文本或光标词   | `Snacks.picker.grep_word()`        |
| `<leader>gg`  | n    | 打开 lazygit           | `Snacks.lazygit()`                   |
| `<leader>gb`  | n    | Git 分支               | `Snacks.picker.git_branches()`       |
| `<leader>gl`  | n    | Git 提交日志           | `Snacks.picker.git_log()`            |
| `<leader>gL`  | n    | 当前行提交历史         | `Snacks.picker.git_log_line()`       |
| `<leader>gs`  | n    | Git 状态               | `Snacks.picker.git_status()`         |
| `<leader>gS`  | n    | Git 暂存区             | `Snacks.picker.git_stash()`          |
| `<leader>gd`  | n    | Git 差异               | `Snacks.picker.git_diff()`           |
| `<leader>gh`  | n    | 当前文件历史           | `Snacks.picker.git_log_file()`       |

## 💻 toggleterm.nvim
| 快捷键  | 模式 | 功能说明 | 映射命令          |
| ------- | ---- | -------- | ----------------- |
| `<C-t>` | n    | 打开终端 | `:ToggleTerm<CR>` |

## 🌲 nvim-treesitter
| 快捷键 | 模式 | 功能说明     |
| ------ | ---- | ------------ |
| tnn    | n    | 初始化选择   |
| trn    | n    | 增量选择节点 |
| trc    | n    | 增量选择范围 |
| trm    | n    | 减少选择节点 |

## ⚠️ trouble.nvim
| 快捷键       | 模式 | 功能说明       | 映射命令                                                 |
| ------------ | ---- | -------------- | -------------------------------------------------------- |
| `<leader>xt` | n    | TODO注释       | `:TodoTrouble<CR>`                                       |
| `<leader>xx` | n    | 诊断信息       | `:Trouble diagnostics toggle<CR>`                        |
| `<leader>xX` | n    | 当前缓冲区诊断 | `:Trouble diagnostics toggle filter.buf=0<CR>`           |
| `<leader>xs` | n    | 符号列表       | `:Trouble symbols toggle focus=false<CR>`                |
| `<leader>xl` | n    | LSP相关        | `:Trouble lsp toggle focus=false win.position=right<CR>` |
| `<leader>xL` | n    | 位置列表       | `:Trouble loclist toggle<CR>`                            |
| `<leader>xQ` | n    | Quickfix列表   | `:Trouble qflist toggle<CR>`                             |

## 📚 nvim-ufo
| 快捷键 | 模式 | 功能说明     | 映射命令                         |
| ------ | ---- | ------------ | -------------------------------- |
| zR     | n    | 展开所有折叠 | `require('ufo').openAllFolds()`  |
| zM     | n    | 关闭所有折叠 | `require('ufo').closeAllFolds()` |





|jrjgb  |jtjgjaee |
|-------|---------|
|jkjtdgj|jtgjdbnj |
|jdfgjb|gjhbn |
