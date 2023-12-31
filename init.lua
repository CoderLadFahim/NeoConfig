function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'gruvbox'
end

function ENABLE_ICONS()
	return false
end

require('options');
require('globals');
require('remaps');
require('lazy-config');
require('plugins');
require('lsp');
require('processes');

function SET_COLORSCHEME()
	vim.cmd('colo ' .. GET_GLOBAL_COLOR_SCHEME())
end

SET_COLORSCHEME()

