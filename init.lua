local themes = {
    Sun = 'sonokai',
    Mon = 'everforest',
    Tue = 'onedark',
    Wed = 'night-owl',
    Thu = 'gruvbox-material',
    Fri = 'tokyonight',
    Sat = 'rose-pine-moon',
}

function GET_GLOBAL_COLOR_SCHEME(theme)
    local weekday = tostring(os.date('%a'))
	return themes[weekday]
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
end

SET_COLORSCHEME()
