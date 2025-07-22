-- ------------------------------------------------------------------------------
-- Author   : Luis Wu
-- Editor   : Neovim
-- Date     : 2025-07-22 03:16
-- Position : /Users/luis/.config/nvim/lua/config/s.lua
-- System   : Darwin 24.3.0
-- ------------------------------------------------------------------------------
-- 🧠 插入签名块
local function insert_signature()
    -- 获取注释前缀
    local ft = require("Comment.ft")
    local cmt = ft.get(vim.bo.filetype)
    local comment_prefix = ""

    if type(cmt) == "string" then
        comment_prefix = cmt:gsub("%%s", ""):gsub("%s+$", "") .. " "
    elseif type(cmt) == "table" then
        comment_prefix = (cmt[1] or "#"):gsub("%%s", ""):gsub("%s+$", "") .. " "
    else
        comment_prefix = "# "
    end

    local date = os.date("%Y-%m-%d %H:%M")
    local filepath = vim.fn.expand("%:p")
    local uname = vim.loop.os_uname()
    local sysinfo = uname.sysname .. " " .. uname.release

    local lines = {
        comment_prefix
        .. "------------------------------------------------------------------------------",
        comment_prefix .. "Author   : Luis Wu",
        comment_prefix .. "Editor   : Neovim",
        comment_prefix .. "Date     : " .. date,
        comment_prefix .. "Position : " .. filepath,
        comment_prefix .. "System   : " .. sysinfo,
        comment_prefix
        .. "------------------------------------------------------------------------------",
    }

    vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
    vim.notify("✅ 签名已插入", vim.log.levels.INFO)
end

-- 🧠 更新日期
local function update_signature_date()
    local new_date = os.date("%Y-%m-%d %H:%M")
    local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
    for i, line in ipairs(lines) do
        if line:match("Date%s*:") then
            local new_line = line:gsub("Date%s*:%s*.*", "Date     : " .. new_date)
            vim.api.nvim_buf_set_lines(0, i - 1, i, false, { new_line })
            vim.notify("✔ 日期已更新: " .. new_date, vim.log.levels.INFO)
            return
        end
    end
    vim.notify("⚠ 未找到 Date 行", vim.log.levels.WARN)
end
-- ⌨️ 快捷键（推荐使用 <leader>si / <leader>sd）
vim.keymap.set("n", "<leader>si", insert_signature, { desc = "插入签名信息" })
vim.keymap.set("n", "<leader>sd", update_signature_date, { desc = "更新签名日期" })
