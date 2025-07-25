return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = {
        "BufRead",   -- buffer读取之后,
        "BufNewFile" -- 新建文件时
    },
    -- keys = {
    -- },

    opts = {
        signs = true,      -- 是否在标记列显示图标（左侧边栏）
        sign_priority = 8, -- 标记的显示优先级（数字越大优先级越高）

        -- 定义被识别为待办事项注释的关键字配置
        keywords = {
            FIX = { icon = " ", color = "error", alt = { "BUG", "FIXME", "FIXIT", "ISSUE" } },
            ERRO = { icon = "✘ ", color = "error", alt = { "错误" } },
            TODO = { icon = " ", color = "info", alt = { "待办" } },
            -- INFO = { icon = " ", color = "info", alt = { "INFORMATION" } },
            HINT = { icon = "⚑ ", color = "hint", alt = { "提示" } },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "警告" } },
            PERF = { icon = " ", color = "hint", alt = { "OPTIMIZE", "PERFORMANCE", "OPTIMISE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO", "信息" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "测试" } },
        },
        -- 图形界面样式配置
        gui_style = {
            fg = "NONE", -- 前景色高亮样式（"NONE" 表示不设置特殊样式）
            bg = "BOLD", -- 背景色高亮样式（"BOLD" 表示加粗）
        },

        merge_keywords = true, -- 是否合并用户自定义关键字与插件默认关键字（true 表示合并）

        -- 高亮配置（控制代码中的待办注释显示样式）
        highlight = {
            multiline = true,                -- 是否启用多行注释识别
            multiline_pattern = "^.",        -- 用于匹配多行注释起始的 Lua 正则表达式
            multiline_context = 10,          -- 切换行时重新评估的额外行数
            before = "",                     -- 关键字前部的高亮方式（"fg"/"bg"/空）
            keyword = "wide",                -- 关键字高亮模式（"wide" 会高亮周围字符）
            after = "fg",                    -- 关键字后部的高亮方式（"fg"/"bg"/空）
            pattern = [[.*<(KEYWORDS)\s*:]], -- 匹配关键字的高亮正则表达式（Vim 语法）
            comments_only = true,            -- 是否仅在注释中匹配关键字（依赖 treesitter）
            max_line_len = 400,              -- 忽略超过此长度的行（避免性能问题）
            exclude = {},                    -- 需要排除高亮的文件类型列表
        },
        --NOTE
        -- 预定义颜色表（通过名称引用颜色配置）
        colors = {
            error = { "#DC2626" },   -- 错误类颜色（红色）
            warning = { "#FBBF24" }, -- 警告类颜色（黄色）
            info = { "#2563EB" },    -- 信息类颜色（蓝色）
            hint = { "#10B981" },    -- 提示类颜色（绿色）
            default = { "#7C3AED" }, -- 默认颜色（紫色）
            test = { "#FF00FF" }     -- 测试专用颜色（品红色）
        },

        -- 搜索配置（用于查找待办事项的命令和正则）
        search = {
            command = "rg",              -- 使用的搜索命令（ripgrep）
            args = {                     -- 搜索命令的参数列表
                "--color=never",         -- 禁用颜色输出
                "--no-heading",          -- 不显示文件标题
                "--with-filename",       -- 显示文件名
                "--line-number",         -- 显示行号
                "--column",              -- 显示列号
            },
            pattern = [[\b(KEYWORDS):]], -- 匹配关键字的正则表达式（保留 KEYWORDS 占位符）
            -- pattern = [[\b(KEYWORDS)\b]], -- 无冒号版本（可能产生误匹配）
        },
    }

}
