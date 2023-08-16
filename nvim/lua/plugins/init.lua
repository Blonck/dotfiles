return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'EdenEast/nightfox.nvim'

    use 'mhinz/vim-startify'

    use     'davidbeckingsale/writegood.vim'

    -- file browser
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'

    -- fuzzy finding files
    use 'kien/ctrlp.vim'

    -- lsp
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- autocomplition
    use 'hrsh7th/nvim-cmp'     -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'SirVer/UltiSnips'     -- UltiSnips plugin
    use "quangnguyen30192/cmp-nvim-ultisnips" -- UltiSnips nvim-cmp 
    use "onsails/lspkind-nvim"

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- vim git integration
    use 'tpope/vim-fugitive'
    -- with branches
    use 'sodapopcan/vim-twiggy'
    -- commit browser
    use 'junegunn/gv.vim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- floating terminal
    use 'voldikss/vim-floaterm'


    --use({
    --    "jackMort/ChatGPT.nvim",
    --    config = function()
    --        require("chatgpt").setup({
    --        -- optional configuration
    --        })
    --    end,
    --    requires = {
    --    "MunifTanjim/nui.nvim",
    --    "nvim-lua/plenary.nvim",
    --    "nvim-telescope/telescope.nvim"
    --}
    --})
end)
