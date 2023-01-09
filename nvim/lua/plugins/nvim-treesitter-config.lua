require('nvim-treesitter.configs').setup {
    ensure_installed = { "bash", "cpp", "lua", "rust", "toml", "python"},
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true }, 
    rainbow = {
        enable = false,
        extended_mode = true,
        max_file_lines = nil,
    },
}
