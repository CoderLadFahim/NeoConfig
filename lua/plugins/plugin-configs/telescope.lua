local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
	return
end

function get_file_extension(path)
    local dot_index = string.find(path, "%.[^%.]*$") -- find the last dot in the string
    if dot_index then
        return string.sub(path, dot_index + 1) -- return everything after the dot
    else
        return nil -- no file extension found
    end
end

telescope.setup(
    {
        defaults = {
            layout_strategy = 'vertical',
            file_ignore_patterns = {
                -- 'package',
                'vendor',
                'public/vendor',
                'node_modules',
                -- 'public',
                'composer.lock',
                'package-lock.json',
                'yarn.lock',
            },
            path_display = function(opts, path)
                local tail = require("telescope.utils").path_tail(path)
                local filetype = get_file_extension(path)
                return string.format("[%s] - %s", filetype, path)
            end,
        }
    }
)

