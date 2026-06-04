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

-- local path_actions = require('telescope_insert_path')
telescope.setup(
    {
        defaults = {
            preview = false,
            -- prompt_prefix = ' ',
            -- selection_caret = ' ',
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            layout_strategy = 'bottom_pane',
            layout_config = {
                vertical = {
                    preview_cutoff = 10,
                },
                bottom_pane = {
                    prompt_position = 'bottom',
                }
            },
            file_ignore_patterns = {
                'package/installer',
                'vendor',
                'public/illumine-admin',
                'public/illumine-admin/',
                'public/vendor',
                'public/install',
                'public/scripts',
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
                    -- ["<Esc>"] = "close",
                },
                n = {
                    -- E.g. Type `[i`, `[I`, `[a`, `[A`, `[o`, `[O` to insert relative path and select the path in visual mode.
                    -- Other mappings work the same way with a different prefix.
                    --[[ ["["] = path_actions.insert_reltobufpath_visual,
                    ["]"] = path_actions.insert_abspath_visual,
                    ["{"] = path_actions.insert_reltobufpath_insert,
                    ["}"] = path_actions.insert_abspath_insert,
                    ["-"] = path_actions.insert_reltobufpath_normal,
                    ["="] = path_actions.insert_abspath_normal, 
	                -- If you want to get relative path that is relative to the cwd, use
	                -- `relpath` instead of `reltobufpath`
                    -- You can skip the location postfix if you specify that in the function name.
                    ["<C-o>"] = path_actions.insert_relpath_o_visual, ]]
                }
            }
        },
    }
)

telescope.load_extension('harpoon')
