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
    -- Detect tabstop and shiftwidth automatically
    'NMAC427/guess-indent.nvim',

    -- highlight common writing problems
    "davidbeckingsale/writegood.vim",

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-symbols.nvim",
        },
        config = function()
          local action_layout = require('telescope.actions.layout')

          require('telescope').setup{
            defaults = {
              path_display = { "shorten=2" },
              layout_strategy = "vertical",
              layout_config = {
                width = 0.95,
                height = 0.9,
              },
              sorting_strategy = "ascending",
              file_ignore_patterns = { "node_modules", ".git/", "%.o" },
              cycle_layout_list = { "vertical", "horizontal" },
              mappings = {
                i = {
                  ["<C-p>"] = action_layout.cycle_layout_next,
                },
                n = {
                  ["<C-p>"] = action_layout.cycle_layout_next,
                },
              },
            },
          }
        end
    },

    -- LSP Plugins

    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },

    -- Main LSP Configuration -- taken from kickstart.nvim
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'mason-org/mason.nvim', opts = {} },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },

        -- Allows extra capabilities provided by blink.cmp
        {
          'saghen/blink.cmp',
          version = '1.*',
          opts = {
            keymap = { preset = 'default' },
            appearance = {
              nerd_font_variant = 'mono'
            },
            fuzzy = { implementation = "prefer_rust" },
            sources = {
              default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
          },
        },
      },
      config = require('core/lsp'),
    },

    -- Collection of various small independent plugins/modules
    {
      'echasnovski/mini.nvim',
      config = function()
        -- Simple and easy statusline.
        local statusline = require('mini.statusline').setup({
          use_icons = vim.g.have_nerd_font
        })

        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        -- require('mini.ai').setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        -- require('mini.surround').setup()

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
      end
    },

    -- work with git
    {
        "tpope/vim-fugitive",
        -- event = "User InGitRepo",
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
        require("gitsigns").setup{
          signcolumn = false,
          current_line_blame = false,
          current_line_blame_opts = {
            delay = 50
          }
        }
      end
    },

    -- terminal
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("toggleterm").setup{
          open_mapping = "<F5>",
          direction = 'float'
        }
      end
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
    {
        "EdenEast/nightfox.nvim",
    }

    ---- status bar
    ---- {
    ----     "freddiehaddad/feline.nvim",
    ----     opts = {},
    ---- }
})
