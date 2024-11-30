local catppuccin_status_ok, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_status_ok then
	return
end

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            LineNr = { fg = colors.overlay0 },
            CursorLineNr = { fg = colors.lavendar },
            TelescopePromptBorder = { fg =  colors.surface1 },
            TelescopePreviewBorder = { fg = colors.surface1 },
            TelescopeResultsBorder = { fg = colors.surface1 },
            TelescopeMatching = { fg = colors.green },
            Winbar = { bg = colors.surface1 },
            WinbarNc = { bg = colors.surface1, fg = colors.overlay2 },
            StatusLine = { bg = colors.surface1 },
            -- ColorColumn = { bg = colors.surface1 }
        }
    end,
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd('colo catppuccin')
