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
    'gruvbox',
    'indent-blankline',
    'leapnvim',
    -- 'bufferline',
    'gitconflict',
    'onedark',
}

for _, value in ipairs(plugin_configs) do
    local path = 'plugins.plugin-configs.' .. value;
    require(path);
end

require("buffer_manager").setup( 
    {
        line_keys = "1234567890",
        select_menu_item_commands = {
            edit = {
                key = "<CR>",
                command = "edit"
            }
        },
        focus_alternate_buffer = false,
        short_file_names = true,
        short_term_names = true,
        loop_nav = true,
        highlight = "",
        win_extra_options = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
)
