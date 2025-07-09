return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { "<leader>ft", mode = { "n" }, "<cmd>TodoTelescope<cr>",                                  desc = "Todo comments" },
        { "<leader>ff", mode = { "n" }, function() require('telescope.builtin').find_files() end,  desc = "Find File" },
        { "<leader>fg", mode = { "n" }, function() require('telescope.builtin').live_grep() end,   desc = "Find Grep" },
        { "<leader>fo", mode = { "n" }, function() require('telescope.builtin').oldfiles() end,    desc = "Find Old File" },
        { "<leader>fb", mode = { "n" }, function() require('telescope.builtin').buffers() end,     desc = "Find Buffers" },
        { "<leader>fh", mode = { "n" }, function() require('telescope.builtin').help_tags() end,   desc = "FInd Help File" },
        { "<leader>fc", mode = { "n" }, function() require('telescope.builtin').colorscheme() end, desc = "FInd Colorscheme" },
    },
    config = function()
        local tls = require("telescope")
        tls.setup({
            defaults = {
                -- 默认配置
                prompt_prefix = "🔍 ", -- 搜索前缀图标
                selection_caret = " ", -- 选择项前的符号
                path_display = { "smart" }, -- 智能路径显示

                -- 界面行为
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,     -- 向下移动
                        ["<C-k>"] = require("telescope.actions").move_selection_previous, -- 向上移动
                        ["<C-q>"] = require("telescope.actions").send_selected_to_qflist +
                            require("telescope.actions").open_qflist,                     -- 发送到 quickfix
                    },
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
