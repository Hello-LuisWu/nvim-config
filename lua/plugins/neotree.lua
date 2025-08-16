--[[
-- 导航操作
< → 切换到上一个数据源
> → 切换到下一个数据源
<BS> → 返回上级目录
. → 设当前文件夹为根目录
<Space> → 展开/折叠节点
<CR> / <2-左键> → 打开文件/文件夹
C → 关闭当前节点
z → 折叠所有节点
[g → 跳转上一个 Git 修改文件
]g → 跳转下一个 Git 修改文件

-- 窗口控制
P → 切换预览模式
l → 聚焦预览窗口
<C-f> → 预览窗口向下滚动
<C-b> → 预览窗口向上滚动
<Esc> → 取消操作/退出
q → 关闭窗口
e → 切换自动宽度调整

-- 文件操作
a → 新建文件/文件夹
A → 新建文件夹
d → 删除
r → 重命名
b → 重命名（不含扩展名）
y → 复制到剪贴板
x → 剪切到剪贴板
p → 从剪贴板粘贴
c → 复制文件
m → 移动文件
i → 打印文件路径


-- 视图调整
H → 显示/隐藏文件
R → 刷新目录
o → 显示排序帮助
　　oc → 按创建时间排序
　　od → 按诊断等级排序
　　og → 按 Git 状态排序
　　om → 按修改时间排序
　　on → 按名称排序
　　os → 按文件大小排序
　　ot → 按文件类型排序

-- 打开方式
S → 水平分屏打开
s → 垂直分屏打开
t → 新标签页打开
w → 选择窗口打开

-- 搜索过滤
# → 智能排序（fzy算法）
/ → 实时模糊搜索
D → 仅搜索文件夹
f → 提交后过滤
<C-x> → 清除过滤条件

git tab

gU	git_undo_last_commit	撤销最后一次提交	    git reset HEAD~
ga	git_add_file	        添加文件到暂存区	    git add <file>
gc	git_commit	            提交更改	            git commit
gg	git_commit_and_push 	提交并推送到远程仓库	git commit && git push
gp	git_push	`           推送本地提交到远程仓库	git push
gr	git_revert_file	        撤销文件修改	        git restore <file>
gu	git_unstage_file	    从暂存区移除文件	    git restore --staged <file>


]]

return {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = true,
    dependencies = { -- ä¾èµæä»¶
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = { -- å¿«æ·é®è§¦åå è½½
        -- { "<leader>e", "<cmd>Neotree toggle<cr>", mode = { "n", "v" }, desc = "Neotree: æå¼æä»¶æ " },
        { "<leader>e", "<cmd>Neotree toggle reveal source=filesystem<cr>", mode = { "n", "v" },      desc = "NeoTree: å®ä½å½åæä»¶" },
        { "<C-e>",     "<cmd>Neotree toggle reveal float buffers<cr>",     mode = { "n", "i", "v" }, desc = "NeoTree: å®ä½å½å Buffer" },
        { "<C-r>",     "<cmd>Neotree toggle reveal float git_status<cr>",  mode = { "n", "i", "v" }, desc = "NeoTree: å®ä½å½åæä»¶ git status" },
    },
    config = function()
        require("neo-tree").setup({
            document_symbols          = {
                follow_cursor = true, -- 自动定位光标所在符号
                kinds = {
                    Class = { icon = "󰌗", hl = "Include" },
                    Function = { icon = "󰊕", hl = "Function" },
                    Variable = { icon = "󰀫", hl = "Constant" },
                },
                client_filters = {
                    fn = function(name)
                        return name ~= "null-ls"
                    end,
                    allow_only = { "lua_ls", "clangd" },
                    ignore = { "pyright" }
                }
            },
            filesystem                = {
                -- "open_current",
                -- "disabled",
                hijack_netrw_behavior   = "open_default", -- 接管 netrw: open_default/open_current/disabled
                bind_to_cwd             = true,           -- 绑定当前工作目录
                cwd_target              = {               -- 目录绑定目标类型
                    sidebar = "tab",                      -- 侧边栏模式使用 tab 级目录
                    current = "window",                   -- 当前窗口模式使用窗口级目录
                },
                find_by_full_path_words = true,           -- 支持多单词路径模糊匹配，如 `src utils` 匹配 `src/utils/xxx.lua`

                -- 仅在Files tab下生效，Buffer Git 不起作用
                window                  = {
                    mappings = {
                        -- disable fuzzy finder
                        ["/"] = "noop",
                    }
                },
                filtered_items          = {
                    visible = true,         -- 默认不显示隐藏项
                    hide_dotfiles = false,  -- 隐藏点文件
                    hide_gitignored = true, -- 隐藏 Git 忽略文件
                    hide_hidden = true,     -- 隐藏系统隐藏文件
                    hide_by_name = {        -- 按名称隐藏
                        ".DS_Store",
                        "thumbs.db",
                        ".git",
                        "node_modules",
                    },
                    hide_by_pattern = {
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                        --".gitignored",
                    },
                    always_show_by_pattern = { -- uses glob style patterns
                        --".env*",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        --".DS_Store",
                        --"thumbs.db",
                    },
                    never_show_by_pattern = { -- uses glob style patterns
                        --".null-ls_*",
                    },
                },
            },
            window                    = {
                width = 25, -- 自定义宽度

                -- 全局快捷键配置
                mappings = {
                    -- noop: 禁用
                    ["/"] = "noop",
                    -- ["P"] = "noop",
                    ["P"] = { -- 预览当前文件
                        "toggle_preview",
                        config = {
                            use_float = false,
                            use_snacks_image = true,
                            use_image_nvim = true
                        }
                    },
                    ["l"] = "focus_preview", -- 打开预览

                    -- 上下滚动
                    ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                    ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                    -- ["A"] = "command_a",
                    ["i"] = {
                        function(state)
                            local node = state.tree:get_node()
                            print(node.path)
                        end,
                        desc = "print path",
                    },
                },
            },

            default_component_configs = {
                git_status = {
                    -- symbols = false,
                    symbols = {
                        -- Change type
                        added     = "✚",
                        deleted   = "✖",
                        modified  = "",
                        renamed   = "󰁕",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
                diagnostics = {
                    symbols = {
                        hint = "⚑",
                        info = "»",
                        warn = "⚠",
                        error = "✘",
                    },
                    highlights = {
                        hint = "DiagnosticSignHint",
                        info = "DiagnosticSignInfo",
                        warn = "DiagnosticSignWarn",
                        error = "DiagnosticSignError",
                    },
                },
                indent = {
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    indent_size = 2,
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
            source_selector           = {
                winbar                        = true,    -- toggle to show selector on winbar
                statusline                    = false,   -- toggle to show selector on statusline
                content_layout                = "start", -- 标签内容布局: start/center/end
                show_scrolled_off_parent_node = false,   -- boolean
                sources                       = {        -- table
                    {
                        source = "filesystem",           -- string
                        display_name = "Files"           -- string | nil
                    },
                    {
                        source = "buffers",     -- string
                        display_name = "Buffer" -- string | nil
                    },
                    {
                        source = "git_status", -- string
                        display_name = "Git"   -- string | nil
                    },
                },
                highlight_tab                 = "NeoTreeTabInactive", -- string
                highlight_tab_active          = "NeoTreeTabActive", -- string
                highlight_background          = "NeoTreeTabInactive", -- string
                highlight_separator           = "NeoTreeTabSeparatorInactive", -- string
                highlight_separator_active    = "NeoTreeTabSeparatorActive", -- string
                enable_git_status             = true, -- 显示 Git 状态
                enable_diagnostics            = true, -- 显示 LSP 诊断
                default_source                = "filesystem", -- 默认显示文件系统,  默认数据源: filesystem/buffers/git_status
                popup_border_style            = "rounded", -- 弹出窗口边框样式: "single"|"double"|"rounded"|"shadow"|"none"
                log_level                     = "info", -- 日志级别: trace/debug/info/warn/error
                log_to_file                   = false, -- 将日志写入文件 (调试用)
                use_popups_for_input          = true, -- 使用弹出窗口进行输入操作
                sort_case_insensitive         = false, -- 文件名排序是否忽略大小写
                tabs_layout                   = "equal", -- 标签宽度布局方式："equal" 所有标签等宽；"focus" 当前标签宽，其他较窄
                truncation_character          = "…", -- 当标签名过长时用于截断的符号
                separator                     = { left = "▏", right = "▕" },
                tabs_min_width                = nil, -- 每个 tab 的最小宽度（设置为数字或 nil 表示自动）
                tabs_max_width                = nil, -- 每个 tab 的最大宽度
                padding                       = 0, -- 每个标签内的左右间距，可设置为整数或表格 { left = 1, right = 2 }
                separator_active              = nil, -- 激活状态标签的分隔符样式（未指定时使用上面 separator）
                show_separator_on_edge        = false, -- 是否在最左或最右侧也绘制分隔符
            },
            buffers                   = {
                show_unloaded = true, -- 是否显示未加载的缓冲区（默认 false）
            }
        })
    end
}
