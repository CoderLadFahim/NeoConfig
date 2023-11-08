local buffermanager_status_ok, buffermanager = pcall(require, "buffer_manager")
if not buffermanager_status_ok then
	return
end

local rows = vim.api.nvim_get_option("lines")
local cols = vim.api.nvim_get_option("columns")
local float_win_height = math.floor((70 / 100) * rows)
local float_win_width = math.floor((70 / 100) * cols)

buffermanager.setup( 
    {
        line_keys = "1234567890",
        width = float_win_width,
        height = float_win_height,
        select_menu_item_commands = {
            edit = {
                key = "<CR>",
                command = "edit"
            }
        },
        focus_alternate_buffer = false,
        short_file_names = false,
        short_term_names = true,
        loop_nav = true,
        highlight = "",
        win_extra_options = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
)
