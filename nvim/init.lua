require('settings')

require('plugins')
require('plugins.nvim-tree-config')
require('plugins.ultisnips-config')
require('plugins.mason-config')
require('plugins.nvim-treesitter-config')
require('plugins.telescope-config')

require('lsp-config')
require('lsp-config.completion')
require('mappings')

-- load colorscheme
require('nightfox').load('nordfox')
