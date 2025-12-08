local rose_pine_status_ok, rose_pine = pcall(require, 'rose-pine')
if not rose_pine_status_ok then
	return
end

rose_pine.setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        IndentBlanklineContextChar = { fg = 'foam' },
        LineNr = { fg = 'subtle' },
        WinBar = { fg = 'iris', bg='Overlay' },
        GitConflictAncestor = { bg = 'subtle' },
        GitConflictAncestorLabel = { bg = 'subtle' },
        TelescopeMatching = { fg = 'love' },

        ["StatusLineBranch"] = { bg='Overlay', fg='Subtle'},
        ["StatusLineTime"] = { bg='Overlay', fg='Subtle' },

        ["HarpoonActive"] = { bg = 'Pine' },
        ["HarpoonNumberActive"] = { bg = 'Pine' },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

-- | Name           | Hex       | Description                   |
-- | -------------- | --------- | ----------------------------- |
-- | Base           | `#191724` | Background                    |
-- | Surface        | `#1f1d2e` | Panel/background surface      |
-- | Overlay        | `#26233a` | Lighter surface               |
-- | Muted          | `#6e6a86` | Comments, less important text |
-- | Subtle         | `#908caa` | Secondary text                |
-- | Text           | `#e0def4` | Main text                     |
-- | Love           | `#eb6f92` | Red/pink                      |
-- | Gold           | `#f6c177` | Yellow/gold                   |
-- | Rose           | `#ebbcba` | Pink                          |
-- | Pine           | `#31748f` | Teal/blue-green               |
-- | Foam           | `#9ccfd8` | Cyan/light blue               |
-- | Iris           | `#c4a7e7` | Purple                        |
-- | Highlight Low  | `#21202e` | Low emphasis highlight        |
-- | Highlight Med  | `#403d52` | Medium emphasis highlight     |
-- | Highlight High | `#524f67` | High emphasis highlight       |
