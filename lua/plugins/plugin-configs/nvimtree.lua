if not nvim_tree_status_ok then
	return
end

local rows = vim.api.nvim_get_option("lines")
local cols = vim.api.nvim_get_option("columns")
local float_win_height = math.floor((70 / 100) * rows) + 5
local float_win_width = math.floor((70 / 100) * cols)

local row_centered = math.floor(rows / 2) - math.floor((float_win_height + 5) / 2) 
local col_centered = math.floor(cols / 2) - math.floor(float_win_width / 2)

-- OR setup with some options
nvim_tree.setup({
  	-- open_on_setup = true,
  	sort_by = "case_sensitive",
  	view = {
    	-- adaptive_size = true,
    	-- side = 'left',
    	-- width = 30,
    	relativenumber = true,
    	mappings = {
      		list = {
        		{ key = "u", action = "dir_up" },
      		},
    	},
    	float = {
    		enable = true,
          	quit_on_focus_loss = true,
          	open_win_config = {
            	border = "rounded",
    			width = float_win_width,
            	height = float_win_height,
            	row = row_centered,
            	col = col_centered,
        	},
    	}
  	},
  	renderer = {
    	group_empty = true,
    	indent_width = 4,
		indent_markers = {
          	enable = true,
          	inline_arrows = true,
          	icons = {
            	corner = "└",
            	edge = "│",
            	item = "│",
            	bottom = "─",
            	none = " ",
          	},
        }
  	},
  	filters = {
    	dotfiles = true,
  	},
})
