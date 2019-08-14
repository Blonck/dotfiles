" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" great snippet engine
Plug 'SirVer/UltiSnips'
" git integration
Plug 'tpope/vim-fugitive'
" with branches
Plug 'sodapopcan/vim-twiggy'
" commit browser
Plug 'junegunn/gv.vim'
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
" expand region
Plug 'terryma/vim-expand-region'
" CtrlP
Plug 'kien/ctrlp.vim'
" vim-grepper
Plug 'mhinz/vim-grepper'
" switch to header and back
Plug 'vim-scripts/a.vim'
" Language server plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin for jupyter
Plug 'szymonmaszke/vimpyter' "vim-plug
" Plugin for multi cursor select
Plug 'terryma/vim-multiple-cursors'

call plug#end()

""" general settings {{{
    set hidden                              " hide buffers instead of closing
    set nowrap                              " don't wrap lines
    set tabstop=4                           " a tab is four spaces
    set copyindent                          " copy the previous indentation on autoindenting
    set shiftwidth=4                        " number of spaces for autoindenting
    set expandtab                           " expand tabs to spaces
    set smartcase                           " ignore case if pattern is all lowercase
    set number                              " show line numbers
    set showmatch                           " show matching parenthesis
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
    set updatetime=300                      " for coc diagnostic messages
    set complete =.,w,b,u,k,t
    set completeopt=menu,longest,preview

    syntax enable

    " set colorscheme to solarized
    colorscheme solarized
    let g:solarized_termcolors=256
    set background=dark

    " spell
    set nospell
    setlocal spell spelllang=en_us
    highlight SpellBad cterm=underline

    " folding
    highlight folded guibg=purple4 guifg=white
    set foldnestmax=3

    " list trailing spaces and tabs
    set listchars=tab:▸\ ,trail:·
    set list

    " change the mapleader to ,
    let mapleader=","
" }}}

" general mappings {{{
    " toggle background color
    call togglebg#map("<F6>")

    " Removes trailing spaces
    function TrimWhiteSpace()
        %s/\s*$//
        ''
    endfunction

    " own mappings
    :nnoremap <C-n> :cnext <CR>
    :nnoremap <C-j> :lnext <CR>
    :nnoremap <Leader>r :%s/<C-r><C-w>/<C-r><C-w>
    :nnoremap <Leader>d :tabnext<CR>
    :nnoremap <Leader>a :tabprevious<CR>
    :inoremap <Leader>a <Esc>:tabnext<CR><i>
    :inoremap <Leader>d <Esc>:tabprevious<CR><i>
    :nnoremap <Leader>w :call TrimWhiteSpace()<CR>
    :inoremap <Leader>w <Esc>:call TrimWhiteSpace()<CR><i>

    " use <ESC> to exit terminal mode
    :tnoremap <Esc> <C-\><C-n>

    " nerdtee toggle
    nnoremap <F4> :NERDTreeTabsToggle<CR>
    " merginal toggle
    nnoremap <F3> :Twiggy<CR>

    " expand regions
    map <leader>b <Plug>(expand_region_expand)
    map <leader>B <Plug>(expand_region_shrink)
" }}}

" UltiSnips {{{
    "" use different snippets dir
    let g:UltiSnipsSnippetsDir=$HOME.'/dotfiles/vim/my-snippets'
    let g:UltiSnipsSnippetDirectories=['my-snippets', $HOME.'/dotfiles/vim/my-snippets']
    " use vertical split to edit snippets
    let g:UltiSnipsEditSplit='vertical'
    " trigger snippet with Ctrl-L
    let g:UltiSnipsExpandTrigger='<C-l>'
    " go to next snippet with Ctrl-j
    let g:UltiSnipsJumpForwardTrigger='<C-j>'
    " go to previous snippet with Ctrl-k
    let g:UltiSnipsJumpBackwardTrigger='<C-k>'
    let g:UltiSnipsEnableSnipMate = 0
" }}}

" nerdtree {{{
    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:nerdtree_tabns_open_on_new_tab=0
" }}}

" startify {{{
    let g:startify_files_number = 20

    let g:startify_commands = [
    \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
    \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] }
    \ ]

    let g:startify_bookmarks = [
        \ { 'c': '~/.config/nvim/init.vim' }
    \ ]
" }}}

" coc {{{
    let g:coc_global_extensions = ['coc-ultisnips', 'coc-json', 'coc-python', 'coc-word']

    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    " use tab to toggle completion
    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <silent><expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<Tab>"

    " use <cr> to complete completion
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " coc key mappings
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    nmap <silent> <leader>j <Plug>(coc-definition)
    nmap <leader>l <Plug>(coc-references)
    " <leader>r is already used for replacing the name
    nmap <leader>R <Plug>(coc-rename)
    nmap <leader>s :<C-u>CocList -I symbols<CR>
    nnoremap <leader>h :call <SID>show_documentation()<CR>
    " formatting
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
" }}}

" ctrp {{{
" use ripgrep for ctrlp if available
    if executable('rg')
      let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
      let g:ctrlp_use_caching = 0
    endif
"}}}

" grepper {{{
    runtime plugin/grepper.vim
    let g:grepper.dir = 'repo,file'
    let g:grepper.tool = ['rg', 'git', 'grep']
    " location list with default height 10
    let g:grepper.quickfix = 0
    "let g:grepper = {'open': 0}
    "autocmd User Grepper lopen

    if executable('rg')
        nnoremap <leader>g :Grepper -tool rg -cword -noprompt<cr>
    else
        nnoremap <leader>g :Grepper -cword<cr>
    endif
" }}}


" autocomands {{{
    " key mappings for c/c++
    " set comment to doxystyle format
    au FileType c,cpp,hpp setlocal comments^=:///
    " toggle to header and back
    au FileType c,cpp,hpp map <C-Tab> :A<CR>

    " correct syntax highlighting for coc config
    au FileType json syntax match Comment +\/\/.\+$+

    " when editing python files
    au FileType python setlocal tabstop=4 expandtab smarttab shiftwidth=4 softtabstop=4
    "au FileType python setlocal foldmethod=indent
    au FileType python highlight Excess ctermbg=DarkGrey guibg=red
    au FileType python set nowrap

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " set working directory to current file for all buffers
    au BufEnter * if expand('%:p') !~ '://' | :lchdi %:p:h | endif

    " set gnuplot syntax for files ending with .plt
    au BufRead,BufNewFile *.plt setfiletype gnuplot

    augroup latex_macros " {
      autocmd!
      " LaTeX (rubber) macro
      autocmd FileType tex :nnoremap <leader>c :w<CR>!rubber --pdf --warn all %<CR>
      autocmd FileType tex :nnoremap <leader>v :!qpdfview %:r.pdf &<CR><CR>
    augroup END "}
""" }
