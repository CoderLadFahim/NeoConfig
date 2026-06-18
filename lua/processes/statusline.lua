function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

function GET_FULL_PATH()
    return vim.loop.cwd()
end

vim.api.nvim_set_hl(0, 'StatusLineMode', { bg = '', fg = '' })
vim.api.nvim_set_hl(0, 'StatusLineBranch', { bg = '', fg = '' })
vim.api.nvim_set_hl(0, 'StatusLineTime', { bg = '', fg = '' })

local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "VISUAL",
    c = "COMMAND",
    s = "SELECT",
    R = "REPLACE",
    t = "TERMINAL"
}

local last_known_branch = ''
function UPDATE_STATUS_LINE()
    local vim_mode = vim.api.nvim_get_mode().mode 
    local current_dir =  GET_CURRENT_DIRECTORY()
    local full_path = GET_FULL_PATH()
    local current_branch = vim.b.gitsigns_head
    local time = os.date('%A %d %b %Y %I:%M:%S %p')

    if (current_branch) then last_known_branch = current_branch end

    vim.opt.statusline = string.format(
        "%%#StatusLineMode# %s %%#StatusLineBranch# %s %s",
        vim_mode and modes[vim_mode] or '_', 
        current_branch and 'git:' .. current_branch or last_known_branch,
        '| dir:' .. current_dir .. ' | pwd:' .. full_path
    ) 
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'GitSignsUpdate',
    callback = UPDATE_STATUS_LINE
})

local StatusLineModeCol = {
    n = {
        ['kanagawa'] = { bg = '#2D4F67', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#4fa6ed', fg = '#222222' },
        ['rose-pine'] = { bg = '#31748f', fg = '#e0def4' },
        ['gruvbox'] = { bg = '#458588', fg = '#ebdbb2' },
        ['nightfly'] = { bg = '#82aaff', fg = '#222222' },
        ['solarized'] = { bg = '#268bd2', fg = '#fdf6e3' },
        -- ['vague'] = { bg = '#6e94b2', fg = '#1c1c24' },
        ['vague'] = { bg = '#6e94b2', fg = '#1c1c24' },
    },
    i = {
        ['kanagawa'] = { bg = '#C34043', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#e06c75', fg = '#222222' },
        ['rose-pine'] = { bg = '#eb6f92', fg = '#26233a' },
        ['gruvbox'] = { bg = '#b8bb26', fg = '#282828' },
        ['nightfly'] = { bg = '#c792ea', fg = '#011627' },
        ['solarized'] = { bg = '#2aa198', fg = '#fdf6e3' },
        ['vague'] = { bg = '#e8b589', fg = '#141415' },
    },
    v = {
        ['kanagawa'] = { bg = '#5d57a3', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#e5c07b', fg = '#222222' },
        ['rose-pine'] = { bg = '#ebbcba', fg = '#26233a' },
        ['gruvbox'] = { bg = '#fabd2f', fg = '#282828' },
        ['nightfly'] = { bg = '#7fdbca', fg = '#011627' },
        ['solarized'] = { bg = '#b58900', fg = '#fdf6e3' },
        ['vague'] = { bg = '#7e98e8', fg = '#1c1c24' },
    },
    V = {
        ['kanagawa'] = { bg = '#5d57a3', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#e5c07b', fg = '#222222' },
        ['rose-pine'] = { bg = '#ebbcba', fg = '#26233a' },
        ['gruvbox'] = { bg = '#fabd2f', fg = '#282828' },
        ['nightfly'] = { bg = '#7fdbca', fg = '#011627' },
        ['solarized'] = { bg = '#b58900', fg = '#fdf6e3' },
        ['vague'] = { bg = '#7e98e8', fg = '#1c1c24' },
    },
    c = {
        ['kanagawa'] = { bg = '#43436c', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#98c379', fg = '#222222' },
        ['rose-pine'] = { bg = '#c4a7e7', fg = '#26233a' },
        ['gruvbox'] = { bg = '#fe8019', fg = '#282828' },
        ['nightfly'] = { bg = '#ecc48d', fg = '#011627' },
        ['solarized'] = { bg = '#859900', fg = '#fdf6e3' },
        ['vague'] = { bg = '#90a0b5', fg = '#1c1c24' },
    },
    s = {
        ['kanagawa'] = { bg = '', fg = '' },
        ['onedark'] = { bg = '', fg = '' },
        ['rose-pine'] = { bg = '', fg = '' },
        ['gruvbox'] = { bg = '', fg = '' },
        ['nightfly'] = { bg = '', fg = '' },
        ['solarized'] = { bg = '', fg = '' },
        ['vague'] = { bg = '#405065', fg = '#cdcdcd' },
    },
    R = {
        ['kanagawa'] = { bg = '', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#636d83', fg = '#f1f1f1' },
        ['rose-pine'] = { bg = '#9ccfd8', fg = '#26233a' },
        ['gruvbox'] = { bg = '#d3869b', fg = '#282828' },
        ['nightfly'] = { bg = '#fc514e', fg = '#011627' },
        ['solarized'] = { bg = '#dc322f', fg = '#fdf6e3' },
        ['vague'] = { bg = '#d8647e', fg = '#141415' },
    },
    t = {
        ['kanagawa'] = { bg = '#658594', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#c678dd', fg = '#222222' },
        ['rose-pine'] = { bg = '#f6c177', fg = '#26233a' },
        ['gruvbox'] = { bg = '#8ec07c', fg = '#282828' },
        ['nightfly'] = { bg = '#21c7a8', fg = '#011627' },
        ['solarized'] = { bg = '#6c71c4', fg = '#fdf6e3' },
        ['vague'] = { bg = '#b4d4cf', fg = '#141415' },
    },
}

vim.api.nvim_create_autocmd('ModeChanged', {
    pattern = '*',
    callback = function()
        UPDATE_STATUS_LINE()

        local vim_mode = vim.api.nvim_get_mode().mode 
        local current_theme = vim.g.colors_name
        local mode = StatusLineModeCol[vim_mode] and  StatusLineModeCol[vim_mode] or 'i'
        local selected_colour = mode[current_theme] and mode[current_theme] or '#f1f1f1'

        vim.api.nvim_set_hl(0, "StatusLineMode", {
            bg = selected_colour['bg'] and selected_colour['bg'] or '#f1f1f1',
            fg = selected_colour['fg'] and selected_colour['fg'] or '#222222',
        })
    end
})
