function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'gruvbox-material'
end

require('options');
require('globals');
require('remaps');
require('lazy-config');
require('plugins');
require('lsp');

function SET_COLORSCHEME()
	local colorscheme_command = 'colo ' .. GET_GLOBAL_COLOR_SCHEME()
	local transparent_cmd_1 = 'highlight Normal guibg=none';
	local transparent_cmd_2 = 'highlight NonText guibg=none';

	vim.cmd(colorscheme_command)
	vim.cmd(colorscheme_command)
	-- vim.cmd(transparent_cmd_1)
	-- vim.cmd(transparent_cmd_2)
end

SET_COLORSCHEME()
