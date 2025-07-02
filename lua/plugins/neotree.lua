return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    dependencies = { -- 依赖插件
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = { -- 快捷键触发加载
        { "<leader>e", "<cmd>Neotree toggle<cr>", mode = { "n", "v" }, desc = "切换文件树" },
        { "<C-n>", "<cmd>Neotree reveal toggle<cr>", mode = { "n", "i", "v" }, desc = "切换文件树" },
    },
    config = function()
        require("neo-tree").setup({
            commands = {
                hello = function() -- define a global "hello world" function
                    print("Hello world")
                end
            },
            filesystem = {
                find_by_full_path_words = true, -- 支持多单词路径模糊匹配，如 `src utils` 匹配 `src/utils/xxx.lua`
                window = {
                    mappings = {
                        -- disable fuzzy finder
                        ["/"] = "noop",
                    }
                }
            },

            window = {
                mappings = {
                    ["<C-c>"] = "hello"
                }
            },


            default_component_configs  = {
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
            source_selector            = {
                winbar = true,                         -- toggle to show selector on winbar
                statusline = false,                    -- toggle to show selector on statusline
                content_layout = "start",              -- 标签内容布局: start/center/end
                show_scrolled_off_parent_node = false, -- boolean
                sources = {                            -- table
                    {
                        source = "filesystem",         -- string
                        display_name = " Files "       -- string | nil
                    },
                    {
                        source = "buffers",        -- string
                        display_name = " Buffers " -- string | nil
                    },
                    {
                        source = "git_status", -- string
                        display_name = " Git " -- string | nil
                    },
                },
            },
            highlight_tab              = "NeoTreeTabInactive", -- string
            highlight_tab_active       = "NeoTreeTabActive", -- string
            highlight_background       = "NeoTreeTabInactive", -- string
            highlight_separator        = "NeoTreeTabSeparatorInactive", -- string
            highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
            enable_git_status          = true, -- 显示 Git 状态
            enable_diagnostics         = true, -- 显示 LSP 诊断
            default_source             = "filesystem", -- 默认显示文件系统,  默认数据源: filesystem/buffers/git_status
            popup_border_style         = "rounded", -- 弹出窗口边框样式: "single"|"double"|"rounded"|"shadow"|"none"
            log_level                  = "info", -- 日志级别: trace/debug/info/warn/error
            log_to_file                = false, -- 将日志写入文件 (调试用)
            use_popups_for_input       = true, -- 使用弹出窗口进行输入操作
            sort_case_insensitive      = false, -- 文件名排序是否忽略大小写

            tabs_layout                = "equal", -- 标签宽度布局方式："equal" 所有标签等宽；"focus" 当前标签宽，其他较窄

            truncation_character       = "…", -- 当标签名过长时用于截断的符号

            tabs_min_width             = nil, -- 每个 tab 的最小宽度（设置为数字或 nil 表示自动）
            tabs_max_width             = nil, -- 每个 tab 的最大宽度

            padding                    = 0, -- 每个标签内的左右间距，可设置为整数或表格 { left = 1, right = 2 }

            separator                  = { left = "(", right = ")" }, -- 标签左右的分隔符，可单字符或左右分别指定
            -- separator = { left = "▏", right = "▕" }, -- 标签左右的分隔符，可单字符或左右分别指定

            separator_active           = nil,   -- 激活状态标签的分隔符样式（未指定时使用上面 separator）

            show_separator_on_edge     = false, -- 是否在最左或最右侧也绘制分隔符
        })
    end
}
