local packer = require("packer")
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Color scheme
    use 'folke/tokyonight.nvim'
    use 'sainnhe/sonokai'

    -- Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- Tab pages
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = {
            'kyazdani42/nvim-web-devicons',
            'moll/vim-bbye',
        },
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Project management
    use { 'ahmedkhalf/project.nvim' }

    -- Syntax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- LSP
    use { "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" }
    use { "neovim/nvim-lspconfig" }

    -- Completion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/vim-vsnip" }
    use { "hrsh7th/cmp-vsnip" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "rafamadriz/friendly-snippets" }

    -- Inden blankline
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Formatter
    use { "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" }

    -- Debugger
    use { "puremourning/vimspector" }
end)

-- Auto install plugins when saving the plugins.lua
pcall(
    vim.cmd,
    [[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
        augroup end
    ]]
)
