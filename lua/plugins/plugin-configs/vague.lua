local vague_status_ok, vague = pcall(require, 'vague')
if not vague_status_ok then
	return
end

vague.setup({
    transparent = false, -- If true, background is not set
    bold = true, -- Disable bold globally
    italic = false, -- Disable italic globally
    on_highlights = function(hl, colors) 
        -- ["HarpoonActive"] = { bg = 'Pine', fg = "#f1f1f1" },
        -- ["HarpoonNumberActive"] = { bg = 'Pine', fg = "#f1f1f1" },
        hl.HarpoonActive = { bg = colors.search, fg = colors.fg }
        hl.HarpoonNumberActive = { bg = colors.search, fg = colors.fg }
        hl.LeapLabel = { bg = colors.hint, fg = colors.bg }
    end,
    colors = {
        bg = '#141415',
        inactiveBg = '#1c1c24',
        fg = '#cdcdcd',
        floatBorder = '#878787',
        line = '#252530',
        comment = '#606079',
        builtin = '#b4d4cf',
        func = '#c48282',
        string = '#e8b589',
        number = '#e0a363',
        property = '#c3c3d5',
        constant = '#aeaed1',
        parameter = '#bb9dbd',
        visual = '#333738',
        error = '#d8647e',
        warning = '#f3be7c',
        hint = '#7e98e8',
        operator = '#90a0b5',
        keyword = '#6e94b2',
        type = '#9bb4bc',
        search = '#405065',
        plus = '#7fa563',
        delta = '#f3be7c',
    },
})
