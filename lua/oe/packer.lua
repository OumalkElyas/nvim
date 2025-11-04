-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { 
	'rose-pine/neovim',
	'catppuccin/nvim',
	'calind/selenized.nvim',
	'dylanaraps/wal.vim',
	'ellisonleao/gruvbox.nvim', 
	'folke/tokyonight.nvim',
	'AlphaTechnolog/pywal.nvim', as = 'pywal',
	-- both those for one theme 
	'rktjmp/lush.nvim',
	'metalelf0/jellybeans-nvim'
    }

    use {
	'neovim/nvim-lspconfig',
	'ray-x/lsp_signature.nvim'
    }
    use "williamboman/mason.nvim"
   

    use {
	"tpope/vim-dadbod",           -- main database plugin
	"kristijanhusak/vim-dadbod-ui" -- optional UI for queries
    }
    use { -- useless
	'eandrju/cellular-automaton.nvim',
	'ThePrimeagen/vim-be-good'
    }
    use {
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-nvim-lsp',
	'saadparwaiz1/cmp_luasnip'
    }
    use {
	'xeluxee/competitest.nvim',
	'MunifTanjim/nui.nvim',
	'folke/noice.nvim',
	"rcarriga/nvim-notify"  -- optional, used if you want notifications
    }

    use 'nvim-treesitter/nvim-treesitter'
    use 'L3MON4D3/LuaSnip'

    use 'frabjous/knap'
    use 'iamcco/markdown-preview.nvim'
    use "nvim-tree/nvim-tree.lua"

    
    ------ need to be configured
    use {
	'numToStr/Comment.nvim',
	config = function()
	    require('Comment').setup()
	end
    }
    use({
	'MeanderingProgrammer/render-markdown.nvim',
	after = { 'nvim-treesitter' },
	requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
	config = function()
	    require('render-markdown').setup({})
	end,
    })
    use 'numToStr/FTerm.nvim'
    use 'nvim-lualine/lualine.nvim'

    use {'akinsho/bufferline.nvim', tag = "*"}
    use 'nvim-tree/nvim-web-devicons'
    use "NStefan002/speedtyper.nvim"

end)
