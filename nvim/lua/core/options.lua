local set = vim.opt

-- disable netrw for nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_winsize = 30
vim.g.python3_host_prog = "/usr/bin/python3"

-- general
set.mouse = 'a'                 -- enable mouse support
set.clipboard = 'unnamedplus'   -- enable system clipboard
-- set.autochdir = true            -- change into dir of current file

-- ignore files
set.wildignore = {'*.o' , '*.swp' , '*.pyc'} 
set.wildignore:append('*/.git/*')

-- autocomplete options
set.complete = {'.', 'w' ,' b' ,' u' , 'k', 't'}
set.completeopt = {'longest' , 'menuone' , 'preview'}


-- UI
set.number = true           -- show line number
set.relativenumber = true   -- relative line number
set.showmatch = true        -- highlight matching parenthesis
set.visualbell = true       -- enable visual bell
set.wrap = false            -- disable line wrapping
set.ignorecase = true       -- ignore case when searching
set.smartcase = true        -- ignore case for pattern
set.termguicolors = true    -- enable 24-bit colors
set.splitbelow = true       -- horizontal split below
set.splitright = true       -- vertical split to the right
set.spell = true            -- enable spell checking
set.scrolloff = 5
set.list = true
set.listchars = 'tab:>-,trail:·'


-- indentation
set.expandtab = true    -- spaces instead on tabs
set.tabstop = 4         -- 1 tab == 4 spaces
set.softtabstop = 4     --
set.shiftwidth = 4      -- 4 spaces when tab
set.smartindent = true  -- autoindent new lines

-- history
set.history = 1000
set.hlsearch = true                                 -- highlight search terms
set.incsearch = true
set.ignorecase = true
set.undolevels = 1000
set.swapfile = false                                -- disable swapfiles
set.backup = false                                  -- disable backup
set.undodir = os.getenv("HOME") .. "/.vim/undodir"   -- specify undo directory
set.undofile = true                                 -- enable undo files



-- background
set.hidden = true       -- enable background buffers
set.lazyredraw = true   -- for faster scrolling
set.synmaxcol = 240     -- disable syntax highlighting after 240
set.updatetime = 100    -- time to wait before trigger to event
