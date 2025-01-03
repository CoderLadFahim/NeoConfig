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
            -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            borderchars = { "-", "┇", "-", "┇", "+", "+", "+", "+" },
            layout_strategy = 'vertical',
            layout_config = {
                vertical = {
                    preview_cutoff = 10,
                }
            },
            file_ignore_patterns = {
                'package/installer',
                'vendor',
                'public/vendor',
                'public/install',
                'node_modules',
                'composer.lock',
                'package-lock.json',
                'yarn.lock',
            },
            path_display = function(opts, path)
                local tail = require("telescope.utils").path_tail(path)
                local filetype = get_file_extension(path)

                local iconless_path = string.format("[%s] - %s", filetype, path)
                local path_with_icons = string.format("%s", path)
                 
                if ENABLE_ICONS() then
                    return path_with_icons
                else
                    return iconless_path
                end
            end,
            mappings = {
                i = {
                    ["<Esc>"] = "close",
                },
            }
        },
    }
)

