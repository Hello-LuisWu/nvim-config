return {
    "nvimdev/lspsaga.nvim",
    enabled = false,
    event = {
        "BufNewFile",
        "BufRead",
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
        local map = vim.keymap.set
        -- ✅ 快捷键：切换 winbar 面包屑导航
        map("n", "<leader>cw", "<cmd>Lspsaga winbar_toggle<CR>", { desc = "切换面包屑导航（Winbar）" })

        -- ✅ 快捷键：打开结构大纲
        map("n", "<leader>co", "<cmd>Lspsaga outline<CR>", { desc = "打开结构大纲 Outline" })

        -- ✅ 快捷键：查看函数的调用者
        map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "查看调用者 Incoming" })

        -- ✅ 快捷键：查看函数调用了谁
        map(
            "n",
            "<leader>cO",
            "<cmd>Lspsaga outgoing_calls<CR>",
            { desc = "查看被调用者 Outgoing" }
        )
        require("lspsaga").setup({
            outline = {
                win_position = "right", -- 位置：left/right
                win_width = 25,   -- 窗口宽度
                auto_preview = true, -- 自动预览 symbol 定义
                detail = true,    -- 显示 symbol 的类型（如 function/variable）
                auto_close = true, -- 跳转后自动关闭 outline
                close_after_jump = false, -- 跳转后关闭 outline
                layout = "normal", -- normal 或 float（浮动窗口）
                max_height = 0.5, -- 最大高度（相对于总高度的百分比）
                left_width = 0.3, -- layout = float 时左侧宽度比例
                keys = {
                    jump = "<CR>", -- 跳转
                    quit = "q",   -- 退出 outline 窗口
                    toggle_or_jump = "o", -- 回车跳转或展开
                },
            },
            ui = {
                border = "single",
                devicon = true,
                title = true,
                expand = "", -- 折叠图标
                collapse = "", -- 展开图标
                actionfix = " ",
                lines = { "┗", "┣", "┃", "━", "┏" },
                imp_sign = "󰳛 ",
                enable = true,
                frequency = 7,
                code_action = "",
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            -- winbar 配置
            symbol_in_winbar = {
                enable = true, -- ✅ 启用面包屑导航
                separator = " > ", -- ▶ 分隔符（你也可以用 " > "、" ➜ "、"  " 等）
                hide_keyword = true, -- 隐藏 function/class 等关键词（只保留名称）
                show_file = false, -- 显示文件名和路径
                folder_level = 2, -- 文件路径层级（显示 ./a/b/file.lua 中几个层级）
                color_mode = true, -- 使用高亮着色
            },
            lightbulb = {
                enable = false,
                virtual_text = false,
            },
        })
    end,
}
