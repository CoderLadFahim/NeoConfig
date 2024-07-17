local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim' if not vim.loop.fs_stat(lazypath) then
  	vim.fn.system({
    	'git',
    	'clone',
    	'--filter=blob:none',
    	'https://github.com/folke/lazy.nvim.git',
    	'--branch=stable', -- latest stable release
    	lazypath,
  	})
end
vim.opt.rtp:prepend(lazypath)

local options = {
    defaults = {
        lazy = false
    },
    ui = {
        icons = {
            cmd = '⌘',
            config = '',
            event = '',
            ft = '',
            init = '',
            keys = '',
            plugin = '',
            runtime = '',
            source = '',
            start = '',
            task = '',
            lazy = ' ',
        }
    }
}

local plugins = {
  	'nvim-lua/plenary.nvim',
	'JoosepAlviste/nvim-ts-context-commentstring',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/cmp-nvim-lsp',
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'nvimtools/none-ls.nvim',
	'MunifTanjim/prettier.nvim',
   	'tpope/vim-fugitive',
	'ggandor/leap.nvim',
    'sindrets/diffview.nvim',
    'akinsho/git-conflict.nvim',
	'mg979/vim-visual-multi',
    -- 'j-morano/buffer_manager.nvim',
	'lewis6991/gitsigns.nvim',
    'navarasu/onedark.nvim',
    -- 'ellisonleao/gruvbox.nvim',
    -- 'rebelot/kanagawa.nvim',
    'ThePrimeagen/harpoon',
    'jwalton512/vim-blade',
    -- 'slugbyte/lackluster.nvim',

    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 0
        end,
    },

  	{ 'kylechui/nvim-surround', config = function() require('nvim-surround').setup({ tag = '*', }) end },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { {'nvim-lua/plenary.nvim'} } },
	{ 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
	-- { 'akinsho/toggleterm.nvim', config = function() require('toggleterm').setup() end },
	{ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end },
	-- { 'nvim-tree/nvim-tree.lua', tag = 'nightly' },
    { 'stevearc/oil.nvim' },
   	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    -- { 'glepnir/lspsaga.nvim', event = 'LspAttach' }, 
   	{ 'lukas-reineke/indent-blankline.nvim', commit = '9637670'},
    { 'iamcco/markdown-preview.nvim', build = function() vim.fn['mkdp#util#install']() end },

}

if ENABLE_ICONS() then
    table.insert(plugins, 1, 'kyazdani42/nvim-web-devicons')
end

require('lazy').setup(plugins, options)
