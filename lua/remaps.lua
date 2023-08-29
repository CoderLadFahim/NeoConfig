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
  		vim.cmd('Telescope git_files disable_devicons=' .. tostring(ENABLE_ICONS() == false))
	else
		print('Not a git repository, searching all files');
  		vim.cmd('Telescope find_files disable_devicons=' .. tostring(ENABLE_ICONS() == false))
  	end
end

function SOURCE_FILE()
	if vim.bo.filetype == "lua" then
  		vim.cmd('so %')
	else
		print('Not a lua file')
	end
end

function GET_VISUAL_SELECTION()
    local s_start = vim.fn.getpos("'<")
    local s_end = vim.fn.getpos("'>")
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    return table.concat(lines, '\n')
end

function VISUAL_GREP_STRING() 
    local visual_selection = GET_VISUAL_SELECTION()
    require('telescope.builtin').grep_string({
        search = visual_selection,
        disable_devicons = ENABLE_ICONS() == false 
    })
end

set_keymap('n', '<leader>w', ':lua WRITE_FILE()<CR>')
set_keymap('n', '<leader>q', ':q!')
set_keymap('n', '<leader>so', ':lua SOURCE_FILE()')
set_keymap('n', '<leader>v', '<C-v>')
set_keymap('n', '<leader>fv', ':file<CR>')

set_keymap('n', '<leader><esc>', ':nohls<CR>')

set_keymap('n', '<leader>nm', ':%norm ')
set_keymap('v', '<leader>nm', ':%norm ')

set_keymap('n', '<LEFT>', ':lua print("use h")<CR>')
set_keymap('n', '<DOWN>', ':lua print("use j")<CR>')
set_keymap('n', '<UP>', ':lua print("use k")<CR>')
set_keymap('n', '<RIGHT>', ':lua print("use l")<CR>')

set_keymap('n', '<leader>ar', ':lua print()<LEFT>')

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
set_keymap('n', '<leader>nn', ':set rnu!<CR>')

set_keymap('n', '<leader>lz', ':Lazy <CR>')

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
set_keymap('n', "<leader>FF", "<cmd>Telescope find_files disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>")
set_keymap('n', "<leader>fw", "<cmd>Telescope live_grep disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>")
set_keymap('n', "<leader>gb", "<cmd>Telescope git_branches<CR>")
set_keymap('n', "<leader>glo", "<cmd>Telescope git_commits<CR>")
set_keymap('n', "<leader>gs", "<cmd>Telescope git_status<CR>")
set_keymap('n', "<leader>hg", "<cmd>Telescope help_tags<CR>")
set_keymap('n', "<leader>cs", "<cmd>Telescope colorscheme<CR>")
set_keymap('n', "<leader>bf", "<cmd>Telescope buffers disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>")
set_keymap('n', "<leader>rm", "<cmd>Telescope keymaps<CR>")
set_keymap('n', "<leader>cm", "<cmd>Telescope commands<CR>")
set_keymap('n', "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>")
set_keymap('n', "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
set_keymap('n', "<leader>lf", "<cmd>Telescope lsp_references<CR>")
set_keymap('n', "<leader>hh", "<cmd>Telescope highlights<CR>")
set_keymap('v', "<leader>fw", ":lua VISUAL_GREP_STRING()<CR>")

-- git mappings
set_keymap('n', "<leader>ga.", ":G add .")
set_keymap('n', "<leader>gcm", ':G commit -m ""')
set_keymap('n', "<leader>gcam", ':G commit --amend -m ""')
set_keymap('n', "<leader>gcan", ':G commit --amend --no-edit')
set_keymap('n', "<leader>gr.", ":G restore .")
-- set_keymap('n', "<leader>do", ":DiffviewOpen<CR>")
-- set_keymap('n', "<leader>dc", ":DiffviewClose<CR>")
set_keymap('n', "<leader>gv", ":Gvdiffsplit!<CR>")
set_keymap('n', "<leader>gm", ":G blame<CR>")
set_keymap('n', "<leader>ft", ":lua require('telescope.builtin').live_grep({type_filter = 'js'})")

-- Lsp saga mappings
set_keymap('n', "<leader>dp", ":Lspsaga peek_definition<CR>")
set_keymap('n', "<leader>tp", ":Lspsaga peek_type_definition<CR>")
-- set_keymap('n', "<leader>lf", ":Lspsaga lsp_finder<CR>")
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
vim.keymap.set('v', '<leader>$$', vim.lsp.buf.format, {silent = true, buffer = 0})
