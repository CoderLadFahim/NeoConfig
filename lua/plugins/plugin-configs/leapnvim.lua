local leap_status_ok, leap = pcall(require, 'leap')
if not leap_status_ok then
	return
end

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set({ 'n', 'o' }, 'S', '<Plug>(leap-backward)')
