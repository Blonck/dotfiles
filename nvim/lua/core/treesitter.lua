-- Built-in tree-sitter (vim.treesitter).
-- Neovim bundles parsers for: c, lua, markdown, markdown_inline, query,
-- vim, vimdoc, bash, python. For additional languages (cpp, rust, julia,
-- json, html, yaml, latex, ...), drop the compiled parser .so into
-- ~/.local/share/nvim/site/parser/<lang>.so and queries into
-- ~/.local/share/nvim/site/queries/<lang>/.

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
    end
  end,
})

vim.opt.foldlevel = 99
