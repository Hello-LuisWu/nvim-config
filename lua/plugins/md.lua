return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
        keys = {
            {
                "<leader>md",
                mode = "n",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
            },
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
            vim.g.bullets_enabled_file_types =
            { "markdown", "telekasten", "text", "gitcommit", "scratch" }
            vim.g.bullets_outline_levels = { "num", "abc", "std-" }
        end,
    },
    -- {
    --     "img-paste-devs/img-paste.vim",
    --     ft = "markdown",
    --     config = function()
    --         vim.cmd([[
    --     autocmd FileType markdown nmap <buffer><silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>
    --     " there are some defaults for image directory and image name, you can change them
    --     " let g:mdip_imgdir = 'img'
    --     " let g:mdip_imgname = 'image'
    --     function! g:LatexPasteImage(relpath)
    --         execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    --         let ipos = getcurpos()
    --         execute "normal! a" . "mage}"
    --         call setpos('.', ipos)
    --         execute "normal! ve\<C-g>"
    --     endfunction
    --     autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
    --     autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
    --     ]])
    --     end,
    -- },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy", -- 延迟加载
        keys = {
            { "<leader>mp", "<cmd>PasteImage<cr>", desc = "📋 粘贴剪贴板图片" },
        },
        opts = {
            default = {
                -- 📁 文件保存设置
                dir_path = "assets",              -- 图片默认保存目录
                extension = "png",                -- 图片默认扩展名
                file_name = "%Y-%m-%d-%H-%M-%S",  -- 图片命名格式（按时间命名）
                use_absolute_path = false,        -- 是否使用绝对路径插入
                relative_to_current_file = false, -- 是否相对当前文件保存

                -- 📄 插入模板设置
                template = "$FILE_PATH",             -- 默认插入路径模板
                url_encode_path = false,             -- 是否进行 URL 编码
                relative_template_path = true,       -- 插入模板是否使用相对路径
                use_cursor_in_template = true,       -- 是否用光标占位符
                insert_mode_after_paste = true,      -- 粘贴后是否进入插入模式
                insert_template_after_cursor = true, -- 插入模板时是否位于光标后

                -- 🔤 文件名提示设置
                prompt_for_file_name = true,     -- 是否提示输入文件名
                show_dir_path_in_prompt = false, -- 提示时是否显示保存目录

                -- 🔒 base64 设置（不启用）
                max_base64_size = 10,          -- base64 最大大小（MB）
                embed_image_as_base64 = false, -- 是否以 base64 插入

                -- 🛠️ 图片处理命令
                process_cmd = "",       -- 自定义图片处理命令
                copy_images = true,     -- 是否复制图片
                download_images = true, -- 是否自动下载粘贴板图片

                -- 🐭 拖拽支持
                drag_and_drop = {
                    enabled = true,      -- 启用拖拽粘贴图片
                    insert_mode = false, -- 拖拽时是否进入插入模式
                },
            },

            -- 📝 针对特定文件类型的模板
            -- filetypes = {
            --     markdown = {
            --         url_encode_path = true,
            --         template = "![$CURSOR]($FILE_PATH)",
            --         download_images = false,
            --     },
            --     vimwiki = {
            --         url_encode_path = true,
            --         template = "![$CURSOR]($FILE_PATH)",
            --         download_images = false,
            --     },
            --     html = {
            --         template = '<img src="$FILE_PATH" alt="$CURSOR">',
            --     },
            -- },

            -- 📦 高级：自定义文件路径和扩展配置
            -- files = {},
            -- dirs = {},
            -- custom = {},
        },
    },


    {
        'Kicamon/markdown-table-mode.nvim',
        config = function()
            require('markdown-table-mode').setup()
        end
    },

    -- {
    --     "SCJangra/table-nvim",
    --     ft = "markdown",
    --     opts = {
    --         padd_column_separators = true,     -- Insert a space around column separators.
    --         mappings = {                       -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
    --             next = "<TAB>",                -- Go to next cell.
    --             prev = "<S-TAB>",              -- Go to previous cell.
    --             insert_row_up = "<A-k>",       -- Insert a row above the current row.
    --             insert_row_down = "<A-j>",     -- Insert a row below the current row.
    --             move_row_up = "<A-S-k>",       -- Move the current row up.
    --             move_row_down = "<A-S-j>",     -- Move the current row down.
    --             insert_column_left = "<A-h>",  -- Insert a column to the left of current column.
    --             insert_column_right = "<A-l>", -- Insert a column to the right of current column.
    --             move_column_left = "<A-S-h>",  -- Move the current column to the left.
    --             move_column_right = "<A-S-l>", -- Move the current column to the right.
    --             insert_table = "<A-t>",        -- Insert a new table.
    --             insert_table_alt = "<A-S-t>",  -- Insert a new table that is not surrounded by pipes.
    --             delete_column = "<A-d>",       -- Delete the column under cursor.
    --         },
    --     },
    -- },

    {
        "richardbizik/nvim-toc",
        ft = { "markdown" },
        keys = {
            { "<leader>mt", mode = "n", ":TOC<CR>", desc = "add TOC" },
        },
        opts = {
            toc_header = "文档目录",
        },
    },
}
