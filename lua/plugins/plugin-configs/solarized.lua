local solarized_status_ok, solarized = pcall(require, 'solarized')
if not solarized_status_ok then
	return
end

solarized.setup({
    transparent = {
        enabled = false,
        pmenu = true,
        normal = true,
        normalfloat = true,
        neotree = true,
        nvimtree = true,
        whichkey = true,
        telescope = true,
        lazy = true,
    },
    on_highlights = function (colors, color)
        local darken = color.darken
        local lighten = color.lighten
        local blend = color.blend
        local shade = color.shade
        local tint = color.tint

        local groups = {
            CursorLineNr = { fg = colors.green, bg = colors.base02 },
            CursorLineNr = { fg = colors.green, bg = colors.base02 },

            ["HarpoonActive"] = { bg = '#268bd2', fg = '#fdf6e3' },
            ["HarpoonNumberActive"] = { bg = '#268bd2', fg = '#fdf6e3' },
        }

        return groups
    end,
    on_colors = nil,
    palette = 'solarized', -- solarized (default) | selenized
    variant = 'spring', -- "spring" | "summer" | "autumn" | "winter" (default)
    error_lens = {
        text = false,
        symbol = false,
    },
    styles = {
        enabled = true,
        types = {},
        functions = {},
        parameters = {},
        comments = {},
        strings = {},
        keywords = {},
        variables = {},
        constants = {},
    },
    plugins = {
        treesitter = true,
        lspconfig = true,
        navic = true,
        cmp = true,
        indentblankline = true,
        indentmini = true,
        neotree = true,
        nvimtree = true,
        whichkey = true,
        dashboard = true,
        gitsigns = true,
        telescope = true,
        noice = true,
        hop = true,
        ministatusline = true,
        minitabline = true,
        ministarter = true,
        minicursorword = true,
        notify = true,
        rainbowdelimiters = true,
        bufferline = true,
        lazy = true,
        rendermarkdown = true,
        ale = true,
        coc = true,
        leap = true,
        alpha = true,
        yanky = true,
        gitgutter = true,
        mason = true,
        flash = true,
    },
})

vim.cmd('colo solarized')

