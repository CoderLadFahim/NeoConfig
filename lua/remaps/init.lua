local opts = { noremap = true, silent = false }

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q!', opts)
vim.api.nvim_set_keymap('n', '<leader>src', ':luafile %', opts)
vim.api.nvim_set_keymap('n', '<leader>v', '<C-v>', opts)
vim.api.nvim_set_keymap('n', '<leader>fv', ':file<cr>', opts)

-- Better tab controls
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabedit<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>tq', ':tabclose!<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>taq', ':tabonly!<cr>', opts)
vim.api.nvim_set_keymap('n', '}', ':BufferLineCycleNext<cr>', opts)
vim.api.nvim_set_keymap('n', '{', ':BufferLineCyclePrev<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLinePick<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>bq', ':b#|bd#', opts)
vim.api.nvim_set_keymap('n', '<leader>br', ':BufferLineCloseRight', opts)
vim.api.nvim_set_keymap('n', '<leader>bl', ':BufferLineCloseLeft', opts)

vim.api.nvim_set_keymap('n', '<leader>fr', ':%s/', opts)

vim.api.nvim_set_keymap('n', '<leader>taa', ':ToggleTermToggleAll<CR>', opts)
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)

vim.api.nvim_set_keymap('n', "<leader>hh","<C-w>h", opts)
vim.api.nvim_set_keymap('n', "<leader>jj","<C-w>j", opts)
vim.api.nvim_set_keymap('n', "<leader>kk","<C-w>k", opts)
vim.api.nvim_set_keymap('n', "<leader>ll","<C-w>l", opts)

vim.api.nvim_set_keymap('n', "(", "<cmd>vertical resize +2<CR>", opts)
vim.api.nvim_set_keymap('n', "+", "<cmd>resize +2<CR>", opts)
vim.api.nvim_set_keymap('n', "-", "<cmd>resize -2<CR>", opts)
vim.api.nvim_set_keymap('n', ")", "<cmd>vertical resize -2<CR>", opts)

-- Nvim tree mappings
vim.api.nvim_set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fc', ':NvimTreeCollapse<CR>', opts)

-- Telescope mappings
vim.api.nvim_set_keymap('n', "<leader>ff", "<cmd>Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>FF", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)

-- Toggleterm mappings
vim.api.nvim_set_keymap('n', "<leader>lg", "<cmd>lua LAZYGIT_TOGGLE()<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>nd", "<cmd>lua NODE_TOGGLE()<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>tk", "<cmd>lua ARTISAN_TOGGLE()<CR>", opts)


-- git mappings
vim.api.nvim_set_keymap('n', "<leader>ga.", ":G add .", opts)
vim.api.nvim_set_keymap('n', "<leader>gs", ":G status", opts)
vim.api.nvim_set_keymap('n', "<leader>glo", ":G log --oneline ", opts)
vim.api.nvim_set_keymap('n', "<leader>gcm", ':G commit -m ""', opts)
vim.api.nvim_set_keymap('n', "<leader>gcam", ':G commit --amend -m ""', opts)
vim.api.nvim_set_keymap('n', "<leader>gcan", ':G commit --amend --no-edit', opts)
vim.api.nvim_set_keymap('n', "<leader>gr.", ":G restore .", opts)

vim.api.nvim_set_keymap('n', "<C-d>", "<C-d>zz", opts)
vim.api.nvim_set_keymap('n', "<C-u>", "<C-u>zz", opts)
vim.api.nvim_set_keymap('n', "<C-f>", "<C-f>zz", opts)
vim.api.nvim_set_keymap('n', "<C-b>", "<C-b>zz", opts)

-- moving visual blocks
vim.api.nvim_set_keymap('v', "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap('v', "K", ":m '<-2<CR>gv=gv", opts)

-- Keeping the search term in the middle of the screen
vim.api.nvim_set_keymap('n', "n", "nzzzv", opts)
vim.api.nvim_set_keymap('n', "N", "Nzzzv", opts)

-- keeping the yanked content in the register after pasting over
vim.api.nvim_set_keymap('v', "p", "\"_dP", opts)
