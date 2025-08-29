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

    use 'rose-pine/neovim'
    use "catppuccin/nvim"

    -- both those for one theme 
    use 'rktjmp/lush.nvim' 
    use 'metalelf0/jellybeans-nvim'

    use 'nvim-treesitter/nvim-treesitter'

    use 'frabjous/knap'
    use 'neovim/nvim-lspconfig'
    use "folke/tokyonight.nvim"
    use {
	'xeluxee/competitest.nvim',
	requires = 'MunifTanjim/nui.nvim',
    }
    use 'ray-x/lsp_signature.nvim'
    use 'eandrju/cellular-automaton.nvim' 
    use "calind/selenized.nvim"
    use 'L3MON4D3/LuaSnip'
    use 'iamcco/markdown-preview.nvim'
    use 'ThePrimeagen/vim-be-good'
    use "nvim-tree/nvim-tree.lua"
    use "ellisonleao/gruvbox.nvim" 

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
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
	requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
	config = function()
	    require('render-markdown').setup({})
	end,
    })
    use 'numToStr/FTerm.nvim'
    use {
	'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'dylanaraps/wal.vim'
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use{
	'folke/noice.nvim',
	requires = {
	    "MunifTanjim/nui.nvim",
	    "rcarriga/nvim-notify",  -- optional, used if you want notifications
	}
    }

end)
