return {
    'nvimdev/lspsaga.nvim',
    -- keys = {
    --     {"gw", mode = "n", ":Lspsaga winbar_toggle<CR>", desc = "Lspsaga Winbar"}
    -- },
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    opts = {
        outline = {
            win_width = 10
        },
        ui = {
            code_action = '',
        },
        lightbulb = {
            enable = false,
            virtual_text = false,
        },
    }
}
