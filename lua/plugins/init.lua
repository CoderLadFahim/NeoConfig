local plugin_configs = {
    'nvimtree',
    'treesitter',
    'commentnvim',
    'telescope',
    'toggleterm',
    'auto-pairs',
    'gitsigns',
    'cmp',
    'mason',
    'null-ls',
    'prettier',
    'gruvbox',
    'indent-blankline',
    'leapnvim',
    'buffermanager',
    'gitconflict',
    'gruvbox',
    'onedark',
}

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end

