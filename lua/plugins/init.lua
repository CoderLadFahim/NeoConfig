local plugin_configs = {
    'oil',
    'treesitter',
    'commentnvim',
    'telescope',
    -- 'toggleterm',
    'auto-pairs',
    'gitsigns',
    'cmp',
    'mason',
    'none-ls',
    'prettier',
    'indent-blankline',
    'leapnvim',
    -- 'buffermanager',
    'gitconflict',
    'kanagawa',
    'rose-pine',
    'gruvbox',
    'onedark',
}

vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    callback = function()
        vim.cmd('setlocal nonumber norelativenumber')
    end
})

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end

