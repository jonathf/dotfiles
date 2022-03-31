vim.cmd [[
augroup AutoCommands
    autocmd!
    autocmd BufWritePre * ++once let &backupext='-'.strftime("%y%m")
    autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>
    autocmd TermEnter * nnoremap <buffer> <esc> :close<cr>
    autocmd VimResized * :wincmd =
    autocmd InsertLeave * pclose!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    autocmd BufRead,BufNewFile *.ipynb set filetype=notebook
    autocmd BufRead,BufNewFile *.gms set filetype=gams
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup end
]]

require "plugins"
require "settings"
require "mappings"
require "snippets"
