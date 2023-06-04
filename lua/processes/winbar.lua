function SET_WINBAR()
    local vim_mode = tostring(vim.api.nvim_get_mode().mode) 
    if (vim_mode ~= 't') then
        vim.opt.winbar= "   %f %y %m %= %p%% (%L lines)" -- globalstatus
    else 
        vim.opt.winbar=" " -- globalstatus
    end
end

vim.api.nvim_create_autocmd('ModeChanged', {
    pattern = '*',
    callback = function()
        SET_WINBAR()
    end
})
