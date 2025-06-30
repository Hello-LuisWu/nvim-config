return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
        "mikavilpas/blink-ripgrep.nvim",
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'none',
            -- preset = "none",
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
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
                Text = '󰉿',
                Method = '󰊕',
                Function = '󰊕',
                Constructor = '󰒓',

                Field = '󰜢',
                Variable = '󰆦',
                Property = '󰖷',

                Class = '󱡠',
                Interface = '󱡠',
                Struct = '󱡠',
                Module = '󰅩',

                Unit = '󰪚',
                Value = '󰦨',
                Enum = '󰦨',
                EnumMember = '󰦨',

                Keyword = '󰻾',
                Constant = '󰏿',

                Snippet = '󱄽',
                Color = '󰏘',
                File = '󰈔',
                Reference = '󰬲',
                Folder = '󰉋',
                Event = '󱐋',
                Operator = '󰪚',
                TypeParameter = '󰬛',
            },
        },

        -- (Default) Only show the documentation popup when manually triggered

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            -- Static list of providers to enable, or a function to dynamically enable/disable providers based on the context
            default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji', 'ripgrep' },
            providers = {
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    -- the options below are optional, some default values are shown
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
                        -- Enable emoji completion only for git commits and markdown.
                        -- NOTE: emoji 支持的文件类型
                            { "gitcommit", "markdown", "lua" },
                            vim.o.filetype
                        )
                    end,
                }
            },
            -- You may also define providers per filetype
            per_filetype = {
                -- optionally inherit from the `default` sources
                lua = { inherit_defaults = true, 'lsp', 'path' },
                sql = { 'dadbod' },
            },

            -- Function to use when transforming the items before they're returned for all providers
            -- The default will lower the score for snippets to sort them lower in the list
            transform_items = function(_, items) return items end,

            -- Minimum number of characters in the keyword to trigger all providers
            -- May also be `function(ctx: blink.cmp.Context): number`
            min_keyword_length = 0,
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    -- 指定文件类型启用/禁用
    enabled = function()
        return not vim.tbl_contains({
            "lua",
            -- "markdown"
        }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
    end,
    cmdline = {
        enabled = true,
        -- use 'inherit' to inherit mappings from top level `keymap` config
        keymap = { preset = 'cmdline' },
        sources = { 'buffer', 'cmdline' },

        -- OR explicitly configure per cmd type
        -- This ends up being equivalent to above since the sources disable themselves automatically
        -- when not available. You may override their `enabled` functions via
        -- `sources.providers.cmdline.override.enabled = function() return your_logic end`

        -- sources = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == '/' or type == '?' then return { 'buffer' } end
        --   -- Commands
        --   if type == ':' or type == '@' then return { 'cmdline', 'buffer' } end
        --   return {}
        -- end,
        completion = {
            documentation = {
                -- 显示补全文档
                auto_show = true,
                -- 延迟时间为0毫秒
                auto_show_delay_ms = 0,
                window = { border = 'single' }
            },
            trigger = {
                -- show_on_blocked_trigger_characters = {},
                show_on_keyword = true,
                -- show_on_x_blocked_trigger_characters = {},
            },
            -- 不预选第一个项目，选中后自动插入该项目文本
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false
                }
            },
            -- Whether to automatically show the window when new completion items are available
            menu = {
                enabled = true,
                auto_show = false,
                border = 'single',
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    treesitter = { 'lsp' }
                }
            },
            signature = { window = { border = 'single' } },
            -- Displays a preview of the selected item on the current line
            ghost_text = { enabled = true },
        },
    },
    opts_extend = { "sources.default" }
}
