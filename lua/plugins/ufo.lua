return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async'
    },
    config = function()
        local ufo = require("ufo")
        ufo.setup({
            open_fold_hl_timeout = 150,
            provider_selector = function()
                return { 'treesitter', 'indent' } -- 使用 treesitter 进行折叠
            end
        })

        vim.keymap.set('n', 'zr', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zm', require('ufo').closeAllFolds)
    end

}
