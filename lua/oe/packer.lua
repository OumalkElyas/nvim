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
	config = function() require('competitest').setup() end
    }
    use 'ray-x/lsp_signature.nvim'
    use 'eandrju/cellular-automaton.nvim' 
    use "calind/selenized.nvim"
    use 'L3MON4D3/LuaSnip'
    use {'iamcco/markdown-preview.nvim'}
    use {'ThePrimeagen/vim-be-good'}
    use({
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	requires = {
	    "nvim-lua/plenary.nvim",
	    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	    "MunifTanjim/nui.nvim",
	    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	}
    })
    use "ellisonleao/gruvbox.nvim" 

end)
