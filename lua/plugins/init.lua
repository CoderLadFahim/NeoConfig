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
    'none-ls',
    'prettier',
    'indent-blankline',
    'leapnvim',
    -- 'buffermanager',
    'gitconflict',
    'kanagawa',
    -- 'gruvbox',
    -- 'onedark',
}

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end

local cols = vim.api.nvim_get_option("columns")
local float_win_width = math.floor((70 / 100) * cols)

require("harpoon").setup({
    menu = {
        width = float_win_width,
    }
})
