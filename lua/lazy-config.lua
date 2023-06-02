local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  	vim.fn.system({
    	"git",
    	"clone",
    	"--filter=blob:none",
    	"https://github.com/folke/lazy.nvim.git",
    	"--branch=stable", -- latest stable release
    	lazypath,
  	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'kyazdani42/nvim-web-devicons',
  	'nvim-lua/plenary.nvim',
  	-- 'MunifTanjim/nui.nvim',
  	'lewis6991/impatient.nvim',
  	-- { 'nvim-lualine/lualine.nvim', dependencies = {'kyazdani42/nvim-web-devicons', opt = false} },
  	{
  	  	"kylechui/nvim-surround",
  	  	config = function()
  	  	  	require("nvim-surround").setup({
  	  	  		tag = "*", --  for stability; omit to use `main` branch for the latest features
     		})
     	end
  	},
	{
  	  	'nvim-telescope/telescope.nvim', tag = '0.1.0',
  	  	dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
    	'numToStr/Comment.nvim',
    	config = function()
        	require('Comment').setup()
    	end
	},
	-- 'JoosepAlviste/nvim-ts-context-commentstring',
	{"akinsho/toggleterm.nvim", config = function()
  	  	require("toggleterm").setup()
		end
	},
	{
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	},
	{ 'lewis6991/gitsigns.nvim' },
	-- {
 -- 	   	'goolord/alpha-nvim',
 -- 	   	config = function ()
 -- 	       	require'alpha'.setup(require'alpha.themes.dashboard'.config)
 -- 	   	end
	-- },
	{
  	  	'nvim-tree/nvim-tree.lua',
  	  	tag = 'nightly' -- optional, updated every week. (see issue #1193)
	},
	'mg979/vim-visual-multi',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/cmp-nvim-lsp',
	{"L3MON4D3/LuaSnip"},
	'rafamadriz/friendly-snippets',
   	{
      	'nvim-treesitter/nvim-treesitter',
      	build = ':TSUpdate'
   	},
	'nvim-treesitter/playground',
	'neovim/nvim-lspconfig',
	"williamboman/mason.nvim",
	{'akinsho/bufferline.nvim', dependencies = 'kyazdani42/nvim-web-devicons'},
	'jose-elias-alvarez/null-ls.nvim',
	'MunifTanjim/prettier.nvim',
   	"lukas-reineke/indent-blankline.nvim",
   	"tpope/vim-fugitive",
	"ggandor/leap.nvim",
	-- "mrjones2014/nvim-ts-rainbow",
	-- ({
 --  	  	"utilyre/barbecue.nvim",
 --  	  	dependencies = {
 --    	 	"SmiteshP/nvim-navic",
 -- 			'kyazdani42/nvim-web-devicons', -- optional dependency
 --  	  	},
 --  	  	config = function()
 --    	 	require("barbecue").setup()
 --  	  	end,
	-- }),
    ({
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }),
    'jwalton512/vim-blade',

	-- "sainnhe/gruvbox-material",
	"sainnhe/sonokai",
    -- 'navarasu/onedark.nvim'

})
