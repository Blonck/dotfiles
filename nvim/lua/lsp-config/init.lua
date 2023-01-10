-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp
local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', '<leader>j', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>l', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
end

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
