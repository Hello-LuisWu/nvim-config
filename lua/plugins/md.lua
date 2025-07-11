return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            -- Whether markdown should be rendered by default.
            enabled = true,
            -- Vim modes that will show a rendered view of the markdown file, :h mode(), for all enabled
            -- components. Individual components can be enabled for other modes. Remaining modes will be
            -- unaffected by this plugin.
            render_modes = { 'n', 'c', 't' },
            -- Maximum file size (in MB) that this plugin will attempt to render.
            -- Any file larger than this will effectively be ignored.
            max_file_size = 10.0,
            -- Milliseconds that must pass before updating marks, updates occur.
            -- within the context of the visible window, not the entire buffer.
            debounce = 100,
            -- Pre configured settings that will attempt to mimic various target user experiences.
            -- Any user provided settings will take precedence.
            -- | obsidian | mimic Obsidian UI                                          |
            -- | lazy     | will attempt to stay up to date with LazyVim configuration |
            -- | none     | does nothing                                               |
            preset = 'lazy',
            -- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'.
            -- Only intended to be used for plugin development / debugging.
            log_level = 'error',
            -- Print runtime of main update method.
            -- Only intended to be used for plugin development / debugging.
            log_runtime = false,
            -- Filetypes this plugin will run on.
            file_types = { 'markdown' },
            -- Takes buffer as input, if it returns true this plugin will not attach to the buffer
            ignore = function()
                return false
            end,
            -- Additional events that will trigger this plugin's render loop.
            change_events = {},
            injections = {
                -- Out of the box language injections for known filetypes that allow markdown to be interpreted
                -- in specified locations, see :h treesitter-language-injections.
                -- Set enabled to false in order to disable.

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
            patterns = {
                -- Highlight patterns to disable for filetypes, i.e. lines concealed around code blocks

                markdown = {
                    disable = true,
                    directives = {
                        { id = 17, name = 'conceal_lines' },
                        { id = 18, name = 'conceal_lines' },
                    },
                },
            },
            anti_conceal = {
                -- This enables hiding any added text on the line the cursor is on.
                enabled = true,
                -- Modes to disable anti conceal feature.
                disabled_modes = false,
                -- Number of lines above cursor to show.
                above = 0,
                -- Number of lines below cursor to show.
                below = 0,
                -- Which elements to always show, ignoring anti conceal behavior. Values can either be
                -- booleans to fix the behavior or string lists representing modes where anti conceal
                -- behavior will be ignored. Valid values are:
                --   head_icon, head_background, head_border, code_language, code_background, code_border,
                --   dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
                ignore = {
                    code_background = true,
                    sign = true,
                },
            },
            padding = {
                -- Highlight to use when adding whitespace, should match background.
                highlight = 'Normal',
            },
            latex = {
                -- Turn on / off latex rendering.
                enabled = true,
                -- Additional modes to render latex.
                render_modes = false,
                -- Executable used to convert latex formula to rendered unicode.
                converter = 'latex2text',
                -- Highlight for latex blocks.
                highlight = 'RenderMarkdownMath',
                -- Determines where latex formula is rendered relative to block.
                -- | above | above latex block |
                -- | below | below latex block |
                position = 'above',
                -- Number of empty lines above latex blocks.
                top_pad = 0,
                -- Number of empty lines below latex blocks.
                bottom_pad = 0,
            },
            on = {
                -- Called when plugin initially attaches to a buffer.
                attach = function() end,
                -- Called before adding marks to the buffer for the first time.
                initial = function() end,
                -- Called after plugin renders a buffer.
                render = function() end,
                -- Called after plugin clears a buffer.
                clear = function() end,
            },
            completions = {
                -- Settings for blink.cmp completions source
                blink = { enabled = false },
                -- Settings for coq_nvim completions source
                coq = { enabled = false },
                -- Settings for in-process language server completions
                lsp = { enabled = false },
                filter = {
                    callout = function()
                        -- example to exclude obsidian callouts
                        -- return value.category ~= 'obsidian'
                        return true
                    end,
                    checkbox = function()
                        return true
                    end,
                },
            },
            heading = {
                -- Useful context to have when evaluating values.
                -- | level    | the number of '#' in the heading marker         |
                -- | sections | for each level how deeply nested the heading is |

                -- Turn on / off heading icon & background rendering.
                enabled = true,
                -- Additional modes to render headings.
                render_modes = false,
                -- Turn on / off atx heading rendering.
                atx = true,
                -- Turn on / off setext heading rendering.
                setext = true,
                -- Turn on / off any sign column related rendering.
                sign = true,
                -- Replaces '#+' of 'atx_h._marker'.
                -- Output is evaluated depending on the type.
                -- | function | `value(context)`              |
                -- | string[] | `cycle(value, context.level)` |
                icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
                -- Determines how icons fill the available space.
                -- | right   | '#'s are concealed and icon is appended to right side                          |
                -- | inline  | '#'s are concealed and icon is inlined on left side                            |
                -- | overlay | icon is left padded with spaces and inserted on left hiding any additional '#' |
                position = 'overlay',
                -- Added to the sign column if enabled.
                -- Output is evaluated by `cycle(value, context.level)`.
                signs = { '󰫎 ' },
                -- Width of the heading background.
                -- | block | width of the heading text |
                -- | full  | full width of the window  |
                -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
                width = 'full',
                -- Amount of margin to add to the left of headings.
                -- Margin available space is computed after accounting for padding.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                -- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
                left_margin = 0,
                -- Amount of padding to add to the left of headings.
                -- Output is evaluated using the same logic as 'left_margin'.
                left_pad = 0,
                -- Amount of padding to add to the right of headings when width is 'block'.
                -- Output is evaluated using the same logic as 'left_margin'.
                right_pad = 0,
                -- Minimum width to use for headings when width is 'block'.
                -- Can also be a list of integers evaluated by `clamp(value, context.level)`.
                min_width = 0,
                -- Determines if a border is added above and below headings.
                -- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
                border = false,
                -- Always use virtual lines for heading borders instead of attempting to use empty lines.
                border_virtual = false,
                -- Highlight the start of the border using the foreground highlight.
                border_prefix = false,
                -- Used above heading for border.
                above = '▄',
                -- Used below heading for border.
                below = '▀',
                -- Highlight for the heading icon and extends through the entire line.
                -- Output is evaluated by `clamp(value, context.level)`.
                backgrounds = {
                    'RenderMarkdownH1Bg',
                    'RenderMarkdownH2Bg',
                    'RenderMarkdownH3Bg',
                    'RenderMarkdownH4Bg',
                    'RenderMarkdownH5Bg',
                    'RenderMarkdownH6Bg',
                },
                -- Highlight for the heading and sign icons.
                -- Output is evaluated using the same logic as 'backgrounds'.
                foregrounds = {
                    'RenderMarkdownH1',
                    'RenderMarkdownH2',
                    'RenderMarkdownH3',
                    'RenderMarkdownH4',
                    'RenderMarkdownH5',
                    'RenderMarkdownH6',
                },
                -- Define custom heading patterns which allow you to override various properties based on
                -- the contents of a heading.
                -- The key is for healthcheck and to allow users to change its values, value type below.
                -- | pattern    | matched against the heading text @see :h lua-patterns |
                -- | icon       | optional override for the icon                        |
                -- | background | optional override for the background                  |
                -- | foreground | optional override for the foreground                  |
                custom = {},
            },
            paragraph = {
                -- Useful context to have when evaluating values.
                -- | text | text value of the node |

                -- Turn on / off paragraph rendering.
                enabled = true,
                -- Additional modes to render paragraphs.
                render_modes = false,
                -- Amount of margin to add to the left of paragraphs.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                -- Output is evaluated depending on the type.
                -- | function | `value(context)` |
                -- | number   | `value`          |
                left_margin = 0,
                -- Amount of padding to add to the first line of each paragraph.
                -- Output is evaluated using the same logic as 'left_margin'.
                indent = 0,
                -- Minimum width to use for paragraphs.
                min_width = 0,
            },
            code = {
                -- Turn on / off code block & inline code rendering.
                enabled = true,
                -- Additional modes to render code blocks.
                render_modes = false,
                -- Turn on / off any sign column related rendering.
                sign = true,
                -- Determines how code blocks & inline code are rendered.
                -- | none     | disables all rendering                                                    |
                -- | normal   | highlight group to code blocks & inline code, adds padding to code blocks |
                -- | language | language icon to sign column if enabled and icon + name above code blocks |
                -- | full     | normal + language                                                         |
                style = 'full',
                -- Determines where language icon is rendered.
                -- | right | right side of code block |
                -- | left  | left side of code block  |
                position = 'left',
                -- Amount of padding to add around the language.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                language_pad = 0,
                -- Whether to include the language icon above code blocks.
                language_icon = true,
                -- Whether to include the language name above code blocks.
                language_name = true,
                -- Whether to include the language info above code blocks.
                language_info = true,
                -- A list of language names for which background highlighting will be disabled.
                -- Likely because that language has background highlights itself.
                -- Use a boolean to make behavior apply to all languages.
                -- Borders above & below blocks will continue to be rendered.
                disable_background = { 'diff' },
                -- Width of the code block background.
                -- | block | width of the code block  |
                -- | full  | full width of the window |
                width = 'full',
                -- Amount of margin to add to the left of code blocks.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                -- Margin available space is computed after accounting for padding.
                left_margin = 0,
                -- Amount of padding to add to the left of code blocks.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                left_pad = 0,
                -- Amount of padding to add to the right of code blocks when width is 'block'.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                right_pad = 0,
                -- Minimum width to use for code blocks when width is 'block'.
                min_width = 0,
                -- Determines how the top / bottom of code block are rendered.
                -- | none  | do not render a border                               |
                -- | thick | use the same highlight as the code body              |
                -- | thin  | when lines are empty overlay the above & below icons |
                -- | hide  | conceal lines unless language name or icon is added  |
                border = 'hide',
                -- Used above code blocks to fill remaining space around language.
                language_border = '█',
                -- Added to the left of language.
                language_left = '',
                -- Added to the right of language.
                language_right = '',
                -- Used above code blocks for thin border.
                above = '▄',
                -- Used below code blocks for thin border.
                below = '▀',
                -- Icon to add to the left of inline code.
                inline_left = '',
                -- Icon to add to the right of inline code.
                inline_right = '',
                -- Padding to add to the left & right of inline code.
                inline_pad = 0,
                -- Highlight for code blocks.
                highlight = 'RenderMarkdownCode',
                -- Highlight for code info section, after the language.
                highlight_info = 'RenderMarkdownCodeInfo',
                -- Highlight for language, overrides icon provider value.
                highlight_language = nil,
                -- Highlight for border, use false to add no highlight.
                highlight_border = 'RenderMarkdownCodeBorder',
                -- Highlight for language, used if icon provider does not have a value.
                highlight_fallback = 'RenderMarkdownCodeFallback',
                -- Highlight for inline code.
                highlight_inline = 'RenderMarkdownCodeInline',
            },
            dash = {
                -- Turn on / off thematic break rendering.
                enabled = true,
                -- Additional modes to render dash.
                render_modes = false,
                -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'.
                -- The icon gets repeated across the window's width.
                icon = '─',
                -- Width of the generated line.
                -- | <number> | a hard coded width value |
                -- | full     | full width of the window |
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                width = 'full',
                -- Amount of margin to add to the left of dash.
                -- If a float < 1 is provided it is treated as a percentage of available window space.
                left_margin = 0,
                -- Highlight for the whole line generated from the icon.
                highlight = 'RenderMarkdownDash',
            },
            document = {
                -- Turn on / off document rendering.
                enabled = true,
                -- Additional modes to render document.
                render_modes = false,
                -- Ability to conceal arbitrary ranges of text based on lua patterns, @see :h lua-patterns.
                -- Relies entirely on user to set patterns that handle their edge cases.
                conceal = {
                    -- Matched ranges will be concealed using character level conceal.
                    char_patterns = {},
                    -- Matched ranges will be concealed using line level conceal.
                    line_patterns = {},
                },
            },
            bullet = {
                -- Useful context to have when evaluating values.
                -- | level | how deeply nested the list is, 1-indexed          |
                -- | index | how far down the item is at that level, 1-indexed |
                -- | value | text value of the marker node                     |

                -- Turn on / off list bullet rendering
                enabled = true,
                -- Additional modes to render list bullets
                render_modes = false,
                -- Replaces '-'|'+'|'*' of 'list_item'.
                -- If the item is a 'checkbox' a conceal is used to hide the bullet instead.
                -- Output is evaluated depending on the type.
                -- | function   | `value(context)`                                    |
                -- | string     | `value`                                             |
                -- | string[]   | `cycle(value, context.level)`                       |
                -- | string[][] | `clamp(cycle(value, context.level), context.index)` |
                icons = { '●', '○', '◆', '◇' },
                -- Replaces 'n.'|'n)' of 'list_item'.
                -- Output is evaluated using the same logic as 'icons'.
                ordered_icons = function(ctx)
                    local value = vim.trim(ctx.value)
                    local index = tonumber(value:sub(1, #value - 1))
                    return ('%d.'):format(index > 1 and index or ctx.index)
                end,
                -- Padding to add to the left of bullet point.
                -- Output is evaluated depending on the type.
                -- | function | `value(context)` |
                -- | integer  | `value`          |
                left_pad = 0,
                -- Padding to add to the right of bullet point.
                -- Output is evaluated using the same logic as 'left_pad'.
                right_pad = 0,
                -- Highlight for the bullet icon.
                -- Output is evaluated using the same logic as 'icons'.
                highlight = 'RenderMarkdownBullet',
                -- Highlight for item associated with the bullet point.
                -- Output is evaluated using the same logic as 'icons'.
                scope_highlight = {},
            },
            checkbox = {
                -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'.
                -- There are two special states for unchecked & checked defined in the markdown grammar.

                -- Turn on / off checkbox state rendering.
                enabled = true,
                -- Additional modes to render checkboxes.
                render_modes = false,
                -- Render the bullet point before the checkbox.
                bullet = false,
                -- Padding to add to the right of checkboxes.
                right_pad = 1,
                unchecked = {
                    -- Replaces '[ ]' of 'task_list_marker_unchecked'.
                    icon = '󰄱 ',
                    -- Highlight for the unchecked icon.
                    highlight = 'RenderMarkdownUnchecked',
                    -- Highlight for item associated with unchecked checkbox.
                    scope_highlight = nil,
                },
                checked = {
                    -- Replaces '[x]' of 'task_list_marker_checked'.
                    icon = '󰱒 ',
                    -- Highlight for the checked icon.
                    highlight = 'RenderMarkdownChecked',
                    -- Highlight for item associated with checked checkbox.
                    scope_highlight = nil,
                },
                -- Define custom checkbox states, more involved, not part of the markdown grammar.
                -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks.
                -- The key is for healthcheck and to allow users to change its values, value type below.
                -- | raw             | matched against the raw text of a 'shortcut_link'           |
                -- | rendered        | replaces the 'raw' value when rendering                     |
                -- | highlight       | highlight for the 'rendered' icon                           |
                -- | scope_highlight | optional highlight for item associated with custom checkbox |
                -- stylua: ignore
                custom = {
                    todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                },
            },
            quote = {
                -- Turn on / off block quote & callout rendering.
                enabled = true,
                -- Additional modes to render quotes.
                render_modes = false,
                -- Replaces '>' of 'block_quote'.
                icon = '▋',
                -- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text
                -- if incorrectly configured with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'.
                -- A combination of these that is likely to work follows.
                -- | showbreak      | '  ' (2 spaces)   |
                -- | breakindent    | true              |
                -- | breakindentopt | '' (empty string) |
                -- These are not validated by this plugin. If you want to avoid adding these to your main
                -- configuration then set them in win_options for this plugin.
                repeat_linebreak = false,
                -- Highlight for the quote icon.
                -- If a list is provided output is evaluated by `cycle(value, level)`.
                highlight = {
                    'RenderMarkdownQuote1',
                    'RenderMarkdownQuote2',
                    'RenderMarkdownQuote3',
                    'RenderMarkdownQuote4',
                    'RenderMarkdownQuote5',
                    'RenderMarkdownQuote6',
                },
            },
            pipe_table = {
                -- Turn on / off pipe table rendering.
                enabled = true,
                -- Additional modes to render pipe tables.
                render_modes = false,
                -- Pre configured settings largely for setting table border easier.
                -- | heavy  | use thicker border characters     |
                -- | double | use double line border characters |
                -- | round  | use round border corners          |
                -- | none   | does nothing                      |
                preset = 'none',
                -- Determines how the table as a whole is rendered.
                -- | none   | disables all rendering                                                  |
                -- | normal | applies the 'cell' style rendering to each row of the table             |
                -- | full   | normal + a top & bottom line that fill out the table when lengths match |
                style = 'full',
                -- Determines how individual cells of a table are rendered.
                -- | overlay | writes completely over the table, removing conceal behavior and highlights |
                -- | raw     | replaces only the '|' characters in each row, leaving the cells unmodified |
                -- | padded  | raw + cells are padded to maximum visual width for each column             |
                -- | trimmed | padded except empty space is subtracted from visual width calculation      |
                cell = 'padded',
                -- Amount of space to put between cell contents and border.
                padding = 1,
                -- Minimum column width to use for padded or trimmed cell.
                min_width = 0,
                -- Characters used to replace table border.
                -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal.
                -- stylua: ignore
                border = {
                    '┌', '┬', '┐',
                    '├', '┼', '┤',
                    '└', '┴', '┘',
                    '│', '─',
                },
                -- Always use virtual lines for table borders instead of attempting to use empty lines.
                -- Will be automatically enabled if indentation module is enabled.
                border_virtual = false,
                -- Gets placed in delimiter row for each column, position is based on alignment.
                alignment_indicator = '━',
                -- Highlight for table heading, delimiter, and the line above.
                head = 'RenderMarkdownTableHead',
                -- Highlight for everything else, main table rows and the line below.
                row = 'RenderMarkdownTableRow',
                -- Highlight for inline padding used to add back concealed space.
                filler = 'RenderMarkdownTableFill',
            },
            callout = {
                -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'.
                -- The key is for healthcheck and to allow users to change its values, value type below.
                -- | raw        | matched against the raw text of a 'shortcut_link', case insensitive |
                -- | rendered   | replaces the 'raw' value when rendering                             |
                -- | highlight  | highlight for the 'rendered' text and quote markers                 |
                -- | quote_icon | optional override for quote.icon value for individual callout       |
                -- | category   | optional metadata useful for filtering                              |

                note      = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo', category = 'github' },
                tip       = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess', category = 'github' },
                important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint', category = 'github' },
                warning   = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn', category = 'github' },
                caution   = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError', category = 'github' },
                -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
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
                -- Turn on / off inline link icon rendering.
                enabled = true,
                -- Additional modes to render links.
                render_modes = false,
                -- How to handle footnote links, start with a '^'.
                footnote = {
                    -- Turn on / off footnote rendering.
                    enabled = true,
                    -- Replace value with superscript equivalent.
                    superscript = true,
                    -- Added before link content.
                    prefix = '',
                    -- Added after link content.
                    suffix = '',
                },
                -- Inlined with 'image' elements.
                image = '󰥶 ',
                -- Inlined with 'email_autolink' elements.
                email = '󰀓 ',
                -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
                hyperlink = '󰌹 ',
                -- Applies to the inlined icon as a fallback.
                highlight = 'RenderMarkdownLink',
                -- Applies to WikiLink elements.
                wiki = {
                    icon = '󱗖 ',
                    body = function()
                        return nil
                    end,
                    highlight = 'RenderMarkdownWikiLink',
                },
                -- Define custom destination patterns so icons can quickly inform you of what a link
                -- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
                -- patterns match a link the one with the longer pattern is used.
                -- The key is for healthcheck and to allow users to change its values, value type below.
                -- | pattern   | matched against the destination text                            |
                -- | icon      | gets inlined before the link text                               |
                -- | kind      | optional determines how pattern is checked                      |
                -- |           | pattern | @see :h lua-patterns, is the default if not set       |
                -- |           | suffix  | @see :h vim.endswith()                                |
                -- | priority  | optional used when multiple match, uses pattern length if empty |
                -- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
                custom = {
                    web = { pattern = '^http', icon = '󰖟 ' },
                    discord = { pattern = 'discord%.com', icon = '󰙯 ' },
                    github = { pattern = 'github%.com', icon = '󰊤 ' },
                    gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
                    google = { pattern = 'google%.com', icon = '󰊭 ' },
                    neovim = { pattern = 'neovim%.io', icon = ' ' },
                    reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
                    stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
                    wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
                    youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
                },
            },
            sign = {
                -- Turn on / off sign rendering.
                enabled = true,
                -- Applies to background of sign text.
                highlight = 'RenderMarkdownSign',
            },
            inline_highlight = {
                -- Mimics Obsidian inline highlights when content is surrounded by double equals.
                -- The equals on both ends are concealed and the inner content is highlighted.

                -- Turn on / off inline highlight rendering.
                enabled = true,
                -- Additional modes to render inline highlights.
                render_modes = false,
                -- Applies to background of surrounded text.
                highlight = 'RenderMarkdownInlineHighlight',
            },
            indent = {
                -- Mimic org-indent-mode behavior by indenting everything under a heading based on the
                -- level of the heading. Indenting starts from level 2 headings onward by default.

                -- Turn on / off org-indent-mode.
                enabled = false,
                -- Additional modes to render indents.
                render_modes = false,
                -- Amount of additional padding added for each heading level.
                per_level = 2,
                -- Heading levels <= this value will not be indented.
                -- Use 0 to begin indenting from the very first level.
                skip_level = 1,
                -- Do not indent heading titles, only the body.
                skip_heading = false,
                -- Prefix added when indenting, one per level.
                icon = '▎',
                -- Applied to icon.
                highlight = 'RenderMarkdownIndent',
            },
            html = {
                -- Turn on / off all HTML rendering.
                enabled = true,
                -- Additional modes to render HTML.
                render_modes = false,
                comment = {
                    -- Turn on / off HTML comment concealing.
                    conceal = true,
                    -- Optional text to inline before the concealed comment.
                    text = nil,
                    -- Highlight for the inlined text.
                    highlight = 'RenderMarkdownHtmlComment',
                },
                -- HTML tags whose start and end will be hidden and icon shown.
                -- The key is matched against the tag name, value type below.
                -- | icon      | gets inlined at the start |
                -- | highlight | highlight for the icon    |
                tag = {},
            },
            win_options = {
                -- Window options to use that change between rendered and raw view.

                -- @see :h 'conceallevel'
                conceallevel = {
                    -- Used when not being rendered, get user setting.
                    default = vim.o.conceallevel,
                    -- Used when being rendered, concealed text is completely hidden.
                    rendered = 3,
                },
                -- @see :h 'concealcursor'
                concealcursor = {
                    -- Used when not being rendered, get user setting.
                    default = vim.o.concealcursor,
                    -- Used when being rendered, show concealed text in all modes.
                    rendered = '',
                },
            },
            overrides = {
                -- More granular configuration mechanism, allows different aspects of buffers to have their own
                -- behavior. Values default to the top level configuration if no override is provided. Supports
                -- the following fields:
                --   enabled, max_file_size, debounce, render_modes, anti_conceal, padding, heading, paragraph,
                --   code, dash, bullet, checkbox, quote, pipe_table, callout, link, sign, indent, latex, html,
                --   win_options

                -- Override for different buflisted values, @see :h 'buflisted'.
                buflisted = {},
                -- Override for different buftype values, @see :h 'buftype'.
                buftype = {
                    nofile = {
                        render_modes = true,
                        padding = { highlight = 'NormalFloat' },
                        sign = { enabled = false },
                    },
                },
                -- Override for different filetype values, @see :h 'filetype'.
                filetype = {},
            },
            custom_handlers = {
                -- Mapping from treesitter language to user defined handlers.
                -- @see [Custom Handlers](doc/custom-handlers.md)
            },
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)

            local hl = vim.api.nvim_set_hl

            -- ✅ render-markdown 图标颜色（较深色调）
            hl(0, "RenderMarkdownH1", { fg = "#ffff55", bold = true })
            hl(0, "RenderMarkdownH2", { fg = "#5c6540", bold = true })
            hl(0, "RenderMarkdownH3", { fg = "#456370", bold = true })
            hl(0, "RenderMarkdownH4", { fg = "#704f74", bold = true })
            hl(0, "RenderMarkdownH5", { fg = "#745255", bold = true })
            hl(0, "RenderMarkdownH6", { fg = "#3e6653", bold = true })

            -- ✅ 图标背景（柔和浅色背景）
            hl(0, "RenderMarkdownH1Bg", { bg = "#dd99ff" })
            hl(0, "RenderMarkdownH2Bg", { bg = "#f3f6f0" })
            hl(0, "RenderMarkdownH3Bg", { bg = "#eef3f6" })
            hl(0, "RenderMarkdownH4Bg", { bg = "#f5f0f7" })
            hl(0, "RenderMarkdownH5Bg", { bg = "#f8f3f3" })
            hl(0, "RenderMarkdownH6Bg", { bg = "#f1f7f4" })

            -- ✅ 标题文字颜色（Neovim 自带高亮组）
            -- hl(0, "markdownH1", { fg = "#222222", bold = true })
            -- hl(0, "markdownH2", { fg = "#3f5134", bold = true })
            -- hl(0, "markdownH3", { fg = "#2d4d5f", bold = true })
            -- hl(0, "markdownH4", { fg = "#503b5d", bold = true })
            -- hl(0, "markdownH5", { fg = "#5e3a42", bold = true })
            -- hl(0, "markdownH6", { fg = "#3c4c42", bold = true })
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
                "<leader>md",
                mode = "n",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
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
    -- {
    --     "img-paste-devs/img-paste.vim",
    --     ft = "markdown",
    --     config = function()
    --         vim.cmd([[
    --     autocmd FileType markdown nmap <buffer><silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>
    --     " there are some defaults for image directory and image name, you can change them
    --     " let g:mdip_imgdir = 'img'
    --     " let g:mdip_imgname = 'image'
    --     function! g:LatexPasteImage(relpath)
    --         execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    --         let ipos = getcurpos()
    --         execute "normal! a" . "mage}"
    --         call setpos('.', ipos)
    --         execute "normal! ve\<C-g>"
    --     endfunction
    --     autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
    --     autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
    --     ]])
    --     end,
    -- },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy", -- 延迟加载
        keys = {
            { "<leader>mp", "<cmd>PasteImage<cr>", desc = "📋 粘贴剪贴板图片" },
        },
        opts = {
            default = {
                -- 📁 文件保存设置
                dir_path = "assets",              -- 图片默认保存目录
                extension = "png",                -- 图片默认扩展名
                file_name = "%Y-%m-%d-%H-%M-%S",  -- 图片命名格式（按时间命名）
                use_absolute_path = false,        -- 是否使用绝对路径插入
                relative_to_current_file = false, -- 是否相对当前文件保存

                -- 📄 插入模板设置
                template = "$FILE_PATH",             -- 默认插入路径模板
                url_encode_path = false,             -- 是否进行 URL 编码
                relative_template_path = true,       -- 插入模板是否使用相对路径
                use_cursor_in_template = true,       -- 是否用光标占位符
                insert_mode_after_paste = true,      -- 粘贴后是否进入插入模式
                insert_template_after_cursor = true, -- 插入模板时是否位于光标后

                -- 🔤 文件名提示设置
                prompt_for_file_name = true,     -- 是否提示输入文件名
                show_dir_path_in_prompt = false, -- 提示时是否显示保存目录

                -- 🔒 base64 设置（不启用）
                max_base64_size = 10,          -- base64 最大大小（MB）
                embed_image_as_base64 = false, -- 是否以 base64 插入

                -- 🛠️ 图片处理命令
                process_cmd = "",       -- 自定义图片处理命令
                copy_images = true,     -- 是否复制图片
                download_images = true, -- 是否自动下载粘贴板图片

                -- 🐭 拖拽支持
                drag_and_drop = {
                    enabled = true,      -- 启用拖拽粘贴图片
                    insert_mode = false, -- 拖拽时是否进入插入模式
                },
            },

            -- 📝 针对特定文件类型的模板
            -- filetypes = {
            --     markdown = {
            --         url_encode_path = true,
            --         template = "![$CURSOR]($FILE_PATH)",
            --         download_images = false,
            --     },
            --     vimwiki = {
            --         url_encode_path = true,
            --         template = "![$CURSOR]($FILE_PATH)",
            --         download_images = false,
            --     },
            --     html = {
            --         template = '<img src="$FILE_PATH" alt="$CURSOR">',
            --     },
            -- },

            -- 📦 高级：自定义文件路径和扩展配置
            -- files = {},
            -- dirs = {},
            -- custom = {},
        },
    },


    {
        'Kicamon/markdown-table-mode.nvim',
        config = function()
            require('markdown-table-mode').setup()
        end
    },

    -- {
    --     "SCJangra/table-nvim",
    --     ft = "markdown",
    --     opts = {
    --         padd_column_separators = true,     -- Insert a space around column separators.
    --         mappings = {                       -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
    --             next = "<TAB>",                -- Go to next cell.
    --             prev = "<S-TAB>",              -- Go to previous cell.
    --             insert_row_up = "<A-k>",       -- Insert a row above the current row.
    --             insert_row_down = "<A-j>",     -- Insert a row below the current row.
    --             move_row_up = "<A-S-k>",       -- Move the current row up.
    --             move_row_down = "<A-S-j>",     -- Move the current row down.
    --             insert_column_left = "<A-h>",  -- Insert a column to the left of current column.
    --             insert_column_right = "<A-l>", -- Insert a column to the right of current column.
    --             move_column_left = "<A-S-h>",  -- Move the current column to the left.
    --             move_column_right = "<A-S-l>", -- Move the current column to the right.
    --             insert_table = "<A-t>",        -- Insert a new table.
    --             insert_table_alt = "<A-S-t>",  -- Insert a new table that is not surrounded by pipes.
    --             delete_column = "<A-d>",       -- Delete the column under cursor.
    --         },
    --     },
    -- },

    {
        "richardbizik/nvim-toc",
        ft = { "markdown" },
        keys = {
            { "<leader>mt", mode = "n", ":TOC<CR>", desc = "add TOC" },
        },
        opts = {
            toc_header = "文档目录",
        },
    },
}
