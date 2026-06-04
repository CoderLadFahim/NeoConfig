local plugin_configs = {
    'monokai',
    'rose-pine',
    'oil',
    'treesitter',
    'commentnvim',
    'telescope',
    'auto-pairs',
    'gitsigns',
    'copilot',
    'copilot-chat',
    'cmp',
    'mason',
    'none-ls',
    'prettier',
    'indent-blankline',
    'leapnvim',
    'rose-pine',
    'gruvbox',
    'onedark',
    'tokyonight',
    'monokai',
    'harpoon',
    'colorizer',
    'fzflua',
    'kanagawa',
    'vscode',
    'gitconflict',
    'nightfly',
    'solarized',
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
