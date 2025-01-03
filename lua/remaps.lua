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

function GET_WORK_PERCENTAGE()
    local starting_hour = 8
    local ending_hour = 17
    local target_seconds = (ending_hour - starting_hour) * 3600
    local current_minute_in_seconds = os.date('%M') * 60
    local total_seconds_passed = (os.date('%H') - starting_hour) * 3600 + current_minute_in_seconds

    local working_percentage = math.floor(((total_seconds_passed / target_seconds) * 100 ) + 0.5)
    print(working_percentage .. '%')
end

local keymaps = {

    -- Telescope
    { 'n', "<leader>p", "<cmd>Telescope buffers disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>" },
    { 'n', "<leader>FF", "<cmd>Telescope find_files disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>" },
    { 'n', "<leader>fw", "<cmd>Telescope live_grep disable_devicons=" .. tostring(ENABLE_ICONS() == false) .."<CR>" },
    { 'n', "<leader>gb", "<cmd>Telescope git_branches<CR>" },
    { 'n', "<leader>glo", "<cmd>Telescope git_commits<CR>" },
    { 'n', "<leader>gs", "<cmd>Telescope git_status<CR>" },
    { 'n', "<leader>hh", "<cmd>Telescope help_tags<CR>" },
    { 'n', "<leader>cs", "<cmd>Telescope colorscheme<CR>" },
    { 'n', "<leader>rm", "<cmd>Telescope keymaps<CR>" },
    { 'n', "<leader>cm", "<cmd>Telescope commands<CR>" },
    { 'n', "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>" },
    { 'n', "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>" },
    { 'n', "<leader>lf", "<cmd>Telescope lsp_references<CR>" },
    { 'n', "<leader>hg", "<cmd>Telescope highlights<CR>" },
    { 'n', "<leader>ft", ":lua require('telescope.builtin').live_grep({type_filter = 'js'})" },
    { 'v', "<leader>fw", ":lua VISUAL_GREP_STRING()<CR>" },
    { 'n', "<leader>ff", ":lua SEARCH_GIT_FILES()<CR>" },
    { 'n', "<leader>mm", "<cmd>Telescope marks<CR>" },
    { 'n', "<leader>cc", ":Telescope command_history<CR>" },
    { 'n', "<leader>tt", ":Telescope builtin<CR>" },
    { 'n', "<leader>ld", ":Telescope diagnostics<CR>" },
    { 'n', "<leader>jl", ":Telescope jumplist<CR>" },
    { 'n', "<leader>rg", ":Telescope registers<CR>" },
    { 'n', "<leader>bb", ":Telescope current_buffer_fuzzy_find<CR>" },

    -- Fugitive
    { 'n', "<leader>ga.", ":G add ." },
    { 'n', "<leader>gcm", ':G commit -m ""<LEFT>' },
    { 'n', "<leader>gcam", ':G commit --amend -m ""<LEFT>' },
    { 'n', "<leader>gcan", ':G commit --amend --no-edit' },
    { 'n', "<leader>gr.", ":G restore ." },
    { 'n', "<leader>gv", ":Gvdiffsplit!<CR>" },
    { 'n', "<leader>gm", ":G blame<CR>" },
    { 'n', "<leader>gd", ":G pull origin dev" },
    { 'n', "<leader>gp", ":G push origin -u HEAD" },

    -- GtiConflict
    { 'n', "<leader>go", ":GitConflictChooseOurs" },
    { 'n', "<leader>gt", ":GitConflictChooseTheirs" },
    { 'n', "<leader>ga", ":GitConflictChooseBoth" },
    { 'n', "]z", ":GitConflictNextConflict<CR>" },
    { 'n', "[z", ":GitConflictPrevConflict<CR>" },
    { 'n', "<leader>cq", ":GitConflictListQf<CR>" },

    -- Oil
    { 'n', '<leader>tr', ":Oil<CR>" },

    -- DiffView
    { 'n', "<leader>do", ":DiffviewOpen " },
    { 'n', "<leader>dc", ":DiffviewClose<CR>" },
    { 'n', "<leader>df", ":DiffviewFileHistory %" },

    -- Harpoon
    { 'n', "<leader>a", ":lua require('harpoon.mark').add_file()<CR>" },
    { 'n', "<leader>hp", ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    { 'n', "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>"},
    { 'n', "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>"},
    { 'n', "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>"},
    { 'n', "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>"},
    { 'n', "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>"},
    { 'n', "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>"},
    { 'n', "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>"},
    { 'n', "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>"},
    { 'n', "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>"},

    { 'n', "<CR>1", ":lua require('harpoon.term').gotoTerminal(1)<CR>"},
    { 'n', "<CR>2", ":lua require('harpoon.term').gotoTerminal(2)<CR>"},
    { 'n', "<CR>3", ":lua require('harpoon.term').gotoTerminal(3)<CR>"},
    { 'n', "<CR>4", ":lua require('harpoon.term').gotoTerminal(4)<CR>"},
    { 'n', "<CR>5", ":lua require('harpoon.term').gotoTerminal(5)<CR>"},
    { 'n', "<CR>6", ":lua require('harpoon.term').gotoTerminal(6)<CR>"},
    { 'n', "<CR>7", ":lua require('harpoon.term').gotoTerminal(7)<CR>"},
    { 'n', "<CR>8", ":lua require('harpoon.term').gotoTerminal(8)<CR>"},
    { 'n', "<CR>9", ":lua require('harpoon.term').gotoTerminal(9)<CR>"},

    -- Misc
    { 't', '<esc>', [[<C-\><C-n>]] },
    { 'n', '<leader>w<leader>w', ':lua print("use :w")<CR>' },
    { 'n', '<leader>ss', ':lua SOURCE_FILE()' },
    { 'n', '<leader>so', ':source ~/.config/nvim/init.lua' },
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
    { 'n', '<leader>bd', ':%bd|e#' },
    { 'n', "<leader>cl", "Oconsole.log()<LEFT>" },

    { 't', '<esc>', [[<C-\><C-n>]] },
    { 'n', "n", "nzzzv" },
    { 'n', "N", "Nzzzv" },
    { 'n', '<LEFT>', ':lua print("use h")<CR>' },
    { 'n', '<DOWN>', ':lua print("use j")<CR>' },
    { 'n', '<UP>', ':lua print("use k")<CR>' },
    { 'n', '<RIGHT>', ':lua print("use l")<CR>' },
    { 'i', '<LEFT>', '<esc>' },
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
    { 'v', "<leader>r", [[:s/\%V]] },
    { 'v', "<leader>-", [[:s/\%V /_/g<CR>]] },
    { 'n', "vv", "V" },
    { 'n', "<f2>", ":lua GET_WORK_PERCENTAGE()<CR>" },

    -- Disabling Ctrl-c
    { 'v', "<C-c>", "<Nop>" },
    { 'i', "<C-c>", "<Nop>" },

    { 'n', "<leader>sq", ":DBUIToggle<CR>" },
    { 'i', "<C-h>", "<LEFT>" },
    { 'i', "<C-l>", "<RIGHT>" },
    { 'n', "<leader>x", "*``cgn" },
    { 'n', "<leader>X", "#``cgn" },

    { 'n', "dw", "diw" },
    { 'n', "cw", "ciw" },
    { 'n', "yw", "yiw" },
    { 'n', "vw", "viw" },

    { 'i', "<C-k><C-k>", "<Cmd>lua require'better-digraphs'.digraphs('insert')<CR>" },
    { 'v', "<C-k><C-k>", "<ESC><Cmd>lua require'better-digraphs'.digraphs('visual')<CR>" },
}

for _, value in ipairs(keymaps) do
    set_keymap(
        value[1],
        value[2],
        value[3]
    )
end
