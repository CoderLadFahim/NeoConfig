local gruvbox_status_ok, gruvbox = pcall(require, 'gruvbox')
if not gruvbox_status_ok then
	return
end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

function set_colorscheme()
	local colorscheme_command = 'colo gruvbox';
	local transparent_cmd_1 = 'highlight Normal guibg=none';
	local transparent_cmd_2 = 'highlight NonText guibg=none';

	vim.cmd(colorscheme_command)
	vim.cmd(colorscheme_command)
	vim.cmd(transparent_cmd_1)
	vim.cmd(transparent_cmd_2)
end

set_colorscheme();
