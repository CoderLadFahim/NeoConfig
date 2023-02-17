local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then
	return
end

packer.startup(function(use)
  	use 'wbthomason/packer.nvim'
  	use 'nvim-tree/nvim-web-devicons'
  	use 'nvim-lua/plenary.nvim'
  	use 'MunifTanjim/nui.nvim'
  	use 'lewis6991/impatient.nvim'
  	use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = false} }
  	use({
  	  	"kylechui/nvim-surround",
  	  	config = function()
  	  	  	require("nvim-surround").setup({
  	  	  		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
     		})
     	end
  	})
	use {
  	  	'nvim-telescope/telescope.nvim', tag = '0.1.0',
  	  	requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- use "terrortylor/nvim-comment"
	use {
    	'numToStr/Comment.nvim',
    	config = function()
        	require('Comment').setup()
    	end
	}
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  	  	require("toggleterm").setup()
		end
	}
	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
	use { 'lewis6991/gitsigns.nvim' }
	use {
    	'goolord/alpha-nvim',
    	config = function ()
        	require'alpha'.setup(require'alpha.themes.dashboard'.config)
    	end
	}
	use {
  	  	'nvim-tree/nvim-tree.lua',
  	  	tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'

	use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
	use 'rafamadriz/friendly-snippets'
   	use {
      	'nvim-treesitter/nvim-treesitter',
      	run = ':TSUpdate'
   	}

	use 'neovim/nvim-lspconfig'
	use "williamboman/mason.nvim"
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use('jose-elias-alvarez/null-ls.nvim')
	use('MunifTanjim/prettier.nvim')
   	use "lukas-reineke/indent-blankline.nvim"
   	use "tpope/vim-fugitive"
   	use "rose-pine/neovim"
	use "ellisonleao/gruvbox.nvim"
	use "sainnhe/sonokai"
	use "ggandor/leap.nvim"
	use({
  	  	"utilyre/barbecue.nvim",
  	  	tag = "*",
  	  	requires = {
    	 	"SmiteshP/nvim-navic",
    	 	"nvim-tree/nvim-web-devicons", -- optional dependency
  	  	},
  	  	after = "nvim-web-devicons", -- keep this if you're using NvChad
  	  	config = function()
    	 	require("barbecue").setup()
  	  	end,
	})
end)
