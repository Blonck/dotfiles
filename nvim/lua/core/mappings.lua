local opts = { noremap = true, silent = true }

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'


-- explore
vim.keymap.set('n', '<leader>fx', vim.cmd.Ex, opts)
vim.keymap.set('n', '<leader>fl', vim.cmd.Lex, opts)

-- replace word under cursor
vim.keymap.set('n', '<leader>r', [[:%s/<C-r><C-w>/<C-r><C-w>]], opts)

-- don't loose word when pasting
vim.keymap.set('n', "<leader>p", "\"_dP", opts)

-- like 'J' but keep cursor at position
vim.keymap.set("n", "J", "mzJ`z")

-- working with tabs

vim.keymap.set('n', '<C-n>', ':cnext <CR>', opts) -- next item
vim.keymap.set('n', '<C-j>', ':lnext <CR>', opts) -- last item
vim.keymap.set('n', '<leader>d', ':tabnext<CR>', opts) -- next tab
vim.keymap.set('n', '<leader>a', ':tabprevious<CR>', opts) -- previous tab


-- toggle spell check
vim.keymap.set("n", "<Leader>s", function()
    vim.opt_local.spell = not(vim.opt_local.spell:get())
end)

-- trim whitespace
function trim_whitespace()
    vim.api.nvim_command([[:%s/\s\+$//e]])
end
vim.keymap.set("n", "<Leader>w", ':lua trim_whitespace()<CR>', opts)

---- nvim-tree
-- vim.keymap.set("n", "<F4>", ":NvimTreeToggle<CR>", opts)
-- refresh :NvimTreeRefresh<CR>
-- find file :NvimTreeFindFile<CR>

---- git
vim.keymap.set("n", "<leader>gh", ":Flog<CR>", opts)
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_signs<CR>", opts)
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, opts)
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", opts)

---- telescope
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fa", builtin.treesitter, opts)
vim.keymap.set("n", "<leader>ft", builtin.tags, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, opts)
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<leader>pf", builtin.git_files, opts)

-- set in toggleterm config
-- vim.keymap.set("n", "<F5>", ":toggleterm<CR>", opts)

-- tagbar
vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>", opts)

----[[ old mappings which I may reuse later
----
--
--" general mappings {{{
--    " toggle background color
--call togglebg#map("<F6>")
--
--    " Removes trailing spaces
--    " own mappings
--    " yank from system buffer
--    :nnoremap <leader>y "+y <CR>
--    " paste into system buffer
--    :nnoremap <leader>p "+gP <CR>
--
--
--    nmap <silent> <leader>j <Plug>(coc-definition)
--    nmap <leader>l <Plug>(coc-references)
--    " <leader>r is already used for replacing the name
--    nmap <leader>R <Plug>(coc-rename)
--    nmap <leader>s :<C-u>CocList -I symbols<CR>
--    nnoremap <leader>h :call <SID>show_documentation()<CR>
--    " formatting
--    xmap <leader>f  <Plug>(coc-format-selected)
--    nmap <leader>f  <Plug>(coc-format-selected)
--    " expand regions
--    map <leader>b <Plug>(expand_region_expand)
--    map <leader>B <Plug>(expand_region_shrink)
--    " code action
--    nmap <leader>qc <Plug>(coc-codeaction)
--    nmap <leader>qf <Plug>(coc-fix-current)
--    nmap <leader>qi :CocCommand pyright.organizeimports<CR>
--    nmap <leader>qr :CocCommand pyright.restartserver<CR>
--
--    nnoremap <silent><nowait> <space>e  :<C-u>CocDiagnostic<cr>
--    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
--    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
--    nnoremap <silent><nowait> <space>z  :<C-u>Telescope spell_suggest<cr>
--    nnoremap <silent><nowait> <space>cc  :<C-u>Telescope command_history<cr>
--
--    nmap <leader>gs :Gstatus<CR>
--    nmap <leader>gl :Gclog<CR>
--
--    " terminal mappings
--    :tnoremap <Esc> <C-\><C-n>
--" }}}
--
----]]
