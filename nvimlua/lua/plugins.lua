local ok, packer = pcall(require, 'packer')
if not ok then return end

packer.startup(function()
    -- packer
    use 'wbthomason/packer.nvim'

    -- plenary
    use 'nvim-lua/plenary.nvim'

    -- themes
    use 'relastle/bluewery.vim'
    use 'EdenEast/nightfox.nvim'

    -- lsp support
    use 'neovim/nvim-lspconfig'
    use {'williamboman/nvim-lsp-installer', config = function() require('lsp_installer') end}

    use {
        'hrsh7th/nvim-cmp',
        config = function() require('nvim_cmp') end,
        requires = {
            'hrsh7th/vim-vsnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp'
        }
    }

    -- syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter') end,
        run = ':TSUpdate'
    }

    -- navigation
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('tree') end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('nvim_telescope') end,
        requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'}
    }

    -- ui
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup({
          options = { theme = 'nightfox' }
        }) end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- use {'glepnir/lspsaga.nvim', config = function() require('saga').init_lsp_saga() end}

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup({}) end,
        requires = {'nvim-lua/plenary.nvim'},
        tag = 'release'
    }

    -- java
    use 'mfussenegger/nvim-jdtls'
end)

vim.cmd[[colorscheme nightfox]]
