return {
    'AlexvZyl/nordic.nvim',
    priority = 1000,
    config = function()
        require('nordic').load()
        vim.cmd.colorscheme('nordic')
    end
}
