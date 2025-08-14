vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set
local opt = { noremap = true, silent = true }
local optsf = { noremap = true, silent = false }

map("n", "<leader>uf",":set fileformat=unix<CR>",{desc="格式转为 unix", noremap = true, silent = true})
map("n", "<leader>uF",":set fileencoding=utf-8<CR>", {desc="编码转为 UTF-8", noremap = true, silent = true})

-- 基础键位
map("i", "jj", "<C-[>", opt)
map("i", "<C-k>", "<C-[>O")
map("i", "<C-j>", "<C-[>o")
map("n", "<Tab>", ":", optsf)
map("n", "<S-Tab>", "/", optsf)
map("n", "<BS>", ":set hlsearch!<CR>", opt)
map("i", "\\\\", "<C-[>/<++><CR>:nohlsearch<CR>c4l", opt)
map("n", "<leader><CR>", ":set wrap!<CR>", { desc = "换行按钮", noremap = true, silent = true })

map({ "n", "x" }, "<leader>j", "J", { desc = "向下融合", noremap = true, silent = true })

map({ "n", "v" }, "gF", "gg=G", { desc = "自动缩进", noremap = true, silent = true })

-- map({ "n", "v" }, "<leader>ss", "<cmd>set spell!<CR>", { desc = "开启/关闭拼写", noremap = true, silent = true })
-- map({ "n", "v" }, "<leader>sj", "]s", { desc = "下一个拼写错误", noremap = true, silent = true })
-- map({ "n", "v" }, "<leader>sk", "[s", { desc = "上一个拼写错误", noremap = true, silent = true })
-- map({ "n", "v" }, "<leader>sa", "zg", { desc = "将单词添加到词典", noremap = true, silent = true })
-- map({ "n", "v" }, "<leader>sc", "zw", { desc = "将单词移出词典", noremap = true, silent = true })
-- map({ "n", "v" }, "<leader>su", "zu", { desc = "撤销 zg/zw", noremap = true, silent = true })
-- map({ "n", "v" }, "<leader>su", "<cmd>spellr<CR>", { desc = "替换错误单词（自动使用第一个建议）", noremap = true, silent = true })

map("n", "W", "5w", opt)
map("n", "B", "5b", opt)

-- 普通模式,可视模式和等待操作模式下,行的首尾 & 页面的首尾跳转
map({ "n", "o", "v" }, "L", "$", opt)
map({ "n", "o", "v" }, "H", "0", opt)
map({ "n", "o", "v" }, "J", "5j", opt)
map({ "n", "o", "v" }, "K", "5k", opt)

-- tab 

map("n", "<Tab>", "<Cmd>tabnext<CR>", { desc = "下一个标签页" })
map("n", "<S-Tab>", "<Cmd>tabprevious<CR>", { desc = "上一个标签页" })
map("n", "<leader>tn", "<Cmd>tabnew<CR>", { desc = "新建标签页" })
map("n", "<leader>tc", "<Cmd>tabclose<CR>", { desc = "关闭标签页" })

-- Buffer 管理
map("n", "<C-Tab>", ":bnext<CR>", { desc = "下一个 Buffer", noremap = true, silent = true }) -- 下一个 Buffer
map("n", "<leader>bh", ":bprevious<CR>", { desc = "上一个 Buffer", noremap = true, silent = true }) --
map("n", "<leader>bq", ":bd<CR>", { desc = "关闭 Buffer", noremap = true, silent = true }) -- 关闭当前 Buffer

-- 5. 快速跳转
map("n", "<C-f>", "<C-f>zz", opt) -- 向下翻页并居中
map("n", "<C-b>", "<C-b>zz", opt) -- 向上翻页并居中
map("n", "n", "nzzzv", opt)       -- 搜索结果时光标居中
map("n", "N", "Nzzzv", opt)
map("n", "g,", "g,zz", { desc = "跳转变更位置并居中" })

map({ "v", "x" }, "<C-j>", ":m '>+1<CR>gv=gv", opt)
map({ "v", "x" }, "<C-k>", ":m '<-2<CR>gv=gv", opt)
-- map({ "v", "x" }, "<leader><leader>", "<C-[>", opt)

map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map("v", "<S-tab>", "<gv", opt)
map("v", "<tab>", ">gv", opt)
map("v", "<C-h>", "<gv", opt)
map("v", "<C-l>", ">gv", opt)

-- map({ "i", "n", "v" }, "<Left>", "<Nop>", opt)
-- map({ "i", "n", "v" }, "<Right>", "<Nop>", opt)
-- map({ "i", "n", "v" }, "<Up>", "<Nop>", opt)
-- map({ "i", "n", "v" }, "<Down>", "<Nop>", opt)
-- map("i", "<Esc>", "<Nop>", opt)
-- map({ "n", "v" }, "q:", "<Nop>", opt)

map("n", "j", "gj", opt)
map("n", "k", "gk", opt)

map("i", "HH", "<C-[>I", opt)
map("i", "LL", "<C-[>A", opt)
map({ "i" }, "<C-d>", "<C-[>yypA", opt)
map({ "n" }, "<C-d>", "<C-[>yyp", { desc = "再制", noremap = true, silent = true })

-- 在 normal 模式配置快捷键
map('n', '<Leader>ha', ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", { desc = "全局替换当前单词（带确认）", noremap = true, silent = true }) -- \%V 用于匹配可视选区
map('n', '<Leader>hj', ':%s/<C-r><C-w>/', { desc = "全局替换当前单词（所有行）", noremap = true, silent = true })
map('n', '<Leader>hJ', ':%s//gc<left><left><left>', { desc = "手输全局替换（带确认）", noremap = true, silent = true }) --
map('n', '<Leader>hh', ':s/<C-r><C-w>//<left>', { desc = "替换当前单词（仅所选）", noremap = true, silent = true }) --


-- 在 visual 模式配置快捷键
map('v', '<Leader>hh', '"hy:%s/<C-r>h//g<left><left>', { desc = "全局替换全部选中文本", noremap = true, silent = true }) --
map('v', '<Leader>hH', '"hy:%s/<C-r>h//gc<left><left><left>',
    { desc = "全局替换全部选中文本（带确认）", noremap = true, silent = true })

-- -- （推荐保持默认的 :%s/foo/bar/gc）
-- map('n', '<Leader>hj', ':%s/\\%V', { desc = "带确认的逐项替换" , noremap = true, silent = true }) -- \%V 用于匹配可视选区

-- --
map('n', '<Leader>hw', [[:let @/ = '\<'.expand('<cword>').'\>'<bar>set hlsearch<CR>]], { desc = "查找高亮当前单词", noremap = true, silent = true })

-- 13. 透明背景切换（适配你的高亮配置）
map("n", "<leader>tt", ":lua ToggleTransparency()<CR>", opt)
function ToggleTransparency()
    local hl = vim.api.nvim_set_hl
    hl(0, "Normal", { fg = "#ffffff", bg = "NONE" })
    hl(0, "NormalNC", { bg = "NONE" })
end

-- 窗口间的跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<leader>wc", "<cmd>close<CR>", { desc = "关闭窗口", noremap = true, silent = true })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "关闭其他窗口", noremap = true, silent = true })
map("n", "<leader>ws", "<cmd>vsplit<CR>", { desc = "垂直分屏", noremap = true, silent = true })
map("n", "<leader>wS", "<cmd>split<CR>", { desc = "水平分屏", noremap = true, silent = true })
map("n", "<leader>wh", "<C-w>H", { desc = "将窗口移到最左边", noremap = true, silent = true })
map("n", "<leader>wl", "<C-w>L", { desc = "将窗口移到最右边", noremap = true, silent = true })
map("n", "<leader>wk", "<C-w>K", { desc = "将窗口移到最上边", noremap = true, silent = true })
map("n", "<leader>wj", "<C-w>J", { desc = "将窗口移到最下边", noremap = true, silent = true })
map("n", "<leader>w=", "<C-w>=", { desc = "窗口等宽高", noremap = true, silent = true })
map("n", "<leader>wn", "<C-w>n", { desc = "新建空白窗口", noremap = true, silent = true })
map("n", "<leader>wc", "<cmd>cd %:p:h<CR><cmd>echo getcwd()<CR>",
    { desc = "进入当前文件所在目录", noremap = true, silent = true })
map("n", "<leader>wr", ":Rename<space>", { desc = "重命名文件", noremap = true, silent = false })

vim.api.nvim_create_user_command("Rename", function(opts)
    local old_name = vim.fn.expand("%")
    local new_name = opts.args
    if new_name == "" then
        print("Error: 需要提供新文件名")
        return
    end
    vim.cmd("write")                -- 确保文件已保存
    os.rename(old_name, new_name)
    vim.cmd("edit " .. new_name)    -- 重新打开文件
    vim.cmd("bdelete " .. old_name) -- 关闭旧 Buffer
    print("文件已重命名: " .. old_name .. " -> " .. new_name)
end, { nargs = 1 })

-- 复制粘贴
map({ "n" }, "<leader>aa", "ggVG", { desc = "全选", noremap = true, silent = false })
map({ "n", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "保存", noremap = true, silent = true })
map({ "v" }, "<C-c>", '"+y', { desc = "复制", noremap = true, silent = true })
-- map({ "v", "n" }, "<C-v>", '"+p', { desc = "粘贴", noremap = true, silent = true })
map("i", "<C-v>", '<Esc>"+pa', { desc = "粘贴", noremap = true, silent = true })

-- 调整窗口大小（Shift + 方向键）
map("n", "<S-Left>", ":vertical resize -5<CR>", { desc = "向左调整窗口宽度", noremap = true, silent = true })
map("n", "<S-Right>", ":vertical resize +5<CR>", { desc = "向右调整窗口宽度", noremap = true, silent = true })
map("n", "<S-Up>", ":resize -5<CR>", { desc = "向上调整窗口高度", noremap = true, silent = true })
map("n", "<S-Down>", ":resize +5<CR>", { desc = "向下调整窗口高度", noremap = true, silent = true })

map("i", "<C-j>", "<C-[>o", opt)
map("i", "<C-f>", "<C-[>O", opt)

map("n", "U", "<C-r>", opt)

-- markdown 相关映射
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local map = vim.keymap.set
        local opt = { noremap = true, silent = true }

        map("i", "\\\\", "<ESC>/<++><CR>:nohls<CR>c4l", { desc = '清除标记', noremap = true, silent = true }) -- jkej

        map("i", "<C-CR>", "<Esc>0yf o<Esc>p0<C-a>$a", opt) -- 斜体
        -- map("i", "---", "<Enter>---<Enter><br/><Enter><Enter>", opt) -- 分割线
        map("i", "BB", "**** <++><Esc>6hi", opt) -- 加粗
        map("i", "DD", "****** <++><Esc>7hi", opt) -- 加粗并斜体
        map("i", "II", "** <++><Esc>F*i", opt) -- 斜体
        map("i", "SS", "~~~~ <++><esc>6hi", opt) -- 删除线
        map("i", "UU", "<u></u> <++><Esc>2F<i", opt) -- 下划线
        map( -- 展开列表
        -- ******
            "i",
            "LS",
            "<details><Enter><summary></summary><Enter><++><Enter></details><Enter><Enter><++><Esc>4k$F<i",
            opt
        )
        -- 格式块
        map(
            "i",
            "~~",
            "~~~<Enter><Enter>~~~<Enter><++><Esc>2kA",
            opt
        )
        -- 添加图片
        map("i", "PP", "![](<++>) <++><Esc>F[a", opt)
        -- 添加链接
        map("i", "AA", "[](<++>) <++><Esc>F[a", opt)

        -- 2-4级标题
        map("i", "@@", "##<Space>", opt)
        map("i", "##", "###<Space>", opt)
        map("i", "$$", "####<Space>", opt)
    end,
})
