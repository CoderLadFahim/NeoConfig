function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'moonfly'
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
    vim.cmd("hi WinBarNC guifg='#555555'")
    -- vim.cmd("hi ColorColumn guibg='red4'")
    vim.cmd("hi CursorLineNr guibg='#080808'")
end

SET_COLORSCHEME()

