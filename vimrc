" enables vundle
set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'c.vim'
Bundle 'UltiSnips'
Bundle 'tpope/vim-fugitive'
Bundle 'chrisbra/SudoEdit.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'klen/python-mode'
Bundle 'davidbeckingsale/writegood.vim'
" Bundle 'hsitz/VimOrganizer'
Bundle 'vim-startify'

filetype plugin indent on " required!

" change the mapleader to ,
let mapleader=","

set hidden					" hide buffers instead of closing
set nowrap					" don't wrap lines
set tabstop=2				" a tab is four spaces
set autoindent			" set autoindenting on
set copyindent			" copy the previous indentation on autoindenting
set shiftwidth=2 		" number of spaces for autoindenting
set smarttab				" insert tabs, not tabstops
set expandtab				" expand tabs to spaces
set smartcase				" ignore case if pattern is all lowercase
set number					" show line numbers
set showmatch				" show matching paranthesis
set hlsearch				" highliting search terms
set incsearch				" incrementell search
set history=1000 		" bigger search and commands history
set undolevels=1000 " much more undo levels
set wildignore=*.o,*.swp,*.pyc 	" ignoring file extensions
set wildmode=list:full "complete word until longest match
set visualbell
set noerrorbells 		" don't beep
set nobackup				" no backup files
set browsedir=current		" which directory to use for
set tags+=~/.vim/tags/cpp	" set tags directory
set mouse=a					" enables mouse in all modes

if has('gui_running')
  colorscheme desert
endif

" spell
setlocal spell spelllang=en_us

syntax spell toplevel
set nospell

" folding
highlight folded guibg=purple4 guifg=white
set foldnestmax=3

" enables syntax highliting if existing
if has("syntax")
  syntax on
endif

" c.vim settings

" UltiSnips setting
set runtimepath+=~/.vim/my-snippets/
let g:UltiSnipsSnippetsDir='~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories=["my-snippets"]
let g:UltiSnipsEditSplit='vertical'

" clang_format mapping
map <C-K> :pyf ~/.vim/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/.vim/clang-format.py<CR>i

" clang_complete setting
let g:clang_user_options='|| exit 0'
let g:clang_auto_select = 1
let g:clang_use_library = 1
let g:clang_user_options = '-std=c++11'
let g:clang_library_path = '/usr/local/lib/'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_hl_errors = 1

" VimOrganizer settings
let g:ft_irgnore_pat = '\.org'
let g:org_command_for_emacsclient = 'emacsclient'

" pymode options
let g:pymode_lint_minheight = 3
let g:pymode_lint_maxheight = 8
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_lint_message = 1
let g:pymode_lint_ignore = "E501, C901"

" startify
let g:startify_files_number = 20


if has("autocmd")
  " enable detecting filetypes
  filetype plugin indent on

  " vimOrganizer
  " au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
  " au BufEnter *.org call org#SetOrgFileType()

  " new c++11 syntax
  " au BufNewFile,BufRead *.cpp set syntax=cpp11
  " au BufNewFile,BufRead *.hpp set syntax=cpp11
  " set comment to doxystyle format
  au FileType c,cpp,hpp setlocal comments^=:///

  " when editing python files
  au FileType python setlocal tabstop=8 expandtab smarttab shiftwidth=4 softtabstop=4
  au FileType python setlocal foldmethod=indent
  au FileType python highlight Excess ctermbg=DarkGrey guibg=red
  au FileType python match Excess /\%100v.*/
  au FileType python set nowrap


  " Uncomment the following to have Vim jump to the last position when
  " reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " The current directory is the directory of the file in the current window.
  autocmd BufEnter * :lchdir %:p:h

  " automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set complete =.,w,b,u,k,t
  set completeopt=menu,longest,preview
endif
