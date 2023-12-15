-- install lazy
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

require("lazy").setup({
    -- show recently opened files on startup
    "mhinz/vim-startify",

    -- highlight common writing problems
    "davidbeckingsale/writegood.vim",

    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-symbols.nvim",
        }
    },

    ---- LSP

    -- lsp config
    { "neovim/nvim-lspconfig" },

    -- autocomplete
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "onsails/lspkind-nvim", -- icons for cmp
            "quangnguyen30192/cmp-nvim-ultisnips", -- UltiSnippets cmp source
        }
    },

    -- UltiSnips plugin
    {
        "SirVer/UltiSnips"
    },

    ---- git

    -- work with git
    {
        "tpope/vim-fugitive",
        -- event = "User InGitRepo",
    },

    -- git branches
    {
        "sodapopcan/vim-twiggy",
        lazy = true,
        cmd = { "Twiggy" },
        dependencies = {
            "tpope/vim-fugitive",
        }
    },

    -- history viewer
    {
        "rbong/vim-flog", -- commit history
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",

        }
    },

    -- git decorations
    {
      'lewis6991/gitsigns.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },

    -- terminal
    {
        "akinsho/toggleterm.nvim", version = "*", config = true
    },

    -- tagbar
    {
        "preservim/tagbar",
    },

    -- color scheme
    {
        "navarasu/onedark.nvim",
        lazy = true,
    },

    -- status bar
    -- {
    --     "freddiehaddad/feline.nvim",
    --     opts = {},
    -- }
})
