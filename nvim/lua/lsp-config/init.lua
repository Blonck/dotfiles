-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup{
    on_attach = lsp_on_attach,
    capabilities = capabilities
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = lsp_on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {}
    }
}
