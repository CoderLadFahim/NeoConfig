local plugin_configs = {
    'impatient',
    'lualine',
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
    'indent-blankline',
    'alpha',
    'leapnvim',
    'bufferline',
    'onedark',
}

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end
