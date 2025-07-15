return {
  "folke/snacks.nvim",
  priority = 1000,
  -- enabled = false,
  event = "VeryLazy",
  -- lazy = false,
  keys = {
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "重命名文件" },
    { "<leader>fd", function() Snacks.picker.command_history() end, desc = "命令历史" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "帮助文档" },

    { "<leader>fi", function() Snacks.picker.icons() end, desc = "图标列表" },
    { "<leader>fj", function() Snacks.picker.jumps() end, desc = "跳转历史" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "按键映射" },
    { "<leader>fl", function() Snacks.picker.loclist() end, desc = "位置列表" },
    { "<leader>fH", function() Snacks.picker.highlights() end, desc = "高亮组" },
    { "<leader>fn", function() Snacks.picker.notifications() end, desc = "通知历史" },
    { "<leader>fa", function() Snacks.picker.autocmds() end, desc = "自动命令" },
    { "<leader>fp", function() Snacks.picker.registers() end, desc = "寄存器" },
    -- { '<leader>fs', function() Snacks.picker.search_history() end, desc = "搜索历史" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "查找文件" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "缓冲区" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "查找 Git 文件" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "最近打开" },
    { "<leader>e", function() Snacks.explorer() end, desc = "文件浏览器" },
    { "<leader>ft", function() Snacks.terminal() end, desc = "终端" },
    { "<leader>fz", function() Snacks.zen() end, desc = "专注模式" },
    { "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "主题切换" },

    -- 🔎 Grep 搜索
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "当前缓冲区行" },
    {
      "<leader>sB",
      function() Snacks.picker.grep_buffers() end,
      desc = "在所有缓冲区中搜索",
    },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "全局搜索" },
    {
      "<leader>sw",
      "<leader>sw",
      function() Snacks.picker.grep_word() end,
      desc = "搜索选中文本或光标词",
      mode = { "n", "x" },
    },

    -- 🧬 Git 工具
    {
      "<leader>gB",
      function() Snacks.gitbrowse() end,
      desc = "Git 浏览器",
      mode = { "n", "v" },
    },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "打开 lazygit" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git 分支" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git 提交日志" },
    {
      "<leader>gL",
      function() Snacks.picker.git_log_line() end,
      desc = "当前行提交历史",
    },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git 状态" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git 暂存区" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git 差异" },
    { "<leader>gh", function() Snacks.picker.git_log_file() end, desc = "当前文件历史" },
    -- 查看 Neovim 更新日志
    {
      "<leader>N",
      desc = "Neovim 更新日志",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  ---@class snacks.indent.Config
  ---@field enabled? boolean
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          {
            icon = "🕘 ",
            key = "r",
            desc = "历史文件",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = "🔍 ",
            key = "f",
            desc = "查找文件",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          { icon = "📄 ", key = "n", desc = "新建文件", action = ":ene | startinsert" },
          {
            icon = "🔖 ",
            key = "g",
            desc = "全局搜索文本",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = "🔨 ",
            key = "c",
            desc = "配置文件",
            action = function()
              Snacks.picker.files({
                cwd = vim.fn.expand("~/.config/nvim"), -- 📂 设置工作目录为 Neovim 配置目录
                hidden = true, -- 👁️ 显示隐藏文件
                follow = true, -- 🔗 跟随软链接
                show_untracked = true, -- 📦 显示未被 Git 跟踪的文件
              })
            end,
          },
          -- { icon = "🔨 ", key = "c", desc = "配置文件", action = ":lua Snacks.picker.files({ cwd = vim.fn.expand('~/.config/nvim'), hidden = true, follow = true })" },
          {
            icon = "📦 ",
            key = "L",
            desc = "插件管理 (Lazy)",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = "🚪 ", key = "q", desc = "退出 Neovim", action = ":qa" },
        },
        -- Used by the `header` section
        header = [[
      ___         ___                           ___
     /\__\       /\__\            ___          /\  \
    /:/  /      /:/  /           /\  \        /::\  \
   /:/  /      /:/  /            \:\  \      /:/\ \  \
  /:/  /      /:/  /  ___        /::\__\    _\:\~\ \  \
 /:/__/      /:/__/  /\__\    __/:/\/__/   /\ \:\ \ \__\
 \:\  \      \:\  \ /:/  /   /\/:/  /      \:\ \:\ \/__/
  \:\  \      \:\  /:/  /    \::/__/        \:\ \:\__\
   \:\  \      \:\/:/  /      \:\__\         \:\/:/  /
    \:\__\      \::/  /        \/__/          \::/  /
     \/__/       \/__/                         \/__/
]],
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        -- { section = "terminal", cmd = "cmatrix", hl = "header", padding = 1, indent = -45, width = 150, height = 10 },
        { section = "header" },
        { icon = " ", section = "keys", indent = 0, padding = 1, gap = 1 },
        { icon = "📄", title = "Sessions", pane = 2, padding = 0 },
        { section = "recent_files", pane = 2, indent = 0, padding = 1, gap = 0 },
        { icon = "📨", title = "Sessions", pane = 2, padding = 0 },
        { section = "projects", pane = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function() return Snacks.git.get_root() ~= nil end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
        -- {
        --   pane = 2,
        --   section = "terminal",
        --   cmd = "git status",
        --   padding = 1,
        -- },
        -- { section = "startup" },
      },
    },
    explorer = { enabled = true },

    indent = {
      priority = 1,
      enabled = false, -- enable indent guides
      char = "│",
      only_scope = false, -- only show indent guides of the scope
      only_current = false, -- only show indent guides in the current window
      -- hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
      -- can be a list of hl groups to cycle through
      hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
        "SnacksIndent6",
        "SnacksIndent7",
        "SnacksIndent8",
      },
    },
    animate = {
      enabled = vim.fn.has("nvim-0.10") == 1,
      style = "out",
      easing = "linear",
      duration = {
        step = 20, -- ms per step
        total = 500, -- maximum duration
      },
    },
    scope = {
      enabled = true, -- enable highlighting the current scope
      priority = 200,
      char = "│",
      underline = false, -- underline the start of the scope
      only_current = false, -- only show scope in the current window
      hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
    },
    chunk = {
      -- when enabled, scopes will be rendered as chunks, except for the
      -- top-level scope which will be rendered as a scope.
      enabled = false,
      -- only show chunk scopes in the current window
      only_current = false,
      priority = 200,
      hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
      char = {
        corner_top = "┌",
        corner_bottom = "└",
        -- corner_top = "╭",
        -- corner_bottom = "╰",
        horizontal = "─",
        vertical = "│",
        arrow = ">",
      },
    },
    -- filter for buffers to enable indent guides
    -- filter = function(buf)
    --     return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
    -- end,

    input = { enabled = true },
    -- picker = { enabled = true },

    -- ✅ Explorer 详细配置（按照 snacks.nvim 文档）
    picker = {
      enabled = false,
      win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
      sources = {
        explorer = {
          finder = "explorer", -- 使用 explorer finder
          sort = { fields = { "sort" } }, -- 排序字段
          supports_live = true, -- 支持实时更新
          tree = true, -- 以树结构展示
          watch = true, -- 监听文件变更
          diagnostics = false, -- 显示诊断信息（LSP）
          diagnostics_open = false, -- 打开目录时是否递归显示诊断
          git_status = false, -- 显示 Git 状态
          git_status_open = false, -- 打开目录时是否递归显示 Git 状态
          git_untracked = true, -- 显示 Git 未跟踪文件
          follow_file = true, -- 自动跟随当前 buffer 所在文件
          focus = "list", -- 默认焦点在列表区
          auto_close = false, -- 是否自动关闭
          jump = { close = false }, -- 跳转后不自动关闭
          layout = {
            preset = "sidebar", -- 使用边栏布局
            preview = false, -- 禁用预览窗口（防止占位）
            layout = {
              position = "left", -- 可以改为 "right" 显示在右侧
              width = 26, -- 🧱 设置宽度为 40 列
            },
          },
          formatters = {
            file = { filename_only = true }, -- 文件名只显示名称不带路径
            severity = { pos = "right" }, -- 诊断等级显示在右边
          },
          matcher = {
            sort_empty = false,
            fuzzy = false,
          },
          -- 注册初始化函数
          config = function(opts) return require("snacks.picker.source.explorer").setup(opts) end,
          -- 键位绑定（在文件浏览器内可用）
          win = {
            list = {
              keys = {
                ["<BS>"] = "explorer_up", -- 上级目录
                ["l"] = "confirm", -- 打开文件或目录
                ["h"] = "explorer_close", -- 关闭目录
                ["a"] = "explorer_add", -- 添加新文件
                ["d"] = "explorer_del", -- 删除文件
                ["r"] = "explorer_rename", -- 重命名
                ["c"] = "explorer_copy", -- 拷贝
                ["m"] = "explorer_move", -- 移动
                ["o"] = "explorer_open", -- 用系统应用打开
                ["P"] = "toggle_preview", -- 切换预览
                ["y"] = { "explorer_yank", mode = { "n", "x" } }, -- 复制路径
                ["p"] = "explorer_paste", -- 粘贴
                ["u"] = "explorer_update", -- 刷新
                ["<c-c>"] = "tcd", -- 设置当前目录为 cwd
                ["<leader>/"] = "picker_grep", -- 全局搜索
                ["<c-t>"] = "terminal", -- 打开终端
                ["."] = "explorer_focus", -- 聚焦资源树
                ["I"] = "toggle_ignored", -- 显示/隐藏 ignored 文件
                ["H"] = "toggle_hidden", -- 显示/隐藏隐藏文件
                ["Z"] = "explorer_close_all", -- 关闭所有目录
                ["]g"] = "explorer_git_next",
                ["[g"] = "explorer_git_prev", -- Git 跳转
                ["]d"] = "explorer_diagnostic_next",
                ["[d"] = "explorer_diagnostic_prev", -- 诊断跳转
                ["]w"] = "explorer_warn_next",
                ["[w"] = "explorer_warn_prev",
                ["]e"] = "explorer_error_next",
                ["[e"] = "explorer_error_prev",
              },
            },
          },
        },
      },
    },

    notifier = { enabled = true },
    quickfile = { enabled = true },
    -- scope = { enabled = true },
    scroll = { enabled = false }, -- 平滑滚动
    statuscolumn = { -- 状态列美化 (行号+诊断+折叠)
      enabled = true,
      left = { "mark", "git" },
      right = { "sign", "fold" },
      folds = { open = true, git_hl = true },
      git = { patterns = { "GitSign", "MiniDiffSign" } },
    },
    words = { enabled = false },
  },

  -- 'nvim-telescope/telescope.nvim',
  -- -- or                              , branch = '0.1.x',
  -- dependencies = {
  --     'nvim-lua/plenary.nvim',
  -- },
  -- keys = {
  --     { "<leader>ft", mode = { "n" }, "<cmd>TodoTelescope<cr>", desc = "待办注释" },
  --     { "<leader>ff", mode = { "n" }, function() require('telescope.builtin').find_files() end, desc = "查找文件" },
  --     { "<leader>fg", mode = { "n" }, function() require('telescope.builtin').live_grep() end, desc = "内容搜索" },
  --     { "<leader>fo", mode = { "n" }, function() require('telescope.builtin').oldfiles() end, desc = "最近打开" },
  --     { "<leader>fb", mode = { "n" }, function() require('telescope.builtin').buffers() end, desc = "打开缓冲区" },
  --     { "<leader>fh", mode = { "n" }, function() require('telescope.builtin').help_tags() end, desc = "帮助文档" },
  --     { "<leader>fc", mode = { "n" }, function() require('telescope.builtin').colorscheme() end, desc = "颜色主题" },
  -- },
  -- config = function()
  --     local tls = require("telescope")
  --     tls.setup({
  --         defaults = {
  --             layout_strategy = "flex",
  --             layout_config = {
  --                 -- flip_columns = 120, -- 小于 120 列时切 vertical
  --                 prompt_position = "top", -- 默认在顶部

  --                 horizontal = {
  --                     preview_width = 0.55,    -- 横向模式下预览窗宽度占比
  --                     prompt_position = "top", -- 横向下搜索框位置
  --                 },
  --                 vertical = {
  --                     preview_height = 0.45,   -- 纵向模式下预览窗高度占比
  --                     prompt_position = "top", -- 纵向下搜索框位置
  --                 },
  --             },
  --             -- 默认配置
  --             prompt_prefix = "🔍 ", -- 搜索前缀图标
  --             selection_caret = "👉 ", -- 选择项前的符号
  --             path_display = { "smart" }, -- 智能路径显示

  --             -- 界面行为
  --             mappings = {
  --                 i = {
  --                     ["<C-j>"] = require("telescope.actions").move_selection_next,     -- 向下移动
  --                     ["<C-k>"] = require("telescope.actions").move_selection_previous, -- 向上移动
  --                     ["<ESC>"] = require("telescope.actions").close,                   -- 按一下esc就退出
  --                     ["<C-f>"] = require("telescope.actions.layout").toggle_preview,   -- 按一下esc就退出
  --                     ["<C-s>"] = require("telescope.actions").cycle_previewers_next,
  --                     ["<C-a>"] = require("telescope.actions").cycle_previewers_prev,
  --                     ["<C-u>"] = false,                            -- 清除输入
  --                     ["<C-q>"] = require("telescope.actions").send_selected_to_qflist +
  --                         require("telescope.actions").open_qflist, -- 发送到 quickfix
  --                 },
  --                 n = {
  --                     ["<ESC>"] = require("telescope.actions").close, -- 按一下esc就退出
  --                 }
  --             },
  --         },

  --         -- 内置功能配置
  --         pickers = {
  --             find_files = {
  --                 theme = "dropdown", -- 下拉菜单样式
  --                 previewer = true,   -- 不显示预览
  --             },
  --             buffers = {
  --                 sort_mru = true, -- 最近使用的缓冲区排序
  --                 theme = "dropdown",
  --                 previewer = false,
  --             },
  --         },

  --         -- 扩展插件配置（可选）
  --         extensions = {
  --             -- fzf 模糊查找加速
  --             fzf = {
  --                 fuzzy = true,
  --                 override_generic_sorter = true,
  --                 override_file_sorter = true,
  --                 case_mode = "smart_case",
  --             },
  --         },
  --     })
  -- end
}
