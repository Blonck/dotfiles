" enables vundle
set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'

" My Plugins here:
Plugin 'c.vim'
" great snippet engine
Bundle 'SirVer/UltiSnips'
" vim integration
Plugin 'tpope/vim-fugitive'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" ultra complex python mode
" Plugin 'klen/python-mode'
" checking for common style mistakes
Plugin 'davidbeckingsale/writegood.vim'
" handlw org mode files
Plugin 'hsitz/VimOrganizer'
" change start screen of vim
"Plugin 'vim-startify'
" NERDTree with tabs
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" coloscheme 
Plugin 'altercation/vim-colors-solarized'
" gundo
Plugin 'sjl/gundo.vim'
"expand regions
Plugin 'terryma/vim-expand-region.git'
" session plugin
Plugin 'tpope/vim-obsession'
" go suite
Plugin 'fatih/vim-go'
Plugin 'lervag/vimtex'

Plugin 'LanguageTool'
let g:languagetool_jar='~/bin/LanguageTool-3.0/languagetool-commandline.jar'

" rust syntax highliting
" Plugin 'wting/rust.vim'
" Plugin 'hsitz/VimOrganizer'
" Plugin 'Rip-Rip/clang_complete'
" syntax for julia language
Plugin 'JuliaLang/julia-vim'

call vundle#end()
filetype plugin indent on " required!

set backspace=2
set hidden					            " hide buffers instead of closing
set nowrap					            " don't wrap lines
set tabstop=2				            " a tab is four spaces
set autoindent			            " set autoindenting on
set copyindent			            " copy the previous indentation on autoindenting
set shiftwidth=2 		            " number of spaces for autoindenting
set smarttab				            " insert tabs, not tabstops
set expandtab				            " expand tabs to spaces
set smartcase				            " ignore case if pattern is all lowercase
set number					            " show line numbers
set showmatch				            " show matching paranthesis
set hlsearch				            " highliting search terms
set incsearch				            " incrementell search
set history=1000 		            " bigger search and commands history
set undolevels=1000             " much more undo levels
set wildignore=*.o,*.swp,*.pyc 	" ignoring file extensions
set wildmode=list:full          " complete word until longest match
set visualbell
set noerrorbells 		            " don't beep
set nobackup				            " no backup files
set browsedir=current		        " which directory to use for
set tags+=~/.vim/tags/cpp	      " set tags directory
set mouse=a					            " enables mouse in all modes

syntax enable
set background=dark
colorscheme solarized

" spell
setlocal spell spelllang=en_us

syntax spell toplevel
set nospell

" folding
highlight folded guibg=purple4 guifg=white
set foldnestmax=3


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

" gundoToggle
nnoremap <F5> :GundoToggle<CR>
nnoremap <F4> :NERDTreeTabsToggle<CR>
" nerdtee toggle
map <Leader>m <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabns_open_on_new_tab=0

" toggle background color
call togglebg#map("<F6>")

" change the mapleader to ,
let mapleader=","

" clang_format mapping
map <C-f> :pyf ~/.vim/clang-format.py<CR>
imap <C-f> <ESC>:pyf ~/.vim/clang-format.py<CR>i

" everything for YCM completer
nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" own mappings
:nnoremap <Leader>r :%s/<C-r><C-w>/<C-r><C-w>
:nnoremap <Leader>d :tabnext<CR>
:nnoremap <Leader>a :tabprevious<CR>
:inoremap <Leader>a <Esc>:tabnext<CR><i>
:inoremap <Leader>d <Esc>:tabprevious<CR><i>

" expand regions
map b <Plug>(expand_region_expand)
map B <Plug>(expand_region_shrink)

augroup latex_macros " {
  autocmd!
  " LaTeX (rubber) macro
  autocmd FileType tex :nnoremap <leader>c :w<CR>!rubber --pdf --warn all %<CR>
  autocmd FileType tex :nnoremap <leader>v :!qpdfview %:r.pdf &<CR><CR>
augroup END "}

let g:ycm_warning_symbol = '@@'
let g:ycm_always_populate_location_list = 1
let g:ycm_allow_changing_updatetime = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_blacklist = {
  \ 'julia' : 1,
  \ 'text' : 1,
  \ 'mail' : 1,
  \ 'markdown' : 1,
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'vimwiki' : 1,
  \ 'unite' : 1,
  \ 'notes' : 1,
  \ 'infolog' : 1
  \}

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

" vimtex
let g:vimtex_fold_automatic = 0

if has("autocmd")
  " enable detecting filetypes
  filetype plugin indent on

  " vimOrganizer
  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
  au BufEnter *.org call org#SetOrgFileType()

  " set gnuplot syntax for files ending with .plt
  au BufRead,BufNewFile *.plt setfiletype gnuplot

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
  autocmd BufEnter * if expand('%:p') !~ '://' | :lchdi %:p:h | endif

  " automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set complete =.,w,b,u,k,t
  set completeopt=menu,longest,preview
endif
