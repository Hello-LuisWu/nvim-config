return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo comments" },
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "诊断信息（Trouble）", },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "当前缓冲区诊断信息（Trouble）", },
        { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "符号（Trouble）", },
        { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP 定义 / 引用 / 等（Trouble）", },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "位置列表（Trouble）", },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix 列表（Trouble）", },
    },
}
