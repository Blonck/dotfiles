local autogrp = vim.api.nvim_create_autogroup
local autocmd = vim.api.nvim_create_autocmd

-- go to last location when opening a buffer
autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- set working directory to current directory for all buffers
-- autocmd(
--   "BufReadPost",
--   { command = [[if expand('%:p') !~ '://' | :lchdi %:p:h | endif]] }
-- )

---- terminal settings

-- open terminal on the right tab
autocmd('CmdlineEnter', {
    command = 'command! Term :botright vsplit term://$SHELL'
})

-- enter inter mode
autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
    pattern = '',
    command = 'startinsert',
})

-- close terminal buffer on exit
autocmd('BufLeave', {
    pattern = 'term://*',
    command = 'stopinsert',
})

