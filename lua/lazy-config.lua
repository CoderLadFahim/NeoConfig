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
	'mg979/vim-visual-multi',
	'lewis6991/gitsigns.nvim',
    'ThePrimeagen/harpoon',
    'norcalli/nvim-colorizer.lua',
    'vimwiki/vimwiki',
    'protex/better-digraphs.nvim',


    -- 'akinsho/git-conflict.nvim',
    -- 'zacanger/angr.vim',
    'navarasu/onedark.nvim',
    -- 'mofiqul/vscode.nvim',
    -- 'folke/tokyonight.nvim',
    'rose-pine/neovim',
    -- 'EdenEast/nightfox.nvim',
    -- 'Pocco81/auto-save.nvim',
    -- 'blazkowolf/gruber-darker.nvim',
    -- "ibhagwan/fzf-lua",
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
    -- 'ellisonleao/gruvbox.nvim',
    -- 'marko-cerovac/material.nvim',
    -- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
  	{ 'kylechui/nvim-surround', config = function() require('nvim-surround').setup({ tag = '*', }) end },
	{ 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
	{ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end },
    { 'stevearc/oil.nvim' },
   	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context' },
   	{ 'lukas-reineke/indent-blankline.nvim', commit = '9637670'},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
    'rebelot/kanagawa.nvim',
    'jwalton512/vim-blade',
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        -- config = function()
        --     require("copilot").setup({})
        -- end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            -- See Configuration section for options
        },
    }
}

if ENABLE_ICONS() then
    table.insert(plugins, 1, 'kyazdani42/nvim-web-devicons')
end

require('lazy').setup(plugins, options)
