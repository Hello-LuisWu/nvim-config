return{
  "jonroosevelt/gemini-cli.nvim",
    -- event = {
    --     "BufNewFile",
    --     "BufRead"
    -- },
    keys = {
        {
            "<leader>og", mode = "n",
        }
    },
  config = function()
    require("gemini").setup()
  end,
}
