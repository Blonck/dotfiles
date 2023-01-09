local set = vim.opt

set.hidden = true
set.wrap = false
set.fileencoding = 'utf-8'
set.browsedir = 'current'

set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.copyindent = true

set.history = 1000
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.undolevels = 1000

set.wildignore = {'*.o' , '*.swp' , '*.pyc'}
set.wildignore:append('*/.git/*')

set.number = true
set.showmatch = true
set.splitbelow = true
set.splitright = true
set.scrolloff = 5
set.termguicolors = true
set.visualbell = true

set.mouse = 'a'
set.clipboard = 'unnamedplus'

set.complete = {'.', 'w' ,' b' ,' u' , 'k', 't'}
set.completeopt = {'longest' , 'menuone' , 'preview'}

set.spell = true
set.list = true
set.listchars = 'tab:>-,trail:·'

local api = vim.api

-- go to last location when opening a buffer
api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- set working directory to current directory for all buffers
--api.nvim_create_autocmd(
--  "BufReadPost",
--  { command = [[if expand('%:p') !~ '://' | :lchdi %:p:h | endif]] }
--)

--[[

#    set wildmode=list:full                  " complete word until longest match
#    set tags+=~/.vim/tags/cpp               " set tags directory
#    set updatetime=300                      " for coc diagnostic messages
#    set clipboard+=unnamedplus

--]]

