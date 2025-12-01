require('onedark').setup{
    style = 'deep',
    toggle_style_key = "<leader>c",
    toggle_style_list = {'deep', 'light', 'darker', 'warmer'},
}

vim.cmd('colorscheme onedark')
