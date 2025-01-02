local plugin_configs = {
    -- 'monokai',
    -- 'rose-pine',
    -- 'gruvbox',
    --
    'oil',
    'treesitter',
    'commentnvim',
    'telescope',
    'auto-pairs',
    'gitsigns',
    'cmp',
    'mason',
    'none-ls',
    'prettier',
    'indent-blankline',
    'leapnvim',
    'gitconflict',
    'kanagawa',
    'rose-pine',
    'gruvbox',
    'onedark',
    'monokai',
    'harpoon',
    'colorizer',
    'fzflua',
    'kanagawa',
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

