" store backup files to individual files
autocmd BufWritePre * let &backupext='-'.strftime("%y%m%d-%H%M")

autocmd CmdwinEnter * nnoremap <esc> :q<cr>
autocmd CmdwinLeave * nunmap <esc>
autocmd TermOpen * normal G$zb

autocmd FileType vim-plug setlocal colorcolumn=
autocmd FileType vim-plug setlocal nospell

autocmd CmdlineEnter /,\? set hlsearch
autocmd CmdlineLeave /,\? set nohlsearch
