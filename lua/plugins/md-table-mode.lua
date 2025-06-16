return {
    {
        "Kicamon/markdown-table-mode.nvim",
        cmd = "TableModeToggle",
        config = function()
            require("markdown-table-mode").setup({
                filetype = {
                    '*.md',
                },
                options = {
                    insert = true,              -- when typing "|"
                    insert_leave = true,        -- when leaving insert
                    pad_separator_line = false, -- add space in separator line
                    alig_style = 'default',     -- default, left, center, right
                },
            })
        end,
    },
    {
        'kiran94/edit-markdown-table.nvim',
        config = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "EditMarkdownTable",
        opts = {
            input = {
                enabled = true,
                start_in_insert = false,
                win_options = {
                    winblend = 0,
                    wrap = true,
                },
            }
        }
    },
    {
        'SCJangra/table-nvim',
        ft = 'markdown',
        opts = {},
    }
}
