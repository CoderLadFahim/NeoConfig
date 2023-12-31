local plugin_configs = {
    'oil',
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
    'indent-blankline',
    'leapnvim',
    'buffermanager',
    'gitconflict',
    'gruvbox',
    -- 'onedark',
}

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end

