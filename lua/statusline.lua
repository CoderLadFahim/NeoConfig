function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

local time = os.date('%A %d %b %Y %I:%M%p')

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
    local current_branch = vim.b.gitsigns_head
    vim.opt.statusline = string.format("[%s] (%s) <%s> - %s", modes[vim_mode], current_dir, current_branch, time) 
end

local mode_change_autocmd = 'autocmd ModeChanged * call v:lua.update_status_line()'; 
vim.cmd(mode_change_autocmd)
