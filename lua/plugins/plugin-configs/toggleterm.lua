local toggleterm_status_ok, toggleterm = pcall(require, 'toggleterm')
if not toggleterm_status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<leader><SPACE>]],
	start_in_insert = true,
	hide_numbers = true,
	direction = 'horizontal',
	float_opts = {
		border = 'curved'
	}
})

-- local Terminal = require('toggleterm.terminal').Terminal
-- local lazygit = Terminal:new({cmd = 'lazygit', hidden = true, direction = 'float'})
-- local node = Terminal:new({cmd = 'node', hidden = true, direction = 'float'})
-- local tinker = Terminal:new({cmd = 'php artisan tinker', hidden = true, direction = 'float'})

-- function LAZYGIT_TOGGLE()
-- 	lazygit:toggle()
-- end
--
-- function NODE_TOGGLE()
-- 	node:toggle()
-- end
--
-- function TINKER_TOGGLE()
-- 	tinker:toggle()
-- end
