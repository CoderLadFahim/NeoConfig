local onedark_status_ok, onedark = pcall(require, 'onedark')
if not onedark_status_ok then
	return
end

onedark.setup({
    -- Main options --
    style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
        ["@tag.delimiter"] = { fg = '$blue' },
        ["@tag"] = {fg = '$red'},
        ["Visual"] = { bg = '#f1f1f1' },
        ["LineNr"] = { fg = '#7f8c8d' },
        ["CursorLineNr"] = { fg = '$red', fmt = 'bold' },

        -- 1f2329
        ["TelescopePromptBorder"] = { fg = '$grey' },
        ["TelescopePreviewBorder"] = { fg = '$grey' },
        ["TelescopeResultsBorder"] = { fg = '$grey' },
        ["TelescopeMatching"] = { fg = '$red' },
        -- ["VertSplit"] = { fg = '$cyan' },
        ["WinbarNC"] = { fg = '#a0a8b7', bg = '#1f2329' },
        ["Winbar"] = { bg = '#30363f' },

        ["IndentBlanklineChar"] = { fg = '$grey' },
        ["IndentBlanklineContextChar"] = { fg = '$blue' },
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
})

-- vim.cmd('colo onedark')
