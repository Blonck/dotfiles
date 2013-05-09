" enables pathogen, plugin which make it possible to install all plugins/addons
" under .vim/bundle in own subdirs
" must be loaded at first
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

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
set wildignore=*.o,*.swp,*pyc 	" ignoring file extensions
set wildmode=list:full "complete word until longest match
set noerrorbells 		" don't beep
set nobackup				" no backup files
set browsedir=current		" which directory to use for the file browser
set tags+=~/.vim/tags/cpp	" set tags directory
"set foldmethod=syntax		" set folding method to syntax
set mouse=a					" enables mouse in all modes

" spell
setlocal spell spelllang=en_us

syntax spell toplevel
set nospell

" folding
highlight folded guibg=purple4 guifg=white
set foldnestmax=3

" mark the 81 character in each line
highlight OverLength ctermbg=white ctermfg=red
match OverLength '\%81v.'

" enables syntax highliting if existing
if has("syntax")
  syntax on
endif

" clangcomplete setting
let g:clang_use_library=1
let g:clang_user_options = '-std=c++11'
let g:clang_complete_auto=0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'snipmate'
let g:snippets_dir='~/.vim/snippets-snipmate/'

" VimOrganizer settings
let g:ft_irgnore_pat = '\.org'
let g:org_command_for_emacsclient = 'emacsclient'

if has("autocmd")
  " enable detecting filetypes
  filetype plugin indent on

  " vimOrganizer
  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
  au BufEnter *.org call org#SetOrgFileType()

  " new c++11 syntax
  " au BufNewFile,BufRead *.cpp set syntax=cpp11
  " au BufNewFile,BufRead *.hpp set syntax=cpp11
  " set comment to doxystyle format
  autocmd Filetype c,cpp,hpp set comments^=:///

  " indenting for python files
  au FileType python setlocal tabstop=4 expandtab smarttab shiftwidth=2 softtabstop=2 foldmethod=indent

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
