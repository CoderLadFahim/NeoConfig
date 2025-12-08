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
    'cmp',
    'mason',
    'none-ls',
    'prettier',
    'indent-blankline',
    'leapnvim',
    'gitconflict',
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

require('better-digraphs')

vim.g.BetterDigraphsAdditions = {
  {
    digraph = "l1",
    symbol = "●",
    name = "list item 1"
  }
}
