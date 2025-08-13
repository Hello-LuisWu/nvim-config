return {
    {
        "ellisonleao/gruvbox.nvim",
        -- enabled = false,
        config = function()
            -- local hl = vim.api.nvim_set_hl
            -- hl(0, "Normal", { fg = "#ffffff", bg = "NONE" })
            -- hl(0, "NormalNC", { bg = "NONE" })
            -- require('gruvbox').setup({
            --     terminal_colors = true, -- add neovim terminal colors
            --     undercurl = true,
            --     underline = true,
            --     bold = true,
            --     italic = {
            --         strings = true,
            --         emphasis = true,
            --         comments = true,
            --         operators = false,
            --         folds = true,
            --     },
            --     strikethrough = true,
            --     invert_selection = false,
            --     invert_signs = false,
            --     invert_tabline = false,
            --     inverse = true, -- invert background for search, diffs, statuslines and errors
            --     contrast = "",  -- can be "hard", "soft" or empty string
            --     palette_overrides = {},
            --     overrides = {},
            --     dim_inactive = false,
            --     transparent_mode = false,
            -- })
            -- vim.cmd.colorscheme('gruvbox')
        end

    },
    {
        'AlexvZyl/nordic.nvim',
        priority = 1000,
        -- enabled = false,
        config = function()
            local hl = vim.api.nvim_set_hl
            -- hl(0, "Normal", { fg = "#ffffff", bg = "NONE" })
            -- hl(0, "NormalNC", { bg = "NONE" })
            -- vim.cmd.colorscheme('nordic')
        end

    },
    {
        "webhooked/kanso.nvim",
        lazy = false,
        -- enabled = false,
        priority = 1000,
        config = function()
            -- 确保主题加载后不覆盖透明设置
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    -- 设置基础透明背景
                    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
                    vim.api.nvim_set_hl(0, "NonText", { bg = "none" }) -- ~符号区域
                    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- 文件末尾空白

                    -- 行号透明
                    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
                    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

                    -- 状态栏透明
                    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
                    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

                    -- 窗口分割线透明
                    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })

                    -- 折叠区域透明
                    vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
                    vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })

                    -- 浮动窗口透明
                    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
                    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
                    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
                    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })

                    -- 标记列透明 (git符号等)
                    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

                    -- 特殊区域透明
                    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" }) -- 颜色列
                    vim.api.nvim_set_hl(0, "Conceal", { bg = "none" }) -- 隐藏字符
                end
            })
            -- require("kanso").setup({})
            vim.cmd.colorscheme('kanso')
        end
    }
}
