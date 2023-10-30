require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        ["@tag.delimiter"] = {fg = '#b8bb26'},
        IndentBlanklineChar = { fg = '#999999' },
        IndentBlanklineContextChar = { fg = '#fe8019' },

        ["TelescopePromptBorder"] =  { fg = '#999999' },
        ["TelescopePreviewBorder"] = { fg = '#999999' },
        ["TelescopeResultsBorder"] = { fg = '#999999' },
        ["TelescopeMatching"] = { fg = '#bada55' },
        ["GitSignsCurrentLineBlame"] = { fg = '#999999' },
    },
    dim_inactive = false,
    transparent_mode = false,
})

