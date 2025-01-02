vim.g.mapleader = ' ' -- mapping the leader key to be space
vim.g.loaded_netrw = 1 -- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrwPlugin = 1

vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_transparent_background = 0

vim.g.sonokai_style = 'default'
vim.g.sonokai_diagnostic_virtual_text = 'colored'
vim.g.sonokai_transparent_background = 0

vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

vim.g.dbs = {
    classic_models = 'mysql://newuser:password@localhost/classicmodels'
}
