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

local last_known_branch = ''
function UPDATE_STATUS_LINE()
    local vim_mode = vim.api.nvim_get_mode().mode 
    local current_dir =  GET_CURRENT_DIRECTORY()
    local current_branch = vim.b.gitsigns_head
    local time = os.date('%A %d %b %Y %I:%M:%S %p')

    if (current_branch) then last_known_branch = current_branch end

    vim.opt.statusline = string.format(
        "[%s] (%s) <%s> %s %s",
        vim_mode and modes[vim_mode] or '_', 
        current_dir, 
        current_branch and current_branch or last_known_branch,
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

vim.api.nvim_create_autocmd('ModeChanged', {
    pattern = '*',
    callback = function()
        UPDATE_STATUS_LINE()
    end
})

