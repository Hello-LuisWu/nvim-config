return {
    'nvim-telescope/telescope.nvim',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { "<leader>ft", mode = { "n" }, "<cmd>TodoTelescope<cr>", desc = "待办注释" },
        { "<leader>ff", mode = { "n" }, function() require('telescope.builtin').find_files() end, desc = "查找文件" },
        { "<leader>fg", mode = { "n" }, function() require('telescope.builtin').live_grep() end, desc = "内容搜索" },
        { "<leader>fo", mode = { "n" }, function() require('telescope.builtin').oldfiles() end, desc = "最近打开" },
        { "<leader>fb", mode = { "n" }, function() require('telescope.builtin').buffers() end, desc = "打开缓冲区" },
        { "<leader>fh", mode = { "n" }, function() require('telescope.builtin').help_tags() end, desc = "帮助文档" },
        { "<leader>fc", mode = { "n" }, function() require('telescope.builtin').colorscheme() end, desc = "颜色主题" },
    },
    config = function()
        local tls = require("telescope")
        tls.setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = {
                    -- flip_columns = 120, -- 小于 120 列时切 vertical
                    prompt_position = "top", -- 默认在顶部

                    horizontal = {
                        preview_width = 0.55,    -- 横向模式下预览窗宽度占比
                        prompt_position = "top", -- 横向下搜索框位置
                    },
                    vertical = {
                        preview_height = 0.45,   -- 纵向模式下预览窗高度占比
                        prompt_position = "top", -- 纵向下搜索框位置
                    },
                },
                -- 默认配置
                prompt_prefix = "🔍 ", -- 搜索前缀图标
                selection_caret = "👉 ", -- 选择项前的符号
                path_display = { "smart" }, -- 智能路径显示

                -- 界面行为
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,     -- 向下移动
                        ["<C-k>"] = require("telescope.actions").move_selection_previous, -- 向上移动
                        ["<ESC>"] = require("telescope.actions").close,                   -- 按一下esc就退出
                        ["<C-f>"] = require("telescope.actions.layout").toggle_preview,   -- 按一下esc就退出
                        ["<C-s>"] = require("telescope.actions").cycle_previewers_next,
                        ["<C-a>"] = require("telescope.actions").cycle_previewers_prev,
                        ["<C-u>"] = false,                            -- 清除输入
                        ["<C-q>"] = require("telescope.actions").send_selected_to_qflist +
                            require("telescope.actions").open_qflist, -- 发送到 quickfix
                    },
                    n = {
                        ["<ESC>"] = require("telescope.actions").close, -- 按一下esc就退出
                    }
                },
            },

            -- 内置功能配置
            pickers = {
                find_files = {
                    theme = "dropdown", -- 下拉菜单样式
                    previewer = true,   -- 不显示预览
                },
                buffers = {
                    sort_mru = true, -- 最近使用的缓冲区排序
                    theme = "dropdown",
                    previewer = false,
                },
            },

            -- 扩展插件配置（可选）
            extensions = {
                -- fzf 模糊查找加速
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })
    end
}
