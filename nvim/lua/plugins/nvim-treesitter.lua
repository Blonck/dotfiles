require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "python", "rust", "lua", "julia",
                         "bash", "vim", "json", "html", "yaml", "markdown",},
    auto_install = true,
    highlight = {
        enable = true,
    },
    ident = { enable = true },
    additional_vim_regex_highlighting = false,
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
