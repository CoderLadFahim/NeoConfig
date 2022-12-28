local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q!', opts)
keymap('n', '<leader>src', ':luafile %', opts)
keymap('n', '<leader>v', '<C-v>', opts)

-- Better tab controls
keymap('n', '<leader>tn', ':tabedit<cr>', opts)
keymap('n', '<leader>tq', ':tabclose!<cr>', opts)
keymap('n', '<leader>taq', ':tabonly!<cr>', opts)
-- keymap('n', '}', ':BufferLineCycleNext<cr>', opts)
-- keymap('n', '{', ':BufferLineCyclePrev<cr>', opts)
-- keymap('n', '<leader>bp', ':BufferLinePick<cr>', opts)

keymap('n', '<leader>fr', ':%s/', opts)

-- Packer controls
keymap('n', '<leader>pc', '<cmd>PackerClean<cr>', opts)
keymap('n', '<leader>pc', '<cmd>PackerInstall<cr>', opts)
keymap('n', '<leader>ps', '<cmd>PackerSync<cr>', opts)

keymap('n', "<leader>hh","<C-w>h", opts)
keymap('n', "<leader>jj","<C-w>j", opts)
keymap('n', "<leader>kk","<C-w>k", opts)
keymap('n', "<leader>ll","<C-w>l", opts)

keymap('n', "<leader>HH", "<cmd>vertical resize +2<CR>", opts)
keymap('n', "<leader>JJ", "<cmd>resize +2<CR>", opts)
keymap('n', "<leader>KK", "<cmd>resize -2<CR>", opts)
keymap('n', "<leader>LL", "<cmd>vertical resize -2<CR>", opts)

-- Nvim tree mappings
keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>tf', ':NvimTreeFindFile<CR>', opts)
keymap('n', '<leader>fc', ':NvimTreeCollapse<CR>', opts)

-- Telescope mappings
keymap('n', "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap('n', "<leader>fg", "<cmd>Telescope git_files<CR>", opts)
keymap('n', "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)

-- Toggleterm mappings
keymap('n', "<leader>lg", "<cmd>lua LAZYGIT_TOGGLE()<CR>", opts)
keymap('n', "<leader>nd", "<cmd>lua NODE_TOGGLE()<CR>", opts)
keymap('n', "<leader>tk", "<cmd>lua ARTISAN_TOGGLE()<CR>", opts)


-- git mappings
keymap('n', "<leader>ga.", ":G add .", opts)
keymap('n', "<leader>gs", ":G status", opts)
keymap('n', "<leader>glo ", ":G log --oneline", opts)
keymap('n', "<leader>gcm", ":G commit -m ", opts)
keymap('n', "<leader>gcam", ":G commit --amend -m", opts)
keymap('n', "<leader>gr.", ":G restore .", opts)

keymap('n', "<C-d>", "<C-d>zz", opts)
keymap('n', "<C-u>", "<C-u>zz", opts)
keymap('n', "<C-f>", "<C-f>zz", opts)
keymap('n', "<C-b>", "<C-b>zz", opts)
