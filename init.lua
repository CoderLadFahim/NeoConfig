function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'sonokai'
end

require('options');
require('globals');
require('remaps');
require('lazy-config');
require('plugins');
require('lsp');
require('processes');

function SET_COLORSCHEME()
	local transparent_cmd_1 = 'highlight Normal guibg=none';
	local transparent_cmd_2 = 'highlight NonText guibg=none';

	vim.cmd('colo ' .. GET_GLOBAL_COLOR_SCHEME())
end

SET_COLORSCHEME()

