local plugin_configs = {
    'impatient',
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
    'leapnvim',
    'lspsaga',
    'bufferline',
}

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end
