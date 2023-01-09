local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', '<leader>j', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>l', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
--[[
    nmap <leader>l <Plug>(coc-references)
    " <leader>r is already used for replacing the name
    nmap <leader>s :<C-u>CocList -I symbols<CR>
    " formatting
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    " code action
    nmap <leader>qc <Plug>(coc-codeaction)
    nmap <leader>qf <Plug>(coc-fix-current)
    nmap <leader>qi :CocCommand pyright.organizeimports<CR>
    nmap <leader>qr :CocCommand pyright.restartserver<CR>

    nnoremap <silent><nowait> <space>e  :<C-u>CocDiagnostic<cr>
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
--]]
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {}
    }
}
