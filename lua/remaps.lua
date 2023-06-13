function set_keymap(mode, seq, cmd)
	local opts = { noremap = true, silent = false }
	vim.api.nvim_set_keymap(mode, seq, cmd, opts)
end

function WRITE_FILE()
  	local modified = vim.api.nvim_buf_get_option(0, 'modified')
  	if modified then
		vim.cmd('w')
	else
		print("File written")
	end
end

function SEARCH_GIT_FILES()
	if vim.fn.isdirectory('.git') == 1 then
  		vim.cmd('Telescope git_files disable_devicons=true')
	else
		print('Not a git repository, searching all files');
  		vim.cmd('Telescope find_files disable_devicons=true')
	end
end

function SOURCE_FILE()
	if vim.bo.filetype == "lua" then
  		vim.cmd('so %')
	else
		print('Not a lua file')
	end
end

set_keymap('n', '<leader>w', ':lua WRITE_FILE()<CR>')
set_keymap('n', '<leader>q', ':q!')
set_keymap('n', '<leader>so', ':lua SOURCE_FILE()')
set_keymap('n', '<leader>v', '<C-v>')
set_keymap('n', '<leader>fv', ':file<CR>')

-- Bufferline
set_keymap('n', '}', ':BufferLineCycleNext<CR>')
set_keymap('n', '{', ':BufferLineCyclePrev<CR>')
set_keymap('n', '<C-l>', ':BufferLineMoveNext<CR>')
set_keymap('n', '<C-h>', ':BufferLineMovePrev<CR>')
set_keymap('n', '<leader>p', ':BufferLinePick<CR>')
set_keymap('n', '<leader>x', ':BufferLinePickClose<CR>')
set_keymap('n', '<leader>xc', ':BufferLineCloseRight')
set_keymap('n', '<leader>xz', ':BufferLineCloseLeft')
set_keymap('n', '<leader>bq', ':b#|bd#')

set_keymap('n', '<leader>fr', ':%s/')

set_keymap('n', '<leader>taa', ':ToggleTermToggleAll<CR>')
set_keymap('t', '<esc>', [[<C-\><C-n>]])

set_keymap('n', "(", "<cmd>vertical resize +4<CR>")
set_keymap('n', "+", "<cmd>resize +4<CR>")
set_keymap('n', "-", "<cmd>resize -4<CR>")
set_keymap('n', ")", "<cmd>vertical resize -4<CR>")

set_keymap('n', '<leader>tf', ":lua OPEN_NVIM_TREE('float')<CR>")
set_keymap('n', '<leader>tr', ":lua OPEN_NVIM_TREE('left')<CR>")
set_keymap('n', '<leader>ty', ":lua OPEN_NVIM_TREE('right')<CR>")

-- Telescope mappings
set_keymap('n', "<leader>ff", ":lua SEARCH_GIT_FILES()<CR>")
set_keymap('n', "<leader>FF", "<cmd>Telescope find_files disable_devicons=true<CR>")
set_keymap('n', "<leader>fw", "<cmd>Telescope live_grep disable_devicons=true<CR>")
set_keymap('v', "<leader>fw", "<cmd>Telescope grep_string disable_devicons=true<CR>")
set_keymap('n', "<leader>gb", "<cmd>Telescope git_branches<CR>")
set_keymap('n', "<leader>glo", "<cmd>Telescope git_commits<CR>")
set_keymap('n', "<leader>gs", "<cmd>Telescope git_status<CR>")
set_keymap('n', "<leader>hg", "<cmd>Telescope help_tags<CR>")
set_keymap('n', "<leader>cs", "<cmd>Telescope colorscheme<CR>")
set_keymap('n', "<leader>bf", "<cmd>Telescope buffers disable_devicons=true<CR>")
set_keymap('n', "<leader>rm", "<cmd>Telescope keymaps<CR>")

-- git mappings
set_keymap('n', "<leader>ga.", ":G add .")
set_keymap('n', "<leader>gcm", ':G commit -m ""')
set_keymap('n', "<leader>gcam", ':G commit --amend -m ""')
set_keymap('n', "<leader>gcan", ':G commit --amend --no-edit')
set_keymap('n', "<leader>gr.", ":G restore .")
set_keymap('n', "<leader>gd", ":G diff")
set_keymap('n', "<leader>gv", ":Gvdiffsplit!<CR>")
set_keymap('n', "<leader>gm", ":G blame<CR>")

-- Lsp saga mappings
set_keymap('n', "<leader>dp", ":Lspsaga peek_definition<CR>")
set_keymap('n', "<leader>tp", ":Lspsaga peek_type_definition<CR>")
set_keymap('n', "<leader>lf", ":Lspsaga lsp_finder<CR>")
set_keymap('n', "<leader>ld", ":Lspsaga show_buf_diagnostics<CR>")


set_keymap('n', "<C-d>", "<C-d>zz")
set_keymap('n', "<C-u>", "<C-u>zz")
set_keymap('n', "<C-f>", "<C-f>zz")
set_keymap('n', "<C-b>", "<C-b>zz")

-- moving visual blocks
set_keymap('v', "J", ":m '>+1<CR>gv=gv")
set_keymap('v', "K", ":m '<-2<CR>gv=gv")

-- Keeping the search term in the middle of the screen
set_keymap('n', "n", "nzzzv")
set_keymap('n', "N", "Nzzzv")

-- keeping the yanked content in the register after pasting over
set_keymap('v', "p", "\"_dP")
