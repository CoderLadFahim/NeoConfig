function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'kanagawa-dragon'
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

    vim.cmd("hi WinBar guifg='#c5c9c5'")
    vim.cmd("hi WinBarNC guifg='#727169'")

    -- Default colorscheme highlight overrides
    -- vim.cmd("hi LineNr guifg='NvimLightGrey4'")
    -- vim.cmd("hi @tag guifg='#ffffff'")
    -- vim.cmd("hi @tag.delimiter guifg='cyan'")
    --
    -- vim.cmd("hi WinBar guifg='NvimLightGrey1'")
    -- vim.cmd("hi WinBarNC guifg='NvimLightGrey4'")
    -- vim.cmd("hi @keyword guifg='NvimLightRed'")
end

SET_COLORSCHEME()

