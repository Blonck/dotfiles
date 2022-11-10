" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" great snippet engine
Plug 'SirVer/UltiSnips'
" git integration
Plug 'tpope/vim-fugitive'
" with branches
Plug 'idanarye/vim-merginal'
" checking for common style mistakes
Plug 'davidbeckingsale/writegood.vim'
" change start screen of vim
Plug 'mhinz/vim-startify'
" NERDTree with tabs
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" coloscheme 
Plug 'altercation/vim-colors-solarized'
" gundo
Plug 'sjl/gundo.vim'
" tex plugin
Plug 'lervag/vimtex'
" expand region
Plug 'terryma/vim-expand-region'
" CtrlP
Plug 'kien/ctrlp.vim'
" switch to header and back
Plug 'vim-scripts/a.vim'

call plug#end()

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

set background=dark
colorscheme solarized

" spell
set nospell
setlocal spell spelllang=en_us

" folding
highlight folded guibg=purple4 guifg=white
set foldnestmax=3

" list trailing spaces and tabs
set listchars=tab:▸\ ,trail:·
set list

" UltiSnips setting
" make vim recognizing snippets dir
set runtimepath+=~/.vim/my-snippets/
" use different snippets dir
let g:UltiSnipsSnippetsDir='~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories=["my-snippets"]
" use vertical split to edit snippets
let g:UltiSnipsEditSplit='vertical'
" trigger snippet with Ctrl-L
let g:UltiSnipsExpandTrigger='<C-l>'
" go to next snippet with Ctrl-j
let g:UltiSnipsJumpForwardTrigger='<C-j>'
" go to previous snippet with Ctrl-k
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" nerdtee toggle
nnoremap <F4> :NERDTreeTabsToggle<CR>
" merginal toggle
nnoremap <F3> :MerginalToggle<CR>

let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabns_open_on_new_tab=0

" toggle background color
call togglebg#map("<F6>")

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

" expand regions
map <leader>b <Plug>(expand_region_expand)
map <leader>B <Plug>(expand_region_shrink)

" startify
let g:startify_files_number = 20

" vimtex
let g:vimtex_fold_automatic = 0

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g_ctrlp_use_caching = 0
endif

"if executable('cquery')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'cquery',
"      \ 'cmd': {server_info->['cquery']},
"      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery' },
"      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"      \ })
"endif

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
  \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
  \}
let g:LanguageClient_loadSettings = 1

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
