local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
	return
end

function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

lualine.setup({
  	options = {
    	icons_enabled = true,
    	-- theme = 'github_dark_default',
    	theme =  GET_GLOBAL_COLOR_SCHEME(),
    	disabled_filetypes = {
      	    statusline = {},
      	    winbar = {},
      	    'packer', 'NvimTree', 
    	},
    	ignore_focus = {},
    	always_divide_middle = true,
    	globalstatus = false,
    	refresh = {
      	    statusline = 1000,
      	    tabline = 1000,
      	    winbar = 1000,
    	}
  	},
  	sections = {
    	-- lualine_a = {'mode'},
    	-- lualine_b = {'branch', 'diff', 'diagnostics'},
    	-- lualine_c = {'filename'},
    	-- lualine_x = {'encoding', 'fileformat', 'filetype'},
    	-- lualine_y = {'progress'},
    	-- lualine_z = {'location'}
	 	lualine_a = {'mode'},
    	lualine_b = { GET_CURRENT_DIRECTORY, 'branch', 'diff', 'diagnostics' },
    	lualine_c = {  },
    	lualine_x = {"os.date('%A %d %b %Y %I:%M:%S %p')", 'encoding', '', 'filetype'},
    	lualine_y = {'progress'},
    	lualine_z = {'location'}
  	},
  	inactive_sections = {
    	lualine_a = {},
    	lualine_b = {},
    	lualine_c = {'filename'},
    	lualine_x = {'location'},
    	lualine_y = {},
    	lualine_z = {}
  	},
  	tabline = {},
  	winbar = {},
  	inactive_winbar = {},
  	extensions = {}
})
