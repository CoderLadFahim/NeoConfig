function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'rose-pine'
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

    -- vim.cmd("hi WinBar guifg='#c5c9c5'")
    -- vim.cmd("hi WinBarNC guifg='#727169'")
end

SET_COLORSCHEME()

