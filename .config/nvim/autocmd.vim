augroup AutoCommands
    autocmd!
    autocmd BufWritePre * ++once let &backupext='-'.strftime("%y%m")
    autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>
    autocmd VimResized * :wincmd =
    autocmd InsertLeave * pclose!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    autocmd BufRead,BufNewFile *.ipynb set filetype=notebook
augroup end