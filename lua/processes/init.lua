function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

local process_modules= {
    'statusline',
    'winbar',
    'non_text_file_previews',
    'hightlight_overrides',
}

for _, value in ipairs(process_modules) do
    local path = 'processes.' .. value;
    require(path);
end
--
-- local frontend = { 'javascript', 'vue', 'vimwiki', 'telescope' }
--
-- local group = vim.api.nvim_create_augroup('CheckFiletypesGroup', { clear = true })
--
-- vim.api.nvim_create_autocmd('BufEnter', {
--     group = group,
--     callback = function()
--         local ft = vim.bo.filetype
--         for _, frontend_file in ipairs(frontend) do
--             if ft == frontend_file then
--                 vim.cmd('colo onedark')
--                 return
--             end
--         end
--
--         vim.cmd('colo kanagawa-dragon')
--     end,
-- })
--
