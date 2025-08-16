return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        keys = {
            { "<leader>mm", mode = "n", "<cmd>RenderMarkdown toggle<CR>", desc = "编辑器内预览MD" },
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        config = function()
            local mdColors = {
                gray0 = "#000000",
                gray5 = "#0D0D0D",
                gray10 = "#1A1A1A",
                gray15 = "#262626",
                gray20 = "#333333",
                gray25 = "#404040",
                gray30 = "#4D4D4D",
                gray35 = "#595959",
                gray40 = "#666666",
                gray45 = "#737373",
                gray50 = "#808080",
                gray55 = "#8C8C8C",
                gray60 = "#999999",
                gray65 = "#A6A6A6",
                gray70 = "#B3B3B3",
                gray75 = "#BFBFBF",
                gray80 = "#CCCCCC",
                gray85 = "#D9D9D9",
                gray90 = "#E6E6E6",
                gray95 = "#F2F2F2",
                gray100 = "#ffffff",

                -- h1bg = "#332119",
                h1bg = "#4d251c",
                h2bg = "#4d4a2e",
                h3bg = "#344d39",
                h4bg = "#28414d",
                h5bg = "#171426",
                h6bg = "#26111b",
            }

            local hl = vim.api.nvim_set_hl

            -- ✅ render-markdown 图标颜色（较深色调）
            hl(0, "RenderMarkdownH1bg", { bg = mdColors.gray20 })
            hl(0, "RenderMarkdownH2bg", { bg = mdColors.gray25 })
            hl(0, "RenderMarkdownH2bg", { bg = mdColors.gray30 })
            hl(0, "RenderMarkdownH3bg", { bg = mdColors.gray35 })
            hl(0, "RenderMarkdownH4bg", { bg = mdColors.gray40 })
            hl(0, "RenderMarkdownH5bg", { bg = mdColors.gray40 })
            hl(0, "RenderMarkdownH6bg", { bg = mdColors.gray46 })

            hl(0, "RenderMarkdownH1", { fg = mdColors.gray90 })
            hl(0, "RenderMarkdownH2", { fg = mdColors.gray90 })
            hl(0, "RenderMarkdownH3", { fg = mdColors.gray100 })
            hl(0, "RenderMarkdownH4", { fg = mdColors.gray100 })
            hl(0, "RenderMarkdownH5", { fg = mdColors.gray100 })
            hl(0, "RenderMarkdownH6", { fg = mdColors.gray100 })






            --         -- ✅ 图标背景（柔和浅色背景）
            -- hl(0, "RenderMarkdownH1Bg", { bg = "#dd99ff" })
            -- hl(0, "RenderMarkdownH2Bg", { bg = "#f3f6f0" })
            -- hl(0, "RenderMarkdownH3Bg", { bg = "#eef3f6" })
            -- hl(0, "RenderMarkdownH4Bg", { bg = "#f5f0f7" })
            -- hl(0, "RenderMarkdownH5Bg", { bg = "#f8f3f3" })
            -- hl(0, "RenderMarkdownH6Bg", { bg = "#f1f7f4" })

            --         -- ✅ 标题文字颜色（Neovim 自带高亮组）
            --         -- hl(0, "markdownH1", { fg = "#222222", bold = true })
            --         -- hl(0, "markdownH2", { fg = "#3f5134", bold = true })
            --         -- hl(0, "markdownH3", { fg = "#2d4d5f", bold = true })
            --         -- hl(0, "markdownH4", { fg = "#503b5d", bold = true })
            --         -- hl(0, "markdownH5", { fg = "#5e3a42", bold = true })
            --         -- hl(0, "markdownH6", { fg = "#3c4c42", bold = true })
            require('render-markdown').setup({

                -- 是否默认启用 markdown 渲染
                enabled = true,

                -- 在哪些 Vim 模式下启用渲染（'n' 普通模式, 'c' 命令行模式, 't' 终端模式）
                render_modes = { 'n', 'c', 't' },

                -- 最大文件大小（单位：MB），超过此大小将不再渲染（避免性能问题）
                max_file_size = 10.0,

                -- 渲染更新前的防抖时间（ms），控制性能与实时性
                debounce = 100,

                -- 预设样式，可选项:
                -- 'obsidian'：仿 Obsidian UI
                -- 'lazy'：与 LazyVim 风格保持一致
                -- 'none'：不应用任何预设
                preset = 'none',

                -- 日志级别：用于调试插件（日志文件位置：vim.fn.stdpath('state') .. '/render-markdown.log'）
                -- 可选：'trace' | 'debug' | 'info' | 'warn' | 'error'
                log_level = 'error',

                -- 是否打印渲染耗时（仅用于开发/调试）
                log_runtime = false,

                -- 插件生效的文件类型（一般为 markdown）
                file_types = { 'markdown' },

                -- 是否忽略某些 buffer，返回 true 则不会对该 buffer 启用渲染
                ignore = function()
                    return false -- 不忽略任何 buffer
                end,

                -- 其他会触发重新渲染的事件（一般不需要配置）
                change_events = {},

                -- Treesitter 注入设置：允许在特定 filetype 内嵌 markdown
                injections = {
                    gitcommit = {
                        enabled = true,
                        query = [[
        ((message) @injection.content
          (#set! injection.combined)
          (#set! injection.include-children)
          (#set! injection.language "markdown"))
      ]],
                    },
                },

                -- 针对不同 filetype 的渲染行为（如代码块隐藏 conceal）
                patterns = {
                    markdown = {
                        disable = true, -- 禁用以下 directive（例如 conceal 代码块）
                        directives = {
                            { id = 17, name = 'conceal_lines' },
                            { id = 18, name = 'conceal_lines' },
                        },
                    },
                },

                -- 光标所在行避免隐藏（conceal）内容（防止影响编辑体验）
                anti_conceal = {
                    enabled = true,             -- 启用 anti conceal
                    disabled_modes = false,     -- 不排除任何模式
                    above = 0,                  -- 光标上方显示几行
                    below = 0,                  -- 光标下方显示几行
                    ignore = {
                        code_background = true, -- 总是显示代码背景
                        sign = true,            -- 总是显示折叠/诊断符号
                    },
                },

                -- 设置额外填充背景的高亮组
                padding = {
                    highlight = 'Normal', -- 使用 Normal 高亮组填充空白
                },

                -- LaTeX 渲染设置
                latex = {
                    enabled = true,                   -- 是否启用 latex 渲染
                    render_modes = false,             -- 是否仅在特定模式启用（false 表示所有 render_modes）
                    converter = 'latex2text',         -- 使用哪个程序将 latex 渲染为 Unicode 字符
                    highlight = 'RenderMarkdownMath', -- LaTeX 渲染块的高亮组
                    position = 'above',               -- 渲染在公式块的上方（可选：'above' / 'below'）
                    top_pad = 0,                      -- 上方空行数
                    bottom_pad = 0,                   -- 下方空行数
                },

                -- 钩子函数，用于扩展插件行为
                on = {
                    attach = function() end,  -- 插件首次 attach 到 buffer 时调用
                    initial = function() end, -- 插件首次渲染前调用
                    render = function() end,  -- 每次渲染完成后调用
                    clear = function() end,   -- 清除渲染时调用
                },

                -- 补全支持：用于集成补全框架，如 blink、coq、lsp
                completions = {
                    blink  = { enabled = false }, -- blink.nvim 源
                    coq    = { enabled = false }, -- coq_nvim 源
                    lsp    = { enabled = false }, -- LSP 补全

                    -- 自定义过滤规则：决定是否允许某些补全类型
                    filter = {
                        callout = function()
                            -- 例如排除 obsidian 的 callout 类型
                            return true -- 允许渲染 callout
                        end,
                        checkbox = function()
                            return true -- 允许渲染 checkbox
                        end,
                    },
                },
                heading = {
                    -- 是否启用标题图标与背景渲染
                    enabled = true,

                    -- 渲染的模式：默认 false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 是否启用 ATX 形式的标题渲染（即以 `#` 开头的标题）
                    atx = true,

                    -- 是否启用 Setext 形式的标题渲染（即以下划线 `===` 或 `---` 表示标题）
                    setext = true,

                    -- 是否在 sign column（左侧符号列）中渲染标题图标
                    sign = true,

                    -- 标题前显示的图标，可以是字符串数组或函数。
                    -- 若为数组，则按标题级别循环使用（如 H1 显示第一个图标）
                    icons = { ' 壹、 ', ' 贰、 ', ' 叁、 ', ' 肆、 ', ' 伍、 ', ' 陆、 ' },
                    -- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },

                    -- 图标的显示位置：
                    -- - "right"：图标显示在标题右侧，隐藏 `#`
                    -- - "inline"：图标内嵌在标题左侧，隐藏 `#`
                    -- - "overlay"：图标覆盖在行首位置（左对齐），完全隐藏 `#` 和空格
                    position = 'overlay',

                    -- 若 sign = true，此图标会显示在 signcolumn 中（左侧）
                    -- 多个标题级别使用同一个图标
                    signs = { '󰫎 ' },

                    -- 标题背景宽度：
                    -- - "block"：背景宽度与标题文字一致
                    -- - "full"：背景宽度覆盖整行
                    -- 也可为数组，支持根据标题级别调整
                    width = 'full',

                    -- 标题左侧空白边距（不影响 padding）
                    -- 可设定为浮点值（小于1表示占窗口比例）
                    -- 或数字数组，按标题级别设定
                    left_margin = 0,

                    -- 标题左侧填充宽度（内部 padding），与 margin 叠加
                    left_pad = 0,

                    -- 标题右侧填充宽度（仅当 width = "block" 时有效）
                    right_pad = 0,

                    -- 当 width = "block" 时，最小标题宽度（防止太窄）
                    min_width = 0,

                    -- 是否为标题添加上下边框（如“═”样式）
                    -- 可为布尔值或数组，按标题级别控制
                    border = true,

                    -- 是否强制使用虚拟行绘制边框（不使用空行）
                    border_virtual = false,

                    -- 是否高亮边框起始字符
                    border_prefix = false,

                    -- 上边框字符（默认为 ▄）
                    above = '▄',

                    -- 下边框字符（默认为 ▀）
                    below = '▀',

                    -- 每级标题对应的背景高亮组（填满整行或部分）
                    backgrounds = {
                        'RenderMarkdownH1Bg',
                        'RenderMarkdownH2Bg',
                        'RenderMarkdownH3Bg',
                        'RenderMarkdownH4Bg',
                        'RenderMarkdownH5Bg',
                        'RenderMarkdownH6Bg',
                    },

                    -- 每级标题图标与文字的前景色高亮组
                    foregrounds = {
                        'RenderMarkdownH1',
                        'RenderMarkdownH2',
                        'RenderMarkdownH3',
                        'RenderMarkdownH4',
                        'RenderMarkdownH5',
                        'RenderMarkdownH6',
                    },

                    -- 自定义标题样式匹配规则，可按标题内容匹配特定样式：
                    -- 每个项为：
                    --   pattern    = Lua 字符串模式，用于匹配标题文本
                    --   icon       = 自定义图标（可选）
                    --   background = 自定义背景高亮组（可选）
                    --   foreground = 自定义前景高亮组（可选）
                    custom = {},
                },
                paragraph = {
                    -- 是否启用段落渲染（启用后段落将获得格式化处理，比如统一边距或缩进）
                    enabled = true,

                    -- 设置在哪些模式下渲染段落，默认为 false 使用全局 render_modes 设置
                    -- 可以设置为：{ "n", "i", "c", "v" } 等 Vim 模式
                    render_modes = false,

                    -- 段落左侧的边距（左空白），支持：
                    --   1. 直接填写数字（表示字符宽度）
                    --   2. 浮点数 < 1（表示窗口宽度的百分比，如 0.05 表示占 5% 宽度）
                    --   3. 函数：可以动态判断 context 参数
                    -- context 中只有 `text` 字段，即段落文本内容
                    left_margin = 0,

                    -- 每段第一行的左缩进宽度（区别于 margin，padding 会嵌在段落内部）
                    -- 一般用于模拟首行缩进 2 字符等排版风格
                    -- 用法与 left_margin 相同
                    indent = 0,

                    -- 设置段落的最小显示宽度，防止段落太窄影响阅读
                    -- 可用于控制是否换行（如果不希望段落自动折行）
                    min_width = 0,
                },
                code = {
                    -- 是否启用代码块和行内代码的渲染
                    enabled = true,

                    -- 指定在哪些模式下渲染代码块，默认为 false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 是否在 sign column（符号列）中渲染语言图标等信息
                    sign = true,

                    -- 渲染风格：
                    -- 'none'：完全禁用渲染
                    -- 'normal'：添加高亮和代码块边距
                    -- 'language'：只显示语言图标和名称
                    -- 'full'：完整显示语言图标、名称、高亮、背景
                    style = 'full',

                    -- 语言图标显示位置：
                    -- 'left'：代码块左侧显示图标
                    -- 'right'：右侧显示图标
                    position = 'left',

                    -- 语言信息与图标周围的左右边距
                    -- 可设为具体字符数或 < 1 的浮点数表示相对于窗口宽度的百分比
                    language_pad = 0,

                    -- 是否显示代码块的语言图标（如 Lua、Python 图标）
                    language_icon = true,

                    -- 是否显示语言名称（如 lua、python）
                    language_name = true,

                    -- 是否显示完整语言信息（包含语言名称和可选信息）
                    language_info = true,

                    -- 禁用某些语言的背景高亮（例如 diff 语言自身已有背景色）
                    -- 也可以设为 true 禁用所有语言背景
                    disable_background = { 'diff' },

                    -- 设置代码块的背景宽度：
                    -- 'block'：代码块的实际宽度
                    -- 'full'：窗口的整行宽度
                    width = 'full',

                    -- 左边距（整个代码块的外边距）
                    left_margin = 0,

                    -- 左内边距（代码块文本与边界之间的距离）
                    left_pad = 0,

                    -- 右内边距，仅在 width 为 'block' 时有效
                    right_pad = 0,

                    -- 设置最小宽度，避免代码块过窄影响排版
                    min_width = 0,

                    -- 代码块顶部和底部的边框样式：
                    -- 'none'：无边框
                    -- 'thick'：使用代码块本身高亮作为边框
                    -- 'thin'：使用字符绘制细线边框
                    -- 'hide'：隐藏边框（除非启用了语言名或图标）
                    border = 'hide',

                    -- 显示语言名时，顶部多余区域的填充字符（用于对齐）
                    language_border = '█',

                    -- 语言标签左侧附加字符
                    language_left = '',

                    -- 语言标签右侧附加字符
                    language_right = '',

                    -- thin 边框模式下的顶部边框字符
                    above = '▄',

                    -- thin 边框模式下的底部边框字符
                    below = '▀',

                    -- 行内代码左侧添加的字符（如 backtick `）
                    inline_left = '',

                    -- 行内代码右侧添加的字符
                    inline_right = '',

                    -- 行内代码左右的内边距
                    inline_pad = 0,

                    -- 代码块本体的高亮组
                    highlight = 'RenderMarkdownCode',

                    -- 语言信息区域（如语言名之后的注释信息）的高亮组
                    highlight_info = 'RenderMarkdownCodeInfo',

                    -- 指定语言标签高亮样式（可覆盖图标提供器的默认值）
                    highlight_language = nil,

                    -- 代码块边框高亮（设为 false 则禁用边框高亮）
                    highlight_border = 'RenderMarkdownCodeBorder',

                    -- 如果图标提供器没有匹配图标，使用该高亮样式作为后备
                    highlight_fallback = 'RenderMarkdownCodeFallback',

                    -- 行内代码的高亮样式
                    highlight_inline = 'RenderMarkdownCodeInline',
                },
                dash = {
                    -- 是否启用分隔线（thematic break）的渲染功能
                    enabled = true,

                    -- 指定在哪些模式下渲染分隔线
                    -- false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 用于替换 Markdown 中的分隔线（例如 "---", "***", "___", "* * *"）
                    -- 此字符会被重复渲染以填满整行，通常用来美化视觉效果
                    icon = '─',

                    -- 分隔线的总宽度
                    -- 可选值：
                    --   数字：指定固定字符数的宽度
                    --   'full'：自动匹配窗口宽度
                    --   小于 1 的浮点数：表示窗口宽度的百分比（例如 0.8 表示 80% 宽度）
                    width = 'full',

                    -- 分隔线的左边距（即整体缩进）
                    -- 可以是数字或小于 1 的浮点数，表示相对于窗口宽度的百分比
                    left_margin = 0,

                    -- 分隔线的高亮组名（必须是一个合法的 highlight group）
                    -- 会应用到整条渲染出的横线
                    highlight = 'RenderMarkdownDash',
                },
                document = {
                    -- 是否启用整个文档级别的渲染功能
                    -- 启用后可对文档应用全局视觉优化（如隐藏、样式等）
                    enabled = true,

                    -- 指定在哪些模式下渲染文档
                    -- 默认为 false 表示使用全局 render_modes 设置
                    -- 你也可以设置为 { "n", "i" } 这种模式列表以限定生效模式
                    render_modes = false,

                    -- 配置用于隐藏（conceal）文档中任意文本范围的模式
                    -- 通过 Lua 模式匹配来指定隐藏目标区域（:h lua-patterns）
                    -- 注意：你需要确保这些模式不会误伤其他正常内容

                    conceal = {
                        -- 字符级隐藏模式（将匹配到的字符串用一个字符替代）
                        -- 例如：隐藏所有大括号里的内容
                        -- char_patterns = { { pattern = "{.-}", replacement = "…" } }
                        char_patterns = {},

                        -- 行级隐藏模式（将整行文本隐藏起来）
                        -- 用于折叠如元数据块、注释块等整段内容
                        -- 例如：隐藏以 `<!--` 开头的注释行
                        -- line_patterns = { { pattern = "^<!%-%-.-%-%->" } }
                        line_patterns = {},
                    },
                },
                bullet = {
                    -- 可用上下文信息，在函数中可以用它做动态判断：
                    -- | level | 当前列表项的嵌套层级，从 1 开始（例如子列表就是 level=2）       |
                    -- | index | 当前层级下该项是第几个，从 1 开始                              |
                    -- | value | 当前节点原始的项目标记内容（如 "-"、"1." 等）                 |

                    -- 是否启用列表符号（bullet）渲染功能
                    -- 启用后可以美化 Markdown 列表符号，如替换 "-", "*", "1." 等为图标
                    enabled = true,

                    -- 指定在哪些模式下启用 bullet 渲染，默认 false 表示使用全局 render_modes 配置
                    -- 示例：{ "n", "i" } 表示在普通模式和插入模式下启用
                    render_modes = false,

                    -- 替换 Markdown 中的无序列表符号，如 "-"、"+"、"*"
                    -- 支持多种写法：
                    -- - 单个字符串（始终用一个符号）
                    -- - 字符串数组（根据嵌套 level 层级循环选择）
                    -- - 字符串二维数组（根据 level + index 控制）
                    -- - 函数（动态生成符号）
                    icons = { '●', '○', '◆', '◇' }, -- 可选：⚫ ✦ ▸ ▹ ▪ ▫ ➤ ➣ 等

                    -- 替换有序列表符号，如 "1.", "2)", 等
                    -- 返回值格式是一个字符串，如 "1."、"②)" 等
                    -- 默认行为是显示正常编号，从 1 开始
                    ordered_icons = function(ctx)
                        local value = vim.trim(ctx.value)                       -- 获取原始值
                        local index = tonumber(value:sub(1, #value - 1))        -- 提取数字部分
                        return ('%d.'):format(index > 1 and index or ctx.index) -- 优先使用原始数字，否则使用当前索引
                    end,

                    -- bullet 左边的空白填充（用于对齐或美观）
                    -- 可以是固定数字，也可以是函数
                    left_pad = 0,

                    -- bullet 右边的空白填充（用于缩进）
                    -- 也可以是函数或固定数字
                    right_pad = 0,

                    -- bullet 图标使用的高亮组
                    -- 可自定义颜色样式，比如：
                    -- highlight RenderMarkdownBullet guifg=#fabd2f
                    highlight = 'RenderMarkdownBullet',

                    -- 控制整个列表项内容的高亮（非 bullet）
                    -- 通常为空，如果你需要整项高亮可以定义 highlight 名称数组或函数
                    scope_highlight = {},
                },
                checkbox = {
                    -- 复选框是列表项(list_item)的一种特殊形式，以快捷链接(shortcut_link)开头
                    -- Markdown 语法中定义了两种特殊状态：未选中和已选中

                    -- 是否启用复选框状态渲染
                    enabled = true,

                    -- 指定在哪些模式下渲染复选框，默认 false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 是否在复选框前面渲染项目符号（bullet）
                    bullet = false,

                    -- 复选框右侧的填充空白宽度（用于视觉间距）
                    right_pad = 1,

                    unchecked = {
                        -- 替换 Markdown 中未选中复选框 '[ ]' 的图标显示
                        icon = '󰄱 ',
                        -- 未选中复选框图标使用的高亮组
                        highlight = 'RenderMarkdownUnchecked',
                        -- 与未选中复选框关联的整项内容高亮（可为 nil 表示不高亮）
                        scope_highlight = nil,
                    },

                    checked = {
                        -- 替换 Markdown 中已选中复选框 '[x]' 的图标显示
                        icon = '󰱒 ',
                        -- 已选中复选框图标使用的高亮组
                        highlight = 'RenderMarkdownChecked',
                        -- 与已选中复选框关联的整项内容高亮（可为 nil 表示不高亮）
                        scope_highlight = nil,
                    },

                    -- 自定义复选框状态（扩展 Markdown 语法外的复选框样式）
                    -- 需要 Neovim 0.10.0 及以上版本支持，因为依赖 inline extmarks 技术
                    -- key 是用来健康检查和允许用户自定义的键名，value 类型说明：
                    -- | raw             | 匹配到的原始复选框文本 (如 '[-]')                  |
                    -- | rendered        | 替换显示的图标                                        |
                    -- | highlight       | 渲染图标使用的高亮组                                  |
                    -- | scope_highlight | 与自定义复选框关联的整项内容高亮（可选）             |
                    custom = {
                        -- 例如定义一个 todo 状态的复选框，原文本为 '[-]'，显示图标为 '󰥔 '
                        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                    },
                },
                quote = {
                    -- 是否启用块引用（block quote）和提示框（callout）的渲染
                    enabled = true,

                    -- 指定在哪些模式下渲染引用，默认 false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 替换 Markdown 中块引用标记 '>' 的图标，用于视觉显示
                    icon = '▋',

                    -- 是否在换行后的行重复显示引用图标（需要 Neovim >= 0.10 支持）
                    -- 注意：如果同时启用了 showbreak、breakindent、breakindentopt，配置不当可能导致文本被遮挡
                    -- 推荐配置示例（需自行在主配置中设置）：
                    --   showbreak      设置为两个空格 '  '
                    --   breakindent    设为 true
                    --   breakindentopt 设置为空字符串 ''
                    repeat_linebreak = false,

                    -- 引用图标使用的高亮组，可以是一个列表，按照层级循环使用
                    highlight = {
                        'RenderMarkdownQuote1', -- 第一层引用高亮
                        'RenderMarkdownQuote2', -- 第二层引用高亮
                        'RenderMarkdownQuote3', -- 第三层引用高亮
                        'RenderMarkdownQuote4', -- 第四层引用高亮
                        'RenderMarkdownQuote5', -- 第五层引用高亮
                        'RenderMarkdownQuote6', -- 第六层引用高亮
                    },
                },
                pipe_table = {
                    -- 是否启用管道表格（Markdown中以 | 分隔的表格）的渲染
                    enabled = true,

                    -- 指定在哪些模式下渲染管道表格，false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 预设风格，方便快速设置表格边框样式
                    -- 可选值：
                    -- 'heavy'  : 使用更粗的边框字符
                    -- 'double' : 使用双线边框字符
                    -- 'round'  : 使用圆角边框字符
                    -- 'none'   : 不做任何特殊处理
                    preset = 'none',

                    -- 整个表格的渲染方式
                    -- 'none'  : 禁用所有表格渲染
                    -- 'normal': 对表格每一行应用单元格样式渲染
                    -- 'full'  : normal 基础上额外绘制顶线和底线填满整个表格宽度（当列宽匹配时）
                    style = 'full',

                    -- 单元格的渲染方式
                    -- 'overlay': 完全覆盖表格，取消 conceal 和高亮
                    -- 'raw'    : 只替换每行中的 '|' 字符，不修改单元格内容
                    -- 'padded' : raw 基础上为单元格内容添加空格填充到最大视觉宽度
                    -- 'trimmed': padded 基础上减去空白部分对视觉宽度的计算
                    cell = 'padded',

                    -- 单元格内容与边框之间的空白宽度（填充量）
                    padding = 1,

                    -- 单元格的最小列宽（只对 padded 或 trimmed 生效）
                    min_width = 0,

                    -- 用于替换表格边框的字符，顺序对应：
                    -- 顶部三字符，分隔行三字符，底部三字符，竖线字符，横线字符
                    -- 依次为：top-left, top-middle, top-right,
                    --          mid-left, mid-middle, mid-right,
                    --          bottom-left, bottom-middle, bottom-right,
                    --          vertical, horizontal
                    border = {
                        '┌', '┬', '┐',
                        '├', '┼', '┤',
                        '└', '┴', '┘',
                        '│', '─',
                    },

                    -- 是否总是使用虚拟线（virtual lines）来绘制表格边框
                    -- 而不是尝试使用空白行，开启缩进模块时会自动启用
                    border_virtual = false,

                    -- 分隔行中每列的对齐指示符，基于对齐方式定位
                    alignment_indicator = '━',

                    -- 表头、分隔线及其上一行的高亮组
                    head = 'RenderMarkdownTableHead',

                    -- 其它部分（主要表格行及其下一行）的高亮组
                    row = 'RenderMarkdownTableRow',

                    -- 用于为被 conceal 掉的空白部分补充的内联填充高亮
                    filler = 'RenderMarkdownTableFill',
                },
                callout = {
                    -- Callout 是块引用（block_quote）的特殊形式，通常以快捷链接（shortcut_link）开头
                    -- 这里的 key 用于健康检查和允许用户自定义这些值
                    -- 各字段含义：
                    -- | raw        | 匹配原始文本内容（不区分大小写）                         |
                    -- | rendered   | 渲染时替换显示的文本内容                                 |
                    -- | highlight  | 用于渲染文本和引用符号的高亮组                           |
                    -- | quote_icon | （可选）覆盖单个 callout 的引用图标                      |
                    -- | category   | （可选）元数据分类，方便过滤和区分不同来源的 callout     |

                    -- GitHub 风格的 Callout
                    note      = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo', category = 'github' },
                    tip       = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess', category = 'github' },
                    important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint', category = 'github' },
                    warning   = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn', category = 'github' },
                    caution   = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError', category = 'github' },

                    -- Obsidian 风格的 Callout，参考 Obsidian 官方帮助文档
                    abstract  = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo', category = 'obsidian' },
                    summary   = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo', category = 'obsidian' },
                    tldr      = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo', category = 'obsidian' },
                    info      = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo', category = 'obsidian' },
                    todo      = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo', category = 'obsidian' },
                    hint      = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
                    success   = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
                    check     = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
                    done      = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
                    question  = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn', category = 'obsidian' },
                    help      = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn', category = 'obsidian' },
                    faq       = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn', category = 'obsidian' },
                    attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn', category = 'obsidian' },
                    failure   = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError', category = 'obsidian' },
                    fail      = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError', category = 'obsidian' },
                    missing   = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError', category = 'obsidian' },
                    danger    = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError', category = 'obsidian' },
                    error     = { raw = '[!ERROR]', rendered = '󱐌 Error', highlight = 'RenderMarkdownError', category = 'obsidian' },
                    bug       = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError', category = 'obsidian' },
                    example   = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint', category = 'obsidian' },
                    quote     = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote', category = 'obsidian' },
                    cite      = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote', category = 'obsidian' },
                },
                link = {
                    -- 是否启用内联链接图标渲染
                    enabled = true,
                    -- 额外生效的模式，默认 false 表示使用全局 render_modes
                    render_modes = false,
                    -- 脚注链接（以 '^' 开头）处理配置
                    footnote = {
                        -- 是否启用脚注渲染
                        enabled = true,
                        -- 是否将脚注文本替换为上标格式（如^1）
                        superscript = true,
                        -- 链接内容前缀
                        prefix = '',
                        -- 链接内容后缀
                        suffix = '',
                    },
                    -- 图片元素内联图标（显示在图片链接旁边）
                    image = '󰥶 ',
                    -- 邮箱自动链接的内联图标
                    email = '󰀓 ',
                    -- 内联链接和 URI 自动链接的默认图标
                    hyperlink = '󰌹 ',
                    -- 应用于内联图标的高亮组（默认图标高亮）
                    highlight = 'RenderMarkdownLink',
                    -- Wiki 链接元素的相关配置
                    wiki = {
                        -- Wiki 链接的图标
                        icon = '󱗖 ',
                        -- Wiki 链接的主体渲染函数（这里返回 nil 表示使用默认）
                        body = function()
                            return nil
                        end,
                        -- Wiki 链接的高亮组
                        highlight = 'RenderMarkdownWikiLink',
                    },
                    -- 自定义链接目标模式，根据目标内容匹配并显示对应图标
                    -- 适用于内联链接、URI自动链接、Wiki链接节点
                    -- 当多个模式匹配时，优先匹配最长的模式
                    -- 各字段含义：
                    -- | pattern   | 用于匹配链接目标的字符串或Lua模式                         |
                    -- | icon      | 匹配后显示的图标                                            |
                    -- | kind      | 可选，定义匹配方式，默认是 Lua 模式匹配                    |
                    -- | priority  | 可选，优先级，默认按 pattern 长度排序                      |
                    -- | highlight | 可选，图标的高亮组，若为空则使用 fallback                   |
                    custom = {
                        web = { pattern = '^http', icon = '󰖟 ' }, -- 匹配以 http 开头的网页链接
                        discord = { pattern = 'discord%.com', icon = '󰙯 ' }, -- 匹配 discord.com 域名
                        github = { pattern = 'github%.com', icon = '󰊤 ' }, -- 匹配 github.com 域名
                        gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' }, -- 匹配 gitlab.com 域名
                        google = { pattern = 'google%.com', icon = '󰊭 ' }, -- 匹配 google.com 域名
                        neovim = { pattern = 'neovim%.io', icon = ' ' }, -- 匹配 neovim.io 域名
                        reddit = { pattern = 'reddit%.com', icon = '󰑍 ' }, -- 匹配 reddit.com 域名
                        stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' }, -- 匹配 stackoverflow.com 域名
                        wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' }, -- 匹配 wikipedia.org 域名
                        youtube = { pattern = 'youtube%.com', icon = '󰗃 ' }, -- 匹配 youtube.com 域名
                    },
                },
                sign = {
                    -- 是否启用标记（sign）渲染
                    -- 标记通常显示在行号左侧的符号栏，用于增强视觉提示
                    enabled = false,

                    -- 标记文本背景所使用的高亮组名称
                    -- 该高亮组控制标记的背景颜色和样式
                    highlight = 'RenderMarkdownSign',
                },
                inline_highlight = {
                    -- 模拟 Obsidian 的内联高亮效果，当内容被双等号（==）包围时生效
                    -- 双等号会被隐藏，内部内容会被高亮显示，突出显示文本片段

                    -- 是否启用内联高亮渲染开关
                    enabled = true,

                    -- 指定在哪些模式下渲染内联高亮
                    -- 默认为 false，表示使用全局的 render_modes 设置
                    render_modes = false,

                    -- 应用于被双等号包围文本的背景高亮组名称
                    highlight = 'RenderMarkdownInlineHighlight',
                },
                indent = {
                    -- 模拟 org-indent-mode 的行为，根据标题级别缩进标题下的内容
                    -- 默认从二级标题（level 2）开始缩进

                    -- 是否启用缩进渲染功能（org-indent-mode 模拟）
                    enabled = false,

                    -- 指定在哪些模式下启用缩进渲染，false 表示使用全局 render_modes 设置
                    render_modes = false,

                    -- 每一级标题增加的额外缩进空格数（每级缩进量）
                    per_level = 2,

                    -- 小于等于该级别的标题不进行缩进
                    -- 例如设为1，则1级标题不缩进，2级及以上缩进
                    -- 设置为0则从一级标题开始缩进
                    skip_level = 1,

                    -- 是否跳过标题本身只缩进标题下的正文内容
                    skip_heading = false,

                    -- 缩进前缀图标（每级缩进一个图标）
                    icon = '▎',

                    -- 缩进图标的高亮组名称
                    highlight = 'RenderMarkdownIndent',
                },
                html = {
                    -- 是否启用 HTML 相关的渲染功能
                    enabled = true,

                    -- 指定在哪些模式下渲染 HTML，false 表示使用全局 render_modes 设置
                    render_modes = false,

                    comment = {
                        -- 是否启用对 HTML 注释的隐藏（conceal）功能
                        conceal = true,

                        -- 隐藏的注释前面可选插入的文本（一般用于提示或图标），默认无
                        text = nil,

                        -- 插入文本的高亮组名称，默认为 'RenderMarkdownHtmlComment'
                        highlight = 'RenderMarkdownHtmlComment',
                    },

                    -- 配置要隐藏的 HTML 标签，隐藏起始和结束标签，并显示指定的图标
                    -- key 是标签名，value 包含以下字段：
                    -- | icon      | 替代显示在标签开始处的图标字符或字符串
                    -- | highlight | 图标使用的高亮组名称
                    tag = {
                        -- 例如:
                        -- div = { icon = '󰙯', highlight = 'RenderMarkdownHtmlTag' },
                        -- span = { icon = '󰅴', highlight = 'RenderMarkdownHtmlTag' },
                    },
                },
                win_options = {
                    -- 窗口选项配置，用于在“渲染视图”和“原始视图”之间切换时动态调整相关参数

                    -- conceallevel 相关设置，控制文本隐藏和替代字符的显示
                    -- 详见 Vim 帮助文档 :h 'conceallevel'
                    conceallevel = {
                        -- 原始视图时使用的 conceallevel，默认取当前用户全局设置值
                        default = vim.o.conceallevel,
                        -- 渲染视图时使用的 conceallevel，设为 3 表示完全隐藏被 conceal 的文本
                        rendered = 3,
                    },

                    -- concealcursor 相关设置，控制在哪些光标模式下显示 conceal 字符
                    -- 详见 Vim 帮助文档 :h 'concealcursor'
                    concealcursor = {
                        -- 原始视图时使用的 concealcursor，默认取当前用户全局设置值
                        default = vim.o.concealcursor,
                        -- 渲染视图时使用的 concealcursor，空字符串表示在所有模式下都显示被 conceal 的文本（即不隐藏）
                        rendered = '',
                    },
                },
                overrides = {
                    -- 更细粒度的配置机制，允许针对不同缓冲区的特定属性设置不同的行为和配置。
                    -- 如果某个字段没有被覆盖，则会使用顶层配置中的默认值。
                    -- 支持覆盖的字段包括：
                    -- enabled, max_file_size, debounce, render_modes, anti_conceal, padding, heading, paragraph,
                    -- code, dash, bullet, checkbox, quote, pipe_table, callout, link, sign, indent, latex, html,
                    -- win_options 等。

                    -- 根据缓冲区的 buflisted 属性进行配置覆盖，详见 :h 'buflisted'
                    buflisted = {},

                    -- 根据缓冲区的 buftype 属性进行配置覆盖，详见 :h 'buftype'
                    buftype = {
                        -- 针对 buftype 为 "nofile" 的缓冲区进行特殊配置
                        nofile = {
                            -- 渲染模式设置为 true，表示在所有模式下都渲染
                            render_modes = true,
                            -- 填充的高亮组使用 'NormalFloat'，通常用于浮动窗口背景
                            padding = { highlight = 'NormalFloat' },
                            -- 禁用符号列渲染（例如折叠符号、标记等）
                            sign = { enabled = false },
                        },
                    },

                    -- 根据缓冲区的 filetype（文件类型）属性进行配置覆盖，详见 :h 'filetype'
                    filetype = {},
                },
                custom_handlers = {
                    -- 用户自定义的处理函数映射表，键为 Treesitter 支持的语言名称（language）。
                    -- 你可以为特定语言指定自定义的渲染处理函数，从而覆盖默认的渲染行为。
                    -- 具体实现和示例请参考插件文档中的 Custom Handlers 部分：
                    -- @see [Custom Handlers](doc/custom-handlers.md)
                    --
                    -- 例如：
                    -- lua = function(args)
                    --     -- 自定义处理 Lua 代码块的渲染逻辑
                    -- end,
                },
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
        keys = {
            {
                "<leader>md", mode = "n", "<cmd>MarkdownPreviewToggle<cr>", desc = "nvim 内预览 MD",
            },
        },
        config = function()
            vim.g.mkdp_auto_close = true
            vim.g.mkdp_open_to_the_world = false
            vim.g.mkdp_open_ip = "127.0.0.1"
            vim.g.mkdp_port = "8888"
            vim.g.mkdp_browser = ""
            vim.g.mkdp_echo_preview_url = true
            vim.g.mkdp_page_title = "${name}"
        end,
    },
    {
        "dkarter/bullets.vim",
        ft = "markdown",
        config = function()
            vim.g.bullets_enabled_file_types =
            { "markdown", "telekasten", "text", "gitcommit", "scratch" }
            vim.g.bullets_outline_levels = { "num", "abc", "std-" }
        end,
    },
    {
        "img-paste-devs/img-paste.vim",
        ft = "markdown",
        config = function()
            vim.cmd([[
        autocmd FileType markdown nmap <buffer><silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>
        " there are some defaults for image directory and image name, you can change them
        " let g:mdip_imgdir = 'img'
        " let g:mdip_imgname = 'image'
        function! g:LatexPasteImage(relpath)
            execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
            let ipos = getcurpos()
            execute "normal! a" . "mage}"
            call setpos('.', ipos)
            execute "normal! ve\<C-g>"
        endfunction
        autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
        autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
        ]])
        end,
    },

    {
        'Kicamon/markdown-table-mode.nvim',
        ft = "markdown",
        keys = {
            { "<leader>mt", mode = "n", "<cmd>Mtm<CR>", desc = "绘制表格", }
        },
        config = function()
            require('markdown-table-mode').setup({
                options = {
                    insert = true,              -- when typing "|"
                    insert_leave = true,        -- when leaving insert
                    pad_separator_line = false, -- add space in separator line
                    alig_style = 'default',     -- default, left, center, right
                },
            })
        end
    },

    {
        "richardbizik/nvim-toc",
        -- ft = { "markdown" },
        keys = {
            { "<leader>mb", mode = "n", ":TOC<CR>", desc = "add TOC" },
        },
        opts = {
            toc_header = "文档目录",
        },
    },
}
