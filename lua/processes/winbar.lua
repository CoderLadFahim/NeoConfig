function SET_WINBAR()
    local vim_mode = tostring(vim.api.nvim_get_mode().mode) 
    if (vim_mode ~= 't') then
        -- vim.opt.winbar= "%f %y %m %= %p%% (%L lines)" -- globalstatus
        vim.opt.winbar= string.format(
            "%s %s %s %s %s",
            GET_CURRENT_DIRECTORY() .. ':',
            "%f",
            "%=",
            "%m",
            "%y"
        )
    else 
        vim.opt.winbar=" " -- globalstatus
    end
end

-- vim.api.nvim_create_autocmd('ModeChanged', {
--     pattern = '*',
--     callback = function()
--         SET_WINBAR()
--     end
-- })
--
SET_WINBAR()
