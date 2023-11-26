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

local keymaps = {

    -- Telescope
    { 'n', "<leader>p", "<cmd>Telescope buffers disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>" },
    { 'n', "<leader>FF", "<cmd>Telescope find_files disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>" },
    { 'n', "<leader>fw", "<cmd>Telescope live_grep disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>" },
    { 'n', "<leader>gb", "<cmd>Telescope git_branches<CR>" },
    { 'n', "<leader>glo", "<cmd>Telescope git_commits<CR>" },
    { 'n', "<leader>gs", "<cmd>Telescope git_status<CR>" },
    { 'n', "<leader>hg", "<cmd>Telescope help_tags<CR>" },
    { 'n', "<leader>cs", "<cmd>Telescope colorscheme<CR>" },
    { 'n', "<leader>rm", "<cmd>Telescope keymaps<CR>" },
    { 'n', "<leader>cm", "<cmd>Telescope commands<CR>" },
    { 'n', "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>" },
    { 'n', "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>" },
    { 'n', "<leader>lf", "<cmd>Telescope lsp_references<CR>" },
    { 'n', "<leader>hh", "<cmd>Telescope highlights<CR>" },
    { 'n', "<leader>ft", ":lua require('telescope.builtin').live_grep({type_filter = 'js'})" },
    { 'v', "<leader>fw", ":lua VISUAL_GREP_STRING()<CR>" },
    { 'n', "<leader>ff", ":lua SEARCH_GIT_FILES()<CR>" },
    { 'n', "<leader>mm", "<cmd>Telescope marks<CR>" },

    -- Fugitive
    { 'n', "<leader>ga.", ":G add ." },
    { 'n', "<leader>gcm", ':G commit -m ""<LEFT>' },
    { 'n', "<leader>gcam", ':G commit --amend -m ""<LEFT>' },
    { 'n', "<leader>gcan", ':G commit --amend --no-edit' },
    { 'n', "<leader>gr.", ":G restore ." },
    { 'n', "<leader>gv", ":Gvdiffsplit!<CR>" },
    { 'n', "<leader>gm", ":G blame<CR>" },

    -- GtiConflict
    { 'n', "<leader>2", ":GitConflictChooseOurs" },
    { 'n', "<leader>3", ":GitConflictChooseTheirs" },
    { 'n', "<leader>1", ":GitConflictChooseBoth" },
    { 'n', "]z", ":GitConflictNextConflict<CR>" },
    { 'n', "[z", ":GitConflictPrevConflict<CR>" },
    { 'n', "<leader>cq", ":GitConflictListQf<CR>" },

    -- LspSaga
    { 'n', "<leader>dp", ":Lspsaga peek_definition<CR>" },
    { 'n', "<leader>tp", ":Lspsaga peek_type_definition<CR>" },
    { 'n', "<leader>ld", ":Lspsaga show_buf_diagnostics<CR>" },

    -- NvimTree
    { 'n', '<leader>tr', ":lua OPEN_NVIM_TREE('left')<CR>" },
    { 'n', '<leader>tf', ":lua OPEN_NVIM_TREE('float')<CR>" },
    { 'n', '<leader>ty', ":lua OPEN_NVIM_TREE('right')<CR>" },

    -- Buffer manager
    { 'n', '<leader>bf', ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>' },
    { 'n', '}', ':lua require("buffer_manager.ui").nav_next()<CR>' },
    { 'n', '{', ':lua require("buffer_manager.ui").nav_prev()<CR>' },

    -- DiffView
    { 'n', "<leader>do", ":DiffviewOpen " },
    { 'n', "<leader>dc", ":DiffviewClose<CR>" },

    -- Misc
    { 't', '<esc>', [[<C-\><C-n>]] },
    { 'n', '<leader>w', ':lua WRITE_FILE()<CR>' },
    { 'n', '<leader>ss', ':lua SOURCE_FILE()' },
    { 'n', '<leader>q', ':q!' },
    { 'n', '<leader>v', '<C-v>' },
    { 'n', '<leader>fv', ':file<CR>' },
    { 'n', '<leader><esc>', ':nohls<CR>' },
    { 'v', '<leader>nm', ':%norm ' },
    { 'n', '<leader>nm', ':%norm ' },
    { 'n', '<leader>ar', ':lua print()<LEFT>' },
    { 'n', '<leader>bq', ':b#|bd#' },
    { 'n', '<leader>nn', ':set rnu!<CR>' },
    { 'n', '<leader>lz', ':Lazy <CR>' },
    { 'n', '<leader>fr', ':%s/' },
    { 'n', '<leader>taa', ':ToggleTermToggleAll<CR>' },
    { 'n', "<leader>cl", "Oconsole.log('')<LEFT><LEFT>" },

    { 't', '<esc>', [[<C-\><C-n>]] },
    { 'n', "n", "nzzzv" },
    { 'n', "N", "Nzzzv" },
    { 'n', '<LEFT>', ':lua print("use h")<CR>' },
    { 'n', '<DOWN>', ':lua print("use j")<CR>' },
    { 'n', '<UP>', ':lua print("use k")<CR>' },
    { 'n', '<RIGHT>', ':lua print("use l")<CR>' },
    { 'n', "<C-d>", "<C-d>zz" },
    { 'n', "<C-u>", "<C-u>zz" },
    { 'n', "<C-f>", "<C-f>zz" },
    { 'n', "<C-b>", "<C-b>zz" },
    { 'n', "(", "<cmd>vertical resize +4<CR>" },
    { 'n', "+", "<cmd>resize +4<CR>" },
    { 'n', "-", "<cmd>resize -4<CR>" },
    { 'n', ")", "<cmd>vertical resize -4<CR>" },
    { 'v', "J", ":m '>+1<CR>gv=gv" },
    { 'v', "K", ":m '<-2<CR>gv=gv" },
    { 'n', "<leader>cn", ":%s///gn<CR>" },

    { 'i', "<C-h>", "<LEFT>" },
    { 'i', "<C-l>", "<RIGHT>" },
    { 'i', "<C-x>", "<Esc>xi" },

    { 'n', "dw", "diw" },
    { 'n', "cw", "ciw" },
    { 'n', "yw", "yiw" },
    { 'n', "vw", "viw" },
}


for _, value in ipairs(keymaps) do
    set_keymap(
        value[1],
        value[2],
        value[3]
    )
end
