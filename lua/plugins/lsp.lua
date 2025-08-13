return {
    {
        "neovim/nvim-lspconfig",
        event = {
            "BufRead",   -- buffer读取之后,
            "BufNewFile" -- 新建文件时
        },
        dependencies = {
            {

                "williamboman/mason.nvim", -- LSP 安装工具
                version = "^1.0.0"
            },
            {
                "williamboman/mason-lspconfig.nvim", -- 自动安装 LSP
                version = "^1.0.0"
            }
        },
        -- event = { "BufReadPre", "BufNewFile" }, -- 在打开文件时加载
        config = function()
            -- 诊断信息的图标
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "»",
                    },
                },
            })
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local masonLspconfig = require("mason-lspconfig")

            --  LSP 安装状态图标
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
            masonLspconfig.setup({
                ensure_installed = {
                    "pyright",
                    "rust_analyzer",
                    "lua_ls"
                },                             -- 示例: 自动安装的 LSP
                automatic_installation = true, -- 自动安装缺失的 LSP
                automatic_enable = {
                    -- 仅启用特定服务器
                    -- "lua_ls",
                    -- "vimls",

                    -- 排除某些服务器
                    exclude = {
                        -- "rust_analyzer",
                        -- "ts_ls"
                    }
                },
                handlers = {
                    -- 安装的lsp自动启用配置
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
                -- 定义语言服务器的配置处理程序
            })


            -- -- 将 nvim-cmp（自动补全插件）的能力合并到 LSP 默认能力中
            -- -- 获取 Neovim LSP 配置的默认设置
            -- -- local lspconfig_defaults = lspconfig.util.default_config
            -- local lspconfig_defaults = lspconfig.util.default_config

            -- -- 使用深度合并方式扩展 LSP 能力配置
            -- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            --     'force',                                       -- 合并模式：强制覆盖相同字段
            --     lspconfig_defaults.capabilities,               -- LSP 默认能力
            --     require('cmp_nvim_lsp').default_capabilities() -- nvim-cmp 提供的增强能力
            -- )

            -- LSP 基础配置
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim',
                                'opts',
                                'group',
                                'Snacks'
                            } -- 声明 vim 为已知全局变量
                        },
                        workspace = {
                            -- 添加 Neovim 运行时路径
                            library = {
                                vim.api.nvim_get_runtime_file("", true)
                            }
                        }
                    }
                }

            })

            -- lspconfig.pyright.setup({})  -- Python 配置
            -- lspconfig.html.setup({})     -- Python 配置
            -- lspconfig.emmet_ls.setup({}) -- Python 配置
            -- lspconfig.tsserver.setup({}) -- TypeScript 配置

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    vim.keymap.set('n', 'gk', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = "悬停信息", buffer = event.buf })
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
                        { desc = "跳转定义", buffer = event.buf })
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
                        { desc = "跳转到声明", buffer = event.buf })
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
                        { desc = "跳转到实现", buffer = event.buf })
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
                        { desc = "跳转到类型定义", buffer = event.buf })
                    vim.keymap.set('n', 'gy', '<cmd>lua vim.lsp.buf.references()<cr>',
                        { desc = "查看引用", buffer = event.buf })
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
                        { desc = "显示函数签名帮助", buffer = event.buf })
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "重命名符号", buffer = event.buf })
                    vim.keymap.set({ 'n', 'x' }, 'gf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
                        { desc = "代码格式化", buffer = event.buf })
                    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>',
                        { desc = "代码操作", buffer = event.buf })
                    vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder,
                        { desc = "添加工作空间", buffer = event.buf })
                    vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder,
                        { desc = "移除工作空间", buffer = event.buf })
                    vim.keymap.set('n', 'gwl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, { desc = "列出工作空间", buffer = event.buf })
                end,
            })
        end,
    },
}
