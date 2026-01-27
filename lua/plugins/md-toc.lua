return {
    "richardbizik/nvim-toc",
    -- ft = { "markdown" },
    keys = {
        { "<leader>mb", mode = "n", ":TOC<CR>", desc = "add TOC" },
    },
    opts = {
        toc_header = "文档目录",
    },
}
