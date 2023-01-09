local opts = { noremap = true, silent = true }

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'


-- replace word under cursor
vim.keymap.set('n', '<Leader>r', [[:%s/<C-r><C-w>/<C-r><C-w>]], opts)

-- working with tabs

vim.keymap.set('n', '<C-n>', ':cnext <CR>', opts) -- next item
vim.keymap.set('n', '<C-j>', ':lnext <CR>', opts) -- last item
vim.keymap.set('n', '<Leader>d', ':tabnext<CR>', opts) -- next tab
vim.keymap.set('n', '<Leader>a', ':tabprevious<CR>', opts) -- previous tab
-- map('i', '<Leader>a', '<Esc>:tabnext<CR><i>') -- next tab
-- map('i', '<Leader>d', '<Esc>:tabprevious<CR><i>') -- previous tab

-- toggle spell check
vim.keymap.set("n", "<Leader>s", function()
    vim.opt_local.spell = not(vim.opt_local.spell:get())
end)

-- trim whitespace
function trim_whitespace()
    vim.api.nvim_command([[:%s/\s\+$//e]])
end
vim.keymap.set("n", "<Leader>w", ':lua trim_whitespace()<CR>', opts)

-- nvim-tree

vim.keymap.set("n", "<F4>", ":NvimTreeToggle<CR>", opts)

-- merginal toggle
vim.keymap.set("n", "<F3>", ":Twiggy<CR>", opts)


-- telescope
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts) 
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, opts)
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<silent><nowait> <space>z", builtin.spell_suggest, opts)
vim.keymap.set("n", "<silent><nowait> <space>cc", builtin.command_history, opts)

--[[
--

" general mappings {{{
    " toggle background color
call togglebg#map("<F6>")

    " Removes trailing spaces
    " own mappings
    " yank from system buffer
    :nnoremap <leader>y "+y <CR>
    " paste into system buffer
    :nnoremap <leader>p "+gP <CR>



    " nerdtee toggle
    nnoremap <F4> :NERDTreeTabsToggle<CR>
    " merginal toggle
    nnoremap <F3> :Twiggy<CR>

    " Telescope
    nnoremap <leader>ff <cmd>Telescope git_files show_untracked=false<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>fs <cmd>Telescope current_buffer_fuzzy_find<cr>

    nmap <silent> <leader>j <Plug>(coc-definition)
    nmap <leader>l <Plug>(coc-references)
    " <leader>r is already used for replacing the name
    nmap <leader>R <Plug>(coc-rename)
    nmap <leader>s :<C-u>CocList -I symbols<CR>
    nnoremap <leader>h :call <SID>show_documentation()<CR>
    " formatting
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    " expand regions
    map <leader>b <Plug>(expand_region_expand)
    map <leader>B <Plug>(expand_region_shrink)
    " code action
    nmap <leader>qc <Plug>(coc-codeaction)
    nmap <leader>qf <Plug>(coc-fix-current)
    nmap <leader>qi :CocCommand pyright.organizeimports<CR>
    nmap <leader>qr :CocCommand pyright.restartserver<CR>

    nnoremap <silent><nowait> <space>e  :<C-u>CocDiagnostic<cr>
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    nnoremap <silent><nowait> <space>z  :<C-u>Telescope spell_suggest<cr>
    nnoremap <silent><nowait> <space>cc  :<C-u>Telescope command_history<cr>

    nmap <leader>gs :Gstatus<CR>
    nmap <leader>gl :Gclog<CR>

    " terminal mappings
    :tnoremap <Esc> <C-\><C-n>
" }}}

--]]
