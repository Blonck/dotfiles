-- setup lsp config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- lsp
local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', '<leader>j', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>l', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, opts)
end

local root_patterns = { ".git", ".clang-format", "pyproject.toml", "setup.py" }
local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])

local lspconfig = require('lspconfig')

lspconfig['pyright'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['rust_analyzer'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {}
    }
}

lspconfig['clangd'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"c", "cpp", "cuda", "cc"},
}
