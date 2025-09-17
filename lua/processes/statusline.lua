function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
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
    local current_branch = vim.b.gitsigns_head
    local time = os.date('%A %d %b %Y %I:%M:%S %p')

    if (current_branch) then last_known_branch = current_branch end

    vim.opt.statusline = string.format(
        "%%#StatusLineMode# %s %%#StatusLineBranch# %s %s %s",
        vim_mode and modes[vim_mode] or '_', 
        current_branch and 'git:' .. current_branch or last_known_branch,
        '%=',
        time
    ) 
end

-- local interval = 1000 * 60 -- Interval in milliseconds (1 minute)
local interval = 1000
local timer_id

-- Start the timer
timer_id = vim.loop.new_timer()
timer_id:start(interval, interval, vim.schedule_wrap(UPDATE_STATUS_LINE))

vim.api.nvim_create_autocmd('User', {
    pattern = 'GitSignsUpdate',
    callback = UPDATE_STATUS_LINE
})

local StatusLineModeCol = {
    n = {
        ['kanagawa'] = { bg = '#2D4F67', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#4fa6ed', fg = '#222222' },
        ['rose-pine'] = { bg = '#31748f', fg = '#e0def4' },
    },
    i = {
        ['kanagawa'] = { bg = '#C34043', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#e06c75', fg = '#222222' },
        ['rose-pine'] = { bg = '#eb6f92', fg = '#26233a' },
    },
    v = {
        ['kanagawa'] = { bg = '#5d57a3', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#e5c07b', fg = '#222222' },
        ['rose-pine'] = { bg = '#ebbcba', fg = '#26233a' },
    },
    V = {
        ['kanagawa'] = { bg = '#5d57a3', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#e5c07b', fg = '#222222' },
        ['rose-pine'] = { bg = '#ebbcba', fg = '#26233a' },
    },
    c = {
        ['kanagawa'] = { bg = '#43436c', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#98c379', fg = '#222222' },
        ['rose-pine'] = { bg = '#c4a7e7', fg = '#26233a' },
    },
    s = {
        ['kanagawa'] = { bg = '', fg = '' },
        ['onedark'] = { bg = '', fg = '' },
        ['rose-pine'] = { bg = '', fg = '' },
    },
    R = {
        ['kanagawa'] = { bg = '', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#636d83', fg = '#f1f1f1' },
        ['rose-pine'] = { bg = '#9ccfd8', fg = '#26233a' },
    },
    t = {
        ['kanagawa'] = { bg = '#658594', fg = '#c5c9c5' },
        ['onedark'] = { bg = '#c678dd', fg = '#222222' },
        ['rose-pine'] = { bg = '#f6c177', fg = '#26233a' },
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

