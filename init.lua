function GET_GLOBAL_COLOR_SCHEME(theme)
	return 'sonokai'
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
end

SET_COLORSCHEME()


function get_file_extension(path)
    local dot_index = string.find(path, "%.[^%.]*$") -- find the last dot in the string
    if dot_index then
        return string.sub(path, dot_index + 1) -- return everything after the dot
    else
        return nil -- no file extension found
    end
end

local path = ".gitignore"
local extension = get_file_extension(path)
print(extension) -- "lua"
