-- 格式化
return {
    "stevearc/conform.nvim",
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>gf",
            function() require("conform").format({ async = true, lsp_fallback = true }) end,
            mode = "n",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            javascript = { "prettierd", "prettier", stop_after_first = true },
            c = { "clang_format" },
        },
        formatters = {
            -- c indet style
            clang_format = {
                prepend_args = { "--style={IndentWidth: 4}" }, -- 设置缩进为4空格
            },
            -- 直接修改 tabstop = 2 或 修改 "~/.config/nvim/stylua.toml"
            -- stylua = {
            -- 	prepend_args = { "--indent-width", "2" },
            -- },
        },
    },
}
