let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsListSnippets="<nop>"
let g:UltiSnipsJumpForwardTrigger="<nop>"
let g:UltiSnipsJumpBackwardTrigger="<nop>"
function! g:ExpandJumpIterateTab()
    let out = ""
    if UltiSnips#CanExpandSnippet() | call UltiSnips#ExpandSnippet()
    elseif pumvisible() | let out = "\<c-n>"
    else | let out = "\<tab>" | endif
    return out
endfunction
inoremap <silent> <tab> <C-R>=g:ExpandJumpIterateTab()<cr>


" ** MY ESCAPE SEQUENCES **
tnoremap <esc> <c-\><c-n>
tnoremap <c-v><esc> <esc>
nmap <esc> <esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)

" ** IMPROVE THE DEFAULTS **
nmap n <Plug>(anzu-n-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap N <Plug>(anzu-N-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap * <Plug>(anzu-star-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap # <Plug>(anzu-sharp-with-echo)<Plug>(anzu-smart-sign-matchline)

" ** SOME PREFERRED CHANGES **
nnoremap s :w<cr>
nnoremap D :quit<cr>

" ** CTRL-MOVE **
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
inoremap <c-l> <esc><c-w>l
inoremap <c-k> <esc><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

" jumping
nnoremap } :<c-u>execute "keepjumps norm! " . v:count1 . "}"<cr>
nnoremap { :<c-u>execute "keepjumps norm! " . v:count1 . "{"<cr>
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap <c-f> <c-f>zz
nnoremap <c-s> <c-s>zz

nnoremap <space>s :set spell!<cr>
nnoremap <space>+ z=
nnoremap <space>\ ]s
nnoremap <space>i zg]s
nnoremap <space>l :bnext<cr>
nnoremap <space>h :bprev<cr>

nnoremap <space><space> :ls<cr>:b<space>

nnoremap -- :.,.Commentary<cr>j
nmap - <plug>Commentary
vmap - <plug>Commentary
xmap - <plug>Commentary
omap - <plug>Commentary

nnoremap <space>r :vs term://fish<cr>:au BufLeave <buffer> close<cr>
nnoremap <space>R :vs term://fish<cr>
nnoremap <silent> å :silent exec ':cd '.system('git rev-parse --show-toplevel 2>/dev/null')<cr>
nnoremap <silent> æ :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>
nnoremap <silent> ø :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:vs<cr>:terminal<cr>
nnoremap <silent> Ø :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:vs<cr>:terminal<cr>
