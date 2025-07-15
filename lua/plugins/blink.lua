return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
        "mikavilpas/blink-ripgrep.nvim",
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'none',
            -- preset = "none",
            ["<C-\\>"] = { "show", "show_documentation", "hide_documentation" },
            -- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
            ["<CR>"] = { "accept", "fallback" },                          -- 更改成'select_and_accept'会选择第一项插入
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" }, -- 同时存在补全列表和snippet时，补全列表选择优先级更高

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<C-e>"] = { "snippet_forward", "select_next", "fallback" }, -- 同时存在补全列表和snippet时，snippet跳转优先级更高
            ["<C-u>"] = { "snippet_backward", "select_prev", "fallback" },
        },

        appearance = {
            highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = false,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
            kind_icons = {
                Text = '󰉿 ',
                Method = '󰊕 ',
                Function = '󰊕 ',
                Constructor = '󰒓 ',

                Field = '󰜢 ',
                Variable = '󰆦 ',
                Property = '󰖷 ',

                Class = '󱡠 ',
                Interface = '󱡠 ',
                Struct = '󱡠 ',
                Module = '󰅩 ',

                Unit = '󰪚 ',
                Value = '󰦨 ',
                Enum = '󰦨 ',
                EnumMember = '󰦨 ',

                Keyword = '󰻾 ',
                Constant = '󰏿 ',

                Snippet = '󱄽 ',
                Color = '󰏘 ',
                File = '󰈔 ',
                Reference = '󰬲 ',
                Folder = '󰉋 ',
                Event = '󱐋 ',
                Operator = '󰪚 ',
                TypeParameter = '󰬛 ',
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji', 'ripgrep' },
            providers = {
                ripgrep = {
                    score_offset = 1,
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {
                        prefix_min_len = 3,
                        context_size = 5,
                        max_filesize = "1M",
                        project_root_marker = ".git",
                        project_root_fallback = true,
                        search_casing = "--ignore-case",
                        additional_rg_options = {},
                        fallback_to_regex_highlighting = true,
                        ignore_paths = {},
                        additional_paths = {},
                        toggles = {
                        },
                        future_features = {
                            backend = {
                                use = "ripgrep",
                                customize_icon_highlight = true,
                            },
                        },
                        debug = false,
                    },
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            item.labelDetails = {
                                description = "(rg)",
                            }
                        end
                        return items
                    end,
                },
                emoji = {
                    module = "blink-emoji",
                    name = "Emoji",
                    score_offset = 15, -- Tune by preference
                    opts = {
                        insert = true, -- Insert emoji (default) or complete its name
                        ---@type string|table|fun():table
                        trigger = function()
                            return { ":" }
                        end,
                    },
                    should_show_items = function()
                        return vim.tbl_contains(
                        -- NOTE: emoji 支持的文件类型
                            { "gitcommit", "markdown", "lua" },
                            vim.o.filetype
                        )
                    end,
                },
                buffer = {
                    score_offset = 2
                },
                path = {
                    score_offset = 5
                },
                lsp = {
                    score_offset = 4
                },
                cmdline = {
                    module = 'blink.cmp.sources.cmdline',
                    -- 禁用windows上的shell命令，因为它们会导致neovim挂起
                    enabled = function()
                        return vim.fn.has('win32') == 0
                            or vim.fn.getcmdtype() ~= ':'
                            or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
                    end,
                }
            },
            per_filetype = {
                lua = { inherit_defaults = true, 'lsp', 'path' },
                sql = { 'dadbod' },
            },
            transform_items = function(_, items) return items end,
            min_keyword_length = 0,
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        cmdline = {
            enabled = true, -- 启用命令行补全（默认）
            completion = {
                menu = {
                    auto_show = false, -- 输入命令时不显示补全菜单，按 tab 才会出现
                },
            },
            keymap = {
                -- preset = '',
                -- 选择并接受预选择的第一个
                ["<CR>"] = { "select_and_accept", "fallback" },
            },
            sources = { 'buffer', 'cmdline' },
        },
        completion = {
            keyword = { range = "full" },
            -- 补全文档配置
            documentation = {
                -- 显示补全文档
                auto_show = true,
                -- 文档延迟显示时间为 0 毫秒
                auto_show_delay_ms = 0,
                -- 补全文档边框
                window = { border = 'single' }
            },
            trigger = {
                -- show_on_blocked_trigger_characters = {},
                show_on_keyword = true,
                -- show_on_x_blocked_trigger_characters = {},
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true
                }
            },
            menu = {
                -- min_width = 30,
                -- max_height = 10,
                enabled = true,
                auto_show = true,
                -- 补全菜单边框
                border = 'single',
                draw = {
                    -- 不全菜单风格,类似 cmp 的风格
                    columns = {
                        {
                            "label",
                            "label_description",
                            gap = 1
                        },
                        {
                            "kind_icon",
                            "kind"
                        }
                    },
                    treesitter = { 'lsp' },
                }
            },
            ghost_text = {
                enabled = true,
                show_with_menu = false,
            },

        },
        signature = {
            window = { border = 'single' },
            enabled = true,
        },
        -- 指定文件类型启用/禁用
        enabled = function()
            return not vim.tbl_contains({
            }, vim.bo.filetype)
        end,
    },
    opts_extend = { "sources.default" }
}
