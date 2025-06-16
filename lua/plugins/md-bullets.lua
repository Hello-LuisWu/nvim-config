return {
    "dkarter/bullets.vim",
    ft = "markdown",
    config = function()
        vim.g.bullets_enabled_file_types = { "markdown", "telekasten", "text", "gitcommit", "scratch" }
        vim.g.bullets_outline_levels = { "num", "abc", "std-" }
    end,
}
