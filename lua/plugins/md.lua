return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        keys = {
            { "<leader>md", mode = "n", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
        },
        config = function()
            vim.g.mkdp_auto_close = true
            vim.g.mkdp_open_to_the_world = false
            vim.g.mkdp_open_ip = "127.0.0.1"
            vim.g.mkdp_port = "8888"
            vim.g.mkdp_browser = ""
            vim.g.mkdp_echo_preview_url = true
            vim.g.mkdp_page_title = "${name}"
        end,
    },
    {
        "dkarter/bullets.vim",
        ft = "markdown",
        config = function()
            vim.g.bullets_enabled_file_types = { "markdown", "telekasten", "text", "gitcommit", "scratch" }
            vim.g.bullets_outline_levels = { "num", "abc", "std-" }
        end,
    },
    {
        "img-paste-devs/img-paste.vim",
        ft = "markdown",
        config = function()
            vim.cmd([[
        autocmd FileType markdown nmap <buffer><silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>
        " there are some defaults for image directory and image name, you can change them
        " let g:mdip_imgdir = 'img'
        " let g:mdip_imgname = 'image'
        function! g:LatexPasteImage(relpath)
            execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
            let ipos = getcurpos()
            execute "normal! a" . "mage}"
            call setpos('.', ipos)
            execute "normal! ve\<C-g>"
        endfunction
        autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
        autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
        ]])
        end,
    },
    {
        "SCJangra/table-nvim",
        ft = "markdown",
        opts = {
            padd_column_separators = true,     -- Insert a space around column separators.
            mappings = {                       -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
                next = "<TAB>",                -- Go to next cell.
                prev = "<S-TAB>",              -- Go to previous cell.
                insert_row_up = "<A-k>",       -- Insert a row above the current row.
                insert_row_down = "<A-j>",     -- Insert a row below the current row.
                move_row_up = "<A-S-k>",       -- Move the current row up.
                move_row_down = "<A-S-j>",     -- Move the current row down.
                insert_column_left = "<A-h>",  -- Insert a column to the left of current column.
                insert_column_right = "<A-l>", -- Insert a column to the right of current column.
                move_column_left = "<A-S-h>",  -- Move the current column to the left.
                move_column_right = "<A-S-l>", -- Move the current column to the right.
                insert_table = "<A-t>",        -- Insert a new table.
                insert_table_alt = "<A-S-t>",  -- Insert a new table that is not surrounded by pipes.
                delete_column = "<A-d>",       -- Delete the column under cursor.
            },
        },
    },

    {
        "richardbizik/nvim-toc",
        ft = { "markdown" },
        keys = {
            { "<leader>mt", mode = "n", ":TOC<CR>", desc = "add TOC" }
        },
        opts = {
            toc_header = "文档目录",
        },
    },
}
