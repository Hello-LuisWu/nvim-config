return {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = true,
    -- dependencies = { "p00f/nvim-ts-rainbow" }, -- 彩色括号
    event = {
        "BufRead",       -- buffer读取之后,
        "BufNewFile"     -- 新建文件时
    },
    config = function()
        require 'nvim-treesitter.configs'.setup({
            ensure_installed = {
                "vim",
                "bash",
                "c",
                "cpp",
                "javascript",
                "json",
                "lua",
                "java",
                "python",
                "tsx",
                "css",
                "html",
                "rust",
                "markdown",
                "markdown_inline"
            },                    -- 安装 Markdown 和内联 Markdown 支持
            -- 是否同步安装解析器（同步会阻塞 Neovim，等待安装完成）
            sync_install = false, -- 建议设置为 false，避免卡顿

            -- 自动安装缺失的解析器（进入 buffer 时检测）
            -- 如果本地没有安装 tree-sitter 的 CLI 工具，建议设为 false
            auto_install = true,

            -- 忽略安装的解析器列表
            ignore_install = {
                -- "javascript",
            }, -- 不安装 JavaScript 的 parser

            -- 高亮配置
            highlight = {
                enable = true, -- 启用 Treesitter 高亮

                -- 是否同时启用传统的 Vim 语法高亮（基于正则表达式）
                -- true 表示同时开启，可能会导致性能下降和重复高亮
                -- 通常建议保持为 false
                additional_vim_regex_highlighting = false, -- 禁用额外的正则匹配高亮

                -- 禁用特定语言高亮
                -- disable = { "c", "rust" },

                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

            },

            -- 增量选择(incremental selection)配置，编辑时通过快捷键进行语法树节点的逐步选择
            incremental_selection = {
                enable = true,                 --启用增量选择功能
                keymaps = {
                    init_selection = "tnn",    -- 初始化选择（开始选择第一个节点）
                    node_incremental = "trn",  -- 逐步增量选择当前节点（向下选择更细的语法节点）
                    scope_incremental = "trc", -- 逐步增量选择当前范围（向上选择更大的语法块）
                    node_decremental = "trm",  -- 逐步减少当前选择的节点（退回上一个节点）
                },
            },

            -- rainbow = {
            --     enable = true,        -- 启用
            --     -- disable = { "jsx", "cpp" }, -- 禁用某些语言的彩虹括号
            --     extended_mode = true, -- 在更多语言中启用
            --     max_file_lines = nil, -- 不限文件行数
            --     colors = {            -- 颜色配置
            --         "#cc241d",
            --         "#a89984",
            --         "#b16286",
            --         "#d79921",
            --         "#689d6a",
            --         "#d65d0e",
            --         "#458588",
            --     }, --
            --     termcolors = {
            --         "Red",
            --         "Green",
            --         "Yellow",
            --         "Blue",
            --         "Magenta",
            --         "Cyan",
            --         "White",
            --     }, -- 终端颜色
            -- },

            indent = {
                enable = true
            }
        })
    end
}
