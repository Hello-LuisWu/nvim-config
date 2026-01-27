return {
    'Kicamon/markdown-table-mode.nvim',
    ft = "markdown",
    keys = {
        { "<leader>mt", mode = "n", "<cmd>Mtm<CR>", desc = "绘制表格", }
    },
    config = function()
        require('markdown-table-mode').setup({
            options = {
                insert = true,                  -- when typing "|"
                insert_leave = true,            -- when leaving insert
                pad_separator_line = false,     -- add space in separator line
                alig_style = 'default',         -- default, left, center, right
            },
        })
    end
}
