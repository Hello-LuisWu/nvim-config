return {
    'kevinhwang91/nvim-ufo',
    -- enabled = false,
    event = {
        "BufRead",   -- buffer读取之后,
        "BufNewFile" -- 新建文件时
    },
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
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)



        local function fold_virt_text(result, start_text, lnum)
            local text = ''
            local hl
            for i = 1, #start_text do
                local char = start_text:sub(i, i)
                local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
                local outmost_highlight = captured_highlights[#captured_highlights]
                if outmost_highlight then
                    local new_hl = '@' .. outmost_highlight.capture
                    if new_hl ~= hl then
                        -- as soon as new hl appears, push substring with current hl to table
                        table.insert(result, { text, hl })
                        text = ''
                        hl = nil
                    end
                    text = text .. char
                    hl = new_hl
                else
                    text = text .. char
                end
            end
            table.insert(result, { text, hl })
        end
        function _G.custom_foldtext()
            local start_text = vim.fn.getline(vim.v.foldstart):gsub('\t', string.rep(' ', vim.o.tabstop))
            local nline = vim.v.foldend - vim.v.foldstart
            local result = {}
            fold_virt_text(result, start_text, vim.v.foldstart - 1)
            table.insert(result, { ' ', nil })
            table.insert(result, { '◖', '@comment.warning.gitcommit' })
            table.insert(result, { '↙ ' .. nline .. ' lines', '@comment.warning' })
            table.insert(result, { '◗', '@comment.warning.gitcommit' })
            return result
        end

        vim.opt.foldtext = 'v:lua.custom_foldtext()'
    end

}
