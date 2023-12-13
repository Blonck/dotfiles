set backspace=2
set hidden                              " hide buffers instead of closing
set nowrap                              " don't wrap lines
set tabstop=4                           " a tab is four spaces
set autoindent                          " set autoindenting on
set copyindent                          " copy the previous indentation on autoindenting
set shiftwidth=4                        " number of spaces for autoindenting
set smarttab                            " insert tabs, not tabstops
set expandtab                           " expand tabs to spaces
set smartcase                           " ignore case if pattern is all lowercase
set number                              " show line numbers
set showmatch                           " show matching parenthesis
set hlsearch                            " highlighting search terms
set incsearch                           " incremental search
set history=1000                        " bigger search and commands history
set undolevels=1000                     " much more undo levels
set wildignore=*.o,*.swp,*.pyc          " ignoring file extensions
set wildignore+=*/.git/*                " ignore git folder
set wildmode=list:full                  " complete word until longest match
set visualbell
set noerrorbells                        " don't beep
set nobackup                            " no backup files
set browsedir=current                   " which directory to use for
set tags+=~/.vim/tags/cpp               " set tags directory
set mouse=a                             " enables mouse in all modes
set autoread                            " automatically refresh files

" spell
set nospell
setlocal spell spelllang=en_us

" folding
highlight folded guibg=purple4 guifg=white
set foldnestmax=3

" list trailing spaces and tabs
set listchars=tab:▸\ ,trail:·
set list

" change the mapleader to ,
let mapleader=","

" Git grep
nnoremap <leader>g :Ggrep! <cword><CR>

" own mappings
:nnoremap <C-n> :cn <CR>
:nnoremap <Leader>r :%s/<C-r><C-w>/<C-r><C-w>
:nnoremap <Leader>d :tabnext<CR>
:nnoremap <Leader>a :tabprevious<CR>
:inoremap <Leader>a <Esc>:tabnext<CR><i>
:inoremap <Leader>d <Esc>:tabprevious<CR><i>

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if has("autocmd")
  " enable detecting filetypes
  filetype plugin indent on

  augroup latex_macros " {
    autocmd!
    " LaTeX (rubber) macro
    autocmd FileType tex :nnoremap <leader>c :w<CR>!rubber --pdf --warn all %<CR>
    autocmd FileType tex :nnoremap <leader>v :!qpdfview %:r.pdf &<CR><CR>
  augroup END "}

  " set gnuplot syntax for files ending with .plt
  au BufRead,BufNewFile *.plt setfiletype gnuplot

  " key mappings for c/c++
  " set comment to doxystyle format
  au FileType c,cpp,hpp setlocal comments^=:///
  " toggle to header and back
  au FileType c,cpp,hpp map <C-Tab> :A<CR>


  " when editing python files
  au FileType python setlocal tabstop=4 expandtab smarttab shiftwidth=4 softtabstop=4
  "au FileType python setlocal foldmethod=indent
  au FileType python highlight Excess ctermbg=DarkGrey guibg=red
  au FileType python set nowrap

  " Uncomment the following to have Vim jump to the last position when
  " reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " set working directory to git root or dir of current file for all buffers
  autocmd BufEnter * if expand('%:p') !~ '://' | :lchdi %:p:h | endif

  " automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set complete =.,w,b,u,k,t
  set completeopt=menu,longest,preview
endif
