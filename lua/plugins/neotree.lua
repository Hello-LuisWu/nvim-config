return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    dependencies = { -- 依赖插件
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = { -- 快捷键触发加载
        -- { "<leader>e", "<cmd>Neotree toggle<cr>", mode = { "n", "v" }, desc = "Neotree: 打开文件树" },
        { "<leader>e", "<cmd>Neotree toggle reveal source=filesystem<cr>", mode = { "n", "v" }, desc = "NeoTree: 定位当前文件" },
        { "<C-e>", "<cmd>Neotree toggle reveal float buffers<cr>", mode = { "n", "i", "v" }, desc = "NeoTree: 定位当前 Buffer" },
        { "<C-r>", "<cmd>Neotree toggle reveal float git_status<cr>", mode = { "n", "i", "v" }, desc = "NeoTree: 定位当前文件 git status" },
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
                width = 25,                                                       -- 自定义宽度
                mappings = {
                    ["e"]       = "expand_all",                                   -- 按 e 展开所有目录bg
                    ["<space>"] = "noop",                                         -- 禁用
                    ["<cr>"]    = "open",                                         -- 回车打开文件或展开目录
                    ["S"]       = "open_split",                                   -- 水平分屏打开
                    ["s"]       = "open_vsplit",                                  -- 垂直分屏打开
                    ["t"]       = "open_tabnew",                                  -- 新 tab 打开
                    ["a"]       = { "add", config = { show_path = "relative" } }, -- 创建新文件或目录
                    ["A"]       = "add_directory",                                -- 创建新目录
                    ["d"]       = "delete",                                       -- 删除文件或目录
                    ["r"]       = "rename",                                       -- 重命名
                    ["x"]       = "cut_to_clipboard",                             -- 剪切
                    ["y"]       = "copy_to_clipboard",                            -- 复制
                    ["p"]       = "paste_from_clipboard",                         -- 粘贴
                    ["R"]       = "refresh",                                      -- 刷新
                    ["H"]       = "toggle_hidden",                                -- 显示/隐藏 dotfiles
                    ["<bs>"]    = "noop",                                         -- 返回上级目录
                    ["."]       = "set_root",                                     -- 设置为新根目录
                    ["q"]       = "close_window",                                 -- 关闭 Neo-tree 面板
                },
            },
            default_component_configs = {
                git_status = {
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
            },
        })
    end
}
