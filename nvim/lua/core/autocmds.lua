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


-- vim.api.nvim_command([[
-- " Triger `autoread` when files changes on disk
-- autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
-- " Notification after file change
-- autocmd FileChangedShellPost *
--   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
-- ]])

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

