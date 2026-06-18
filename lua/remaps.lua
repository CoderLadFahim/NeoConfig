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
  		require('fzf-lua').git_files()
	else
		print('Not a git repository, searching all files');
  		require('fzf-lua').files()
  	end
end

function OPEN_TERMINAL(n)
	vim.cmd('sv')
    require('harpoon.term').gotoTerminal(n)
    vim.api.nvim_feedkeys('i', 'n', false)
end

function SOURCE_FILE()
	if vim.bo.filetype == "lua" then
  		vim.cmd('so %')
	else
		print('Not a lua file')
	end
end

local keymaps = {

    -- Telescope
    { 'n', "<leader>p", "<cmd>FzfLua buffers<CR>" },
    { 'n', "<leader>FF", "<cmd>FzfLua files<CR>" },
    { 'n', "<leader>fw", "<cmd>FzfLua live_grep<CR>" },
    { 'n', "<leader>gb", "<cmd>FzfLua git_branches<CR>" },
    { 'n', "<leader>glo", "<cmd>FzfLua git_commits<CR>" },
    { 'n', "<leader>gs", "<cmd>FzfLua git_status<CR>" },
    { 'n', "<leader>hh", "<cmd>FzfLua helptags<CR>" },
    { 'n', "<leader>cs", "<cmd>FzfLua colorschemes<CR>" },
    { 'n', "<leader>rm", "<cmd>FzfLua keymaps<CR>" },
    { 'n', "<leader>cm", "<cmd>FzfLua commands<CR>" },
    { 'n', "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>" },
    { 'n', "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>" },
    { 'n', "<leader>lf", "<cmd>FzfLua lsp_references<CR>" },
    { 'n', "<leader>hg", "<cmd>FzfLua highlights<CR>" },
    { 'n', "<leader>ft", ":lua require('telescope.builtin').live_grep({type_filter = 'js'})" }, -- fix this
    { 'v', "<leader>fw", ":FzfLua grep_visual<CR>" },
    { 'n', "<leader>ff", ":lua SEARCH_GIT_FILES()<CR>" },
    { 'n', "<leader>mm", "<cmd>FzfLua marks<CR>" },
    { 'n', "<leader>cc", ":FzfLua command_history<CR>" },
    { 'n', "<leader>tt", ":FzfLua builtin<CR>" },
    { 'n', "<leader>ld", ":FzfLua diagnostics_workspace<CR>" },
    { 'n', "<leader>jl", ":FzfLua jumps<CR>" },
    { 'n', "<leader>rg", ":FzfLua registers<CR>" },
    { 'n', "<leader>bb", ":FzfLua blines<CR>" },
    { 'n', "<M-f>", ":lua SEARCH_GIT_FILES()<CR>" },

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
    { 'n', "<M-1>", ":lua require('harpoon.ui').nav_file(1)<CR>"},
    { 'n', "<M-2>", ":lua require('harpoon.ui').nav_file(2)<CR>"},
    { 'n', "<M-3>", ":lua require('harpoon.ui').nav_file(3)<CR>"},
    { 'n', "<M-4>", ":lua require('harpoon.ui').nav_file(4)<CR>"},
    { 'n', "<M-5>", ":lua require('harpoon.ui').nav_file(5)<CR>"},
    { 'n', "<M-6>", ":lua require('harpoon.ui').nav_file(6)<CR>"},
    { 'n', "<M-7>", ":lua require('harpoon.ui').nav_file(7)<CR>"},
    { 'n', "<M-8>", ":lua require('harpoon.ui').nav_file(8)<CR>"},
    { 'n', "<M-9>", ":lua require('harpoon.ui').nav_file(9)<CR>"},

    { 'n', "1<space>", ":lua OPEN_TERMINAL(1)<CR>"},
    { 'n', "2<space>", ":lua OPEN_TERMINAL(2)<CR>"},
    { 'n', "3<space>", ":lua OPEN_TERMINAL(3)<CR>"},
    { 'n', "4<space>", ":lua OPEN_TERMINAL(4)<CR>"},
    { 'n', "5<space>", ":lua OPEN_TERMINAL(5)<CR>"},
    { 'n', "6<space>", ":lua OPEN_TERMINAL(6)<CR>"},
    { 'n', "7<space>", ":lua OPEN_TERMINAL(7)<CR>"},
    { 'n', "8<space>", ":lua OPEN_TERMINAL(8)<CR>"},
    { 'n', "9<space>", ":lua OPEN_TERMINAL(9)<CR>"},

    -- Misc
    { 't', '<esc>', [[<C-\><C-n>]] },
    -- { 'n', '<leader>w', ':lua WRITE_FILE()<CR>' },
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
    { 'n', '<leader>bd', ':%bd|e#' },
    { 'n', "<leader>cl", "Oconsole.log()<LEFT>" },
    { 'n', '<leader>fl', "O#file: " },
    { 'n', '<leader>w<leader>w', ':lua print("use :w")<CR>' },
    { 'n', '<leader>xx', ':!source ~/.zshrc' },
    { 'n', '<leader>so', ':source ~/.config/nvim/init.lua' },
    { 'n', "<M-j>", ":cnext<CR>zz" },
    { 'n', "<M-k>", ":cprev<CR>zz" },
    { 'n', "<M-x>", ":call setqflist([])" },
    { 'n', "<leader>fz", ":FzfLua " },

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
    { 'n', "<C-i>", "<C-i>zz" },
    { 'n', "<C-o>", "<C-o>zz" },
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

    { 'n', "<leader>sq", ":DBUIToggle<CR>" },
    { 'x', "p", "P" },
    { 'n', "<C-l>", "mmyyp`mj" },
    { 'n', "<M-l>", "mmyyP`mk" },
    { 'n', "<leader><space>", ":<C-f>i!" },
    { 'n', "<leader>op", ":e!<CR>" },
    { 'n', "<M-t>", "df<space>ea <C-[>px2B" },
    { 'n', "<C-M-j>", "mmo`m" },
    { 'n', "<C-M-k>", "mmO`m" },
    { 'n', "<leader>x", "*``cgn" },
    { 'n', "<leader>X", "#``cgn" },
    { 'n', "<M-c>", ":TSContext toggle<CR>" },
    { 'n', "<leader>sh", ":set shiftwidth=" },

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
