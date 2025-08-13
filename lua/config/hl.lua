local cls = ({
    black       = "#222222",
    gray_darker = "#2c313a", -- 次级背景/边框
    gray_dark   = "#3e4452", -- 非活动元素
    gray        = "#5c6370", -- 注释/非活动文本
    gray_light  = "#7f848e", -- 弱化文本
    white       = "#ffffff", -- 主前景色

    gray0       = "#000000",
    gray5       = "#0D0D0D",
    gray10      = "#1A1A1A",
    gray15      = "#262626",
    gray20      = "#333333",
    gray25      = "#404040",
    gray30      = "#4D4D4D",
    gray35      = "#595959",
    gray40      = "#666666",
    gray45      = "#737373",
    gray50      = "#808080",
    gray55      = "#8C8C8C",
    gray60      = "#999999",
    gray65      = "#A6A6A6",
    gray70      = "#B3B3B3",
    gray75      = "#BFBFBF",
    gray80      = "#CCCCCC",
    gray85      = "#D9D9D9",
    gray90      = "#E6E6E6",
    gray95      = "#F2F2F2",
    gray100     = "#ffffff",

    -- 标准色
    red         = "#FF0000",
    orange      = "#FFA500",
    yellow      = "#FFFF00",
    green       = "#008000",
    cyan        = "#00FFFF",
    blue        = "#0000FF",
    purple      = "#800080",

    -- 浅色系
    light       = {
        Pink = "#FFB6C1",
        Orange = "#FFDAB9",
        Yellow = "#FFFACD",
        Green = "#90EE90",
        Cyan = "#E0FFFF",
        Blue = "#ADD8E6",
        Purple = "#D8BFD8",
    },

    -- 深色系
    dark        = {
        darkRed = "#8B0000",
        darkOrange = "#FF8C00",
        darkYellow = "#e1df43",
        darkGreen = "#006400",
        darkCyan = "#008B8B",
        darkBlue = "#00008B",
        darkPurple = "#4B0082",

    },

    subcolor    = {
        red    = "#e06c75", -- 错误/删除操作
        yellow = "#f8e64c", -- 警告/提示
        green  = "#98c379", -- 成功/新增内容
        cyan   = "#56b6c2", -- 信息/水色元素
        blue   = "#61afef", -- 超链接/按钮
        purple = "#c678dd", -- 关键字/特殊状态
        orange = "#e7ad5b"  -- 警告/数值

    }
})
local diagnostic = ({
    error = cls.red,
    warning = cls.yellow,
    info = cls.blue,
    success = cls.green
})
local vimThemes = ({
    bg = cls.black,
    fg = cls.white,
    cursor_line = cls.gray_dark,
    border = cls.gray
})

local hl = vim.api.nvim_set_hl

-- 设置背景和前景色
hl(0, "Normal", { fg = vimThemes.fg, bg = cls.gray10 })  -- 普通文本（白色前景，黑色背景）
hl(0, "NonText", { fg = "#555555", bg = "#222222" })  -- 代表不可见字符（如换行符、空格等）。
hl(0, "NormalNC", { fg = "#ffffaf", bg = "#444455" }) -- 这是非活动窗口的“普通”文本高亮（与 Normal 类似，但用于非活动窗口）。
-- highlight(0, "VisualMode", { fg = "#ffffaf", bg = "#444455" }) -- 在某些主题中，VisualMode 用于显示不同的选中模式。
hl(0, "NormalFloat", { bg = "#2c313a" })                              -- 控制浮动窗口中的普通文本（如LSP提示、弹出菜单）

-- Neovim UI 主题高亮
hl(0, "CursorLine", { bg = "#2c313a" })                              -- 当前行高亮（深灰色背景）
hl(0, "CursorColumn", { bg = "#2c313a" })                            -- 当前列高亮（深灰色背景）
hl(0, "ColorColumn", { bg = "#3e4452" })                             -- 超出文本宽度列（深灰色背景）屏幕对齐线样式 需要设置  set colorcolumn=35
hl(0, "LineNr", { fg = "#5c6370" })                                  -- 行号（灰色）
hl(0, "CursorLineNr", { fg = "#e5c07b", bold = true })               -- 当前行号（黄色，加粗）
hl(0, "VertSplit", { fg = "#3e4452" })                               -- 分割线（深灰色）
hl(0, "StatusLine", { fg = "#abb2bf", bg = "#3e4452", bold = true }) -- 状态栏（灰色前景，深灰背景）
hl(0, "StatusLineNC", { fg = "#5c6370", bg = "#2c313a" })            -- 非活动窗口状态栏（暗灰色）
hl(0, "WinBar", { fg = "#abb2bf", bg = "#3e4452", bold = true })     -- 顶部窗口栏（灰色前景，深灰背景） nvim
hl(0, "WinBarNC", { fg = "#5c6370", bg = "#2c313a" })                -- 非活动窗口栏（暗灰色） nvim
hl(0, "TabLine", { fg = "#abb2bf", bg = "#222222" })                 -- 非选中标签行（灰色前景，黑色背景）
hl(0, "TabLineSel", { fg = "#61afef", bg = "#3e4452", bold = true }) -- 选中的标签（蓝色前景，深灰背景）
hl(0, "TabLineFill", { fg = "#5c6370", bg = "#282c34" })             -- 填充标签行.  标签栏填充区域（暗灰色）
hl(0, "Pmenu", { fg = "#abb2bf", bg = "#3e4452" })                   -- 弹出菜单（灰色前景，深灰背景）
hl(0, "PmenuSel", { fg = "#ffffff", bg = "#61afef" })                -- 选中的弹出菜单项（白色前景，蓝色背景）
hl(0, "PmenuSbar", { bg = "#3e4452" })                               -- 弹出菜单滚动条（深灰色）
hl(0, "PmenuThumb", { bg = "#5c6370" })                              -- 滚动条滑块（暗灰色）
hl(0, "PmenuKind", { fg = "#d19a66" })                               -- 菜单项种类标识	LSP 补全中的类/方法/函数等类型标识
hl(0, "PmenuExtra", { fg = "#98c379" })                              -- 弹出菜单额外信息, 补全项的额外说明
hl(0, "PmenuExtraSel", { fg = "#98c379" })                           -- 选中项的额外信息	当前选中项的说明
hl(0, "Search", { fg = "#282c34", bg = "#e5c07b", bold = true })     -- 搜索匹配结果（黄色背景）
hl(0, "IncSearch", { fg = "#282c34", bg = "#d19a66", bold = true })  -- 增量搜索（橙色背景）
hl(0, "CurSearch", { fg = "#282c34", bg = "#c678dd", bold = true })  -- 当前搜索匹配项（紫色背景）
hl(0, "Substitute", { fg = "#282c34", bg = "#d19a66", bold = true }) -- 替换高亮（橙色背景）
hl(0, "Visual", { bg = "#3e4452" })                                  -- 选中区域（深灰色背景）
hl(0, "VisualNOS", { bg = "#2c313a" })                               -- 非活动选择区域（深色背景）
hl(0, "MatchParen", { fg = "#56b6c2", bold = true })                 -- 匹配括号（蓝绿色，加粗）

-- 语法高亮
hl(0, "Comment", { fg = "#5c6370", italic = true }) -- 注释（灰色，斜体）
hl(0, "Todo", { fg = "#5c6370", italic = true })    -- 待办（TODO/FIXME 注释）
hl(0, "Constant", { fg = "#d19a66" })               -- 常量（橙色）
hl(0, "String", { fg = "#98c379" })                 -- 字符串（绿色）
hl(0, "Character", { fg = "#98c379" })              -- 字符常量（绿色）
hl(0, "Number", { fg = "#d19a66" })                 -- 数字常量（橙色）
hl(0, "Boolean", { fg = "#56b6c2" })                -- 布尔值（蓝绿色）
hl(0, "Float", { fg = "#d19a66" })                  -- 浮点数（橙色）
hl(0, "Identifier", { fg = "#e06c75", bold = true }) -- 变量名（红色，加粗）
hl(0, "Function", { fg = "#61afef", bold = true })   -- 函数名（蓝色，加粗）
hl(0, "Statement", { fg = "#c678dd", bold = true })   -- 关键字（紫色，加粗）
hl(0, "Conditional", { fg = "#c678dd", bold = true }) -- 条件语句（紫色，加粗）
hl(0, "Repeat", { fg = "#c678dd", bold = true })      -- 循环语句（紫色，加粗）
hl(0, "Label", { fg = "#61afef" })                    -- 标签（蓝色）
hl(0, "Operator", { fg = "#56b6c2" })                 -- 运算符（蓝绿色）
hl(0, "Keyword", { fg = "#c678dd", bold = true })     -- 关键词（紫色，加粗）
hl(0, "Exception", { fg = "#e06c75", bold = true })   -- 异常（红色，加粗）
hl(0, "Underlined", { fg = "#61afef", underline = true }) -- 下划线文本（蓝色，下划线）
hl(0, "Ignore", { fg = "#282c34" })                       -- 忽略的文本（背景色）
hl(0, "Error", { fg = "#e06c75", bg = "#be5046" })        -- 错误（红色背景）

-- 新增高亮
hl(0, "Conceal", { fg = "#6a737d" })                                 -- 隐藏文本（灰色）, 如 Markdown 标记. 要设置 conceallevel
hl(0, "Cursor", { fg = "#ffffff", bg = cls.blue })                   -- 光标（白色前景，橙色背景）
hl(0, "CursorIM", { fg = "#ffffff", bg = "#61afef" })                -- IME模式下的光标（白色前景，蓝色背景）
hl(0, "Directory", { fg = "#61afef" })                               -- 目录名（蓝色）
hl(0, "DiffAdd", { fg = "#98c379", bg = "#2c313a" })                 -- Diff模式：添加的行（绿色背景）
hl(0, "DiffChange", { fg = "#d19a66", bg = "#2c313a" })              -- Diff模式：修改的行（橙色背景）
hl(0, "DiffDelete", { fg = "#e06c75", bg = "#2c313a" })              -- Diff模式：删除的行（红色背景）
hl(0, "DiffText", { fg = "#c678dd", bg = "#2c313a" })                -- Diff模式：修改的文本（紫色背景）
hl(0, "EndOfBuffer", { fg = "#5c6370" })                             -- 缓冲区的结尾（灰色）
hl(0, "Terminal", { bg = "#222222" })                                -- 终端窗口背景（与 Normal 统一）
hl(0, "TermCursor", { fg = "#ffffff", bg = "#56b6c2" })              -- 终端光标（白色前景，蓝绿色背景）
hl(0, "TermCursorNC", { fg = "#ffffff", bg = "#3e4452" })            -- 非聚焦终端光标（白色前景，深灰色背景）
hl(0, "WinSeparator", { fg = "#3e4452" })                            -- 窗口分隔符（深灰色）
hl(0, "Folded", { fg = "#5c6370", bg = "#282c34" })                  -- 折叠区域（灰色，暗背景）
hl(0, "FoldColumn", { fg = "#5c6370", bg = "#282c34" })              -- 折叠列（灰色，暗背景）
-- highlight(0, "FoldedIcon", { fg = "#e5c07b" })                           -- 折叠符号本身（黄，控制+/-图标颜色）
hl(0, "SignColumn", { fg = "#5c6370", bg = "#282c34" })              -- 标记列（灰色，暗背景）
hl(0, "LineNrAbove", { fg = "#5c6370" })                             -- 行号上方（灰色）
hl(0, "LineNrBelow", { fg = "#5c6370" })                             -- 行号下方（灰色）
hl(0, "QuickFixLine", { fg = "#ffffff", bg = "#d19a66" })            -- 快捷修复行（白色前景，橙色背景）
hl(0, "SpecialKey", { fg = "#5c6370" })                              -- 特殊字符,特殊键（如空格、制表符）的显示。（灰色）
hl(0, "SpellBad", { fg = "#e06c75", underline = true })              -- 拼写错误（红色，下划线）
hl(0, "SpellCap", { fg = "#e5c07b", underline = true })              -- 拼写首字母大写（黄色，下划线）
hl(0, "SpellLocal", { fg = "#61afef", underline = true })            -- 拼写地方性, 拼写地方性错误的高亮。（蓝色，下划线）
hl(0, "SpellRare", { fg = "#98c379", underline = true })             -- 拼写稀有词汇（绿色，下划线）
hl(0, "Title", { fg = "#e5c07b", bold = true })                      -- 标题（黄色，加粗）
hl(0, "Whitespace", { fg = "#5c6370" })                              -- 空白字符（灰色）
hl(0, "WildMenu", { fg = "#282c34", bg = "#61afef" })                -- 命令行补全菜单的高亮。（蓝色背景）

-- LSP 诊断提示 nvim
hl(0, "DiagnosticError", { fg = diagnostic.error })                     -- 错误红色
hl(0, "DiagnosticWarn", { fg = diagnostic.warning })                    -- 警告黄色
hl(0, "DiagnosticInfo", { fg = diagnostic.info })                       -- 信息蓝色
hl(0, "DiagnosticHint", { fg = diagnostic.success })                    -- 提示青色
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#e06c75" }) -- 波浪下划线错误
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#e5c07b" })  -- 波浪下划线警告
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#e5c07b" })  -- 波浪下划线信息
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#e5c07b" })  -- 波浪下划线提示

-- LSP 相关 nvim
hl(0, "LspReferenceText", { undercurl = true, sp = "#e06c75" }) -- 参考文本
hl(0, "LspReferenceRead", { undercurl = true, sp = "#e06c75" }) -- 读取参考
hl(0, "LspReferenceWrite", { undercurl = true, sp = "#e06c75" }) -- 写入参考
hl(0, "LspInlayHint", { undercurl = true, sp = "#e06c75" }) -- 内联提示，在代码中直接显示类型信息、参数名称等额外信息
hl(0, "LspCodeLens", { undercurl = true, sp = "#e06c75" }) -- 代码镜头
hl(0, "LspCodeLensSeparator", { undercurl = true, sp = "#e06c75" }) -- 分隔 CodeLens 中的不同部分，CodeLens 是显示在代码上方的元信息（如引用次数、测试状态等）
hl(0, "LspSignatureActiveParameter", { undercurl = true, sp = "#e06c75" }) -- 活动参数


-- 语法增强 (补充)
hl(0, "PreProc", { fg = "#c678dd", italic = true }) -- 紫色斜体 -- 预处理指令（如 #include）
hl(0, "Type", { fg = "#56b6c2", bold = true })      -- 青色加粗 -- 类型定义（如 int, string）
hl(0, "StorageClass", { fg = "#56b6c2", bold = true })      -- 青色加粗 -- 存储类（如 int, string）
hl(0, "Structure", { fg = "#56b6c2", bold = true })      -- 青色加粗 -- 结构体
hl(0, "Typedef", { fg = "#56b6c2", bold = true })      -- 青色加粗 -- 类型定义

hl(0, "Include", { fg = "#c678dd", bold = true })   -- 紫色加粗 -- 包含语句（如 #include, import）
hl(0, "Define", { fg = "#c678dd", bold = true })   -- 紫色加粗 -- 宏定义
hl(0, "Macro", { fg = "#c678dd", bold = true })   -- 紫色加粗 -- 宏
hl(0, "PreCondit", { fg = "#c678dd", bold = true })   -- 紫色加粗 -- 预处理条件
hl(0, "Special", { fg = "#d19a66" })            -- 橙色 -- 特殊符号
hl(0, "SpecialChar", { fg = "#d19a66" })            -- 橙色 -- 特殊字符（如 \n, \t）
hl(0, "Tag", { fg = "#d19a66" })            -- 橙色 -- 标签（HTML/xml）
hl(0, "Delimiter", { fg = "#d19a66" })            -- 橙色 -- 分隔符
hl(0, "SpecialComment", { fg = "#d19a66" })            -- 橙色 -- 特殊注释
hl(0, "Debug", { fg = "#d19a66" })            -- 橙色 -- 调试信息
hl(0, "Underlined", { fg = "#d19a66" })            -- 橙色 -- 带下划线文本

-- 消息提示 (补充)
hl(0, "ModeMsg", { fg = "#ffffff", bg = "#be5046" })                -- 模式消息 (如 -- INSERT --)
hl(0, "ErrorMsg", { fg = "#ffffff", bg = "#be5046" })                -- 错误信息（白色前景，红色背景）
hl(0, "WarningMsg", { fg = "#e5c07b", bold = true }) -- 黄色加粗 -- 警告消息
hl(0, "MoreMsg", { fg = "#98c379", bold = true })    -- 绿色加粗 -- 更多消息提示（如 -- More --）
hl(0, "Question", { fg = "#61afef", bold = true })   -- 蓝色加粗 -- 对话框问题（如确认操作）

-- 浮动窗口 (新增) nvim
hl(0, "FloatBorder", { fg = "#5c6370", bg = cls.black })             -- 浮动窗口边框
hl(0, "FloatTitle", { fg = "#e5c07b", bg = "#3e4452", bold = true }) -- 浮动窗口标题
hl(0, "FloatFooter", { fg = "#e5c07b", bg = "#3e4452", bold = true }) -- 浮动窗口底部
