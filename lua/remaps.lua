function set_keymap(mode, seq, cmd)
	local opts = { noremap = true, silent = false }
	vim.api.nvim_set_keymap(mode, seq, cmd, opts)
end

function WRITE_FILE()
  	local modified = vim.api.nvim_buf_get_option(0, 'modified')
  	local write_command = 'w'
  	if modified then
		vim.cmd(write_command)
	else
		print("File written")
	end
end

function SEARCH_GIT_FILES()
	local git_file_searching_command = 'Telescope git_files'
	if vim.fn.isdirectory('.git') == 1 then
  		vim.cmd(git_file_searching_command)
	else
		print('Not a git repository')
	end
end

function SOURCE_FILE()
	local sourcing_command = 'so %';
	if vim.bo.filetype == "lua" then
  		vim.cmd(sourcing_command)
	else
		print('Not a lua file')
	end
end

set_keymap('n', '<leader>w', ':lua WRITE_FILE()<CR>')
set_keymap('n', '<leader>q', ':q!')
-- set_keymap('n', '<leader>so', ':so %')
set_keymap('n', '<leader>so', ':lua SOURCE_FILE()')
set_keymap('n', '<leader>v', '<C-v>')
set_keymap('n', '<leader>fv', ':file<CR>')

-- Better tab controls
-- set_keymap('n', '<leader>tn', ':tabedit<CR>')
-- set_keymap('n', '<leader>tq', ':tabclose!<CR>')
-- set_keymap('n', '<leader>taq', ':tabonly!<CR>')
set_keymap('n', '}', ':BufferLineCycleNext<CR>')
set_keymap('n', '{', ':BufferLineCyclePrev<CR>')
set_keymap('n', '<leader>bp', ':BufferLinePick<CR>')
set_keymap('n', '<leader>bq', ':b#|bd#')
set_keymap('n', '<leader>xc', ':BufferLineCloseRight')
set_keymap('n', '<leader>xz', ':BufferLineCloseLeft')

set_keymap('n', '<leader>fr', ':%s/')

set_keymap('n', '<leader>taa', ':ToggleTermToggleAll<CR>')
set_keymap('t', '<esc>', [[<C-\><C-n>]])

set_keymap('n', "<leader>hh","<C-w>h")
set_keymap('n', "<leader>jj","<C-w>j")
set_keymap('n', "<leader>kk","<C-w>k")
set_keymap('n', "<leader>ll","<C-w>l")

set_keymap('n', "(", "<cmd>vertical resize +4<CR>")
set_keymap('n', "+", "<cmd>resize +4<CR>")
set_keymap('n', "-", "<cmd>resize -4<CR>")
set_keymap('n', ")", "<cmd>vertical resize -4<CR>")

-- Nvim tree mappings
-- set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>')
-- set_keymap('n', '<leader>tf', ':NvimTreeFindFile<CR>')
-- set_keymap('n', '<leader>fc', ':NvimTreeCollapse<CR>')

set_keymap('n', '<leader>tf', ":lua OPEN_NVIM_TREE('float')<CR>")
set_keymap('n', '<leader>tr', ":lua OPEN_NVIM_TREE('left')<CR>")
set_keymap('n', '<leader>ty', ":lua OPEN_NVIM_TREE('right')<CR>")

-- Telescope mappings
-- set_keymap('n', "<leader>ff", "<cmd>Telescope git_files<CR>")
set_keymap('n', "<leader>ff", ":lua SEARCH_GIT_FILES()<CR>")
set_keymap('n', "<leader>FF", "<cmd>Telescope find_files<CR>")
set_keymap('n', "<leader>fw", "<cmd>Telescope live_grep<CR>")
set_keymap('n', "<leader>gb", "<cmd>Telescope git_branches<CR>")
set_keymap('n', "<leader>glo", "<cmd>Telescope git_commits<CR>")

-- -- Toggleterm mappings
-- set_keymap('n', "<leader>lg", "<cmd>lua LAZYGIT_TOGGLE()<CR>")
-- set_keymap('n', "<leader>nd", "<cmd>lua NODE_TOGGLE()<CR>")
-- set_keymap('n', "<leader>tk", "<cmd>lua TINKER_TOGGLE()<CR>")


-- git mappings
set_keymap('n', "<leader>ga.", ":G add .")
set_keymap('n', "<leader>gs", ":G status")
-- set_keymap('n', "<leader>glo", ":G log --oneline ")
set_keymap('n', "<leader>gcm", ':G commit -m ""')
set_keymap('n', "<leader>gcam", ':G commit --amend -m ""')
set_keymap('n', "<leader>gcan", ':G commit --amend --no-edit')
set_keymap('n', "<leader>gr.", ":G restore .")
set_keymap('n', "<leader>gd", ":G diff")
set_keymap('n', "<leader>gv", ":Gvdiffsplit!<CR>")


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
