return {
    {
        "ellisonleao/gruvbox.nvim",
        -- enabled = false,
        config = function()
            require('gruvbox').setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd.colorscheme('gruvbox')

            -- local hl = vim.api.nvim_set_hl
            -- hl(0, "Normal", {bg = "none"})
        end
    },
    {

        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_enable_italic = true
            -- vim.cmd.colorscheme('everforest')
            -- local hl = vim.api.nvim_set_hl
            -- hl(0, "Normal", {bg = "none"})
        end
    }
}
