function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

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

function update_status_line()
    local vim_mode = vim.api.nvim_get_mode().mode 
    local current_dir =  GET_CURRENT_DIRECTORY()
    local current_branch = tostring(vim.b.gitsigns_head)
    local time = os.date('%A %d %b %Y %I:%M %p')
    vim.opt.statusline = string.format(
        "[%s] (%s) <%s> - %s",
        vim_mode and modes[vim_mode] or 'VISUAL_VERTICAL', 
        current_dir, 
        current_branch, 
        time
    ) 
end

local interval = 1000 * 60 -- Interval in milliseconds (1 minute)
local timer_id

-- Start the timer
timer_id = vim.loop.new_timer()
timer_id:start(interval, interval, vim.schedule_wrap(update_status_line))

vim.api.nvim_create_autocmd('User', {
    pattern = 'GitSignsUpdate',
    callback = update_status_line
})

vim.api.nvim_create_autocmd('ModeChanged', {
    pattern = '*',
    callback = update_status_line
})

