require('options');
require('globals');
require('remaps');
require('packer-config');
require('plugins');
require('lsp');

local colorscheme_command = 'colo gruvbox';
-- local transparent_cmd_1 = 'highlight Normal guibg=none';
-- local transparent_cmd_2 = 'highlight NonText guibg=none';

vim.cmd(colorscheme_command)
-- vim.cmd(transparent_cmd_1)
-- vim.cmd(transparent_cmd_2)
