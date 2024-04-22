local monokai_status_ok, monokai = pcall(require, 'monokai-pro')
if not monokai_status_ok then
	return
end

monokai.setup({
    transparent_background = false,
    terminal_colors = true,
    devicons = true, -- highlight the icons of `nvim-web-devicons`
    styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- any other keyword
        type = { italic = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
    },
    filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    -- Enable this will disable filter option
    day_night = {
        enable = false, -- turn off by default
        day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    },
    inc_search = "background", -- underline | background
    background_clear = {
        -- "float_win",
        "toggleterm",
        "telescope",
        -- "which-key",
        "renamer",
        "notify",
        -- "nvim-tree",
        -- "neo-tree",
        -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
    },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
    plugins = {
        bufferline = {
            underline_selected = false,
            underline_visible = false,
        },
        indent_blankline = {
            context_highlight = "default", -- default | pro
            context_start_underline = false,
        },
    },
    override = function(c)
        return {
            ["LineNr"] = { fg = '#7f8c8d' },
            ["IndentBlanklineChar"] = { fg = c.base.dimmed4 },
            ["IndentBlanklineContextChar"] = { fg = c.base.accent5 },

            ["Winbar"] = { fg =  c.base.dimmed1 },
            ["WinbarNC"] = { fg =  c.base.dimmed4 },
            ["CursorLineNr"] = { fg =  c.base.purple },
        }
    end
})
