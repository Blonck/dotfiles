require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "python", "rust", "lua", "julia",
                         "bash", "vim", "json", "html", "yaml", },
    auto_install = true,
    highlight = {
        enable = true,
    },
    ident = { enable = true },
    additional_vim_regex_highlighting = false,
}
