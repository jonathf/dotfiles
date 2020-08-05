" save document, wait for escape-s command:
nmap s :silent! w<cr>

" 0: jump to first char. Or jump to 0 col if at first char.
nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" jump to definition:
nnoremap <cr> <c-]>

" visual counter during iteration
Plug 'osyo-manga/vim-anzu'
let g:anzu_status_format = "%/ %#WarningMsg#[%i/%l]"
nmap n <Plug>(anzu-n-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap N <Plug>(anzu-N-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap * <Plug>(anzu-star-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap # <Plug>(anzu-sharp-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap <esc> <esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)

" my escape rules:
inoremap <nowait> jk <esc>
cnoremap <nowait> jk <esc>
tnoremap <esc> <c-\><c-n>

" quick split switch:
nnoremap <tab> <c-w><c-w>

" spelling rules:
nnoremap <space>s :set spell!<cr>
nnoremap <space>+ z=
nnoremap <space>\ ]s
nnoremap <space>i zg]s

" file navigation at cur folder:
nnoremap <silent> å :silent exec ':cd '.system('git rev-parse --show-toplevel 2>/dev/null')<cr>
nmap <silent> Å :vs<cr>å
tmap <silent> å <c-\><c-n>å
nnoremap <silent> æ :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>
nmap <silent> Æ :vs<cr>æ
tmap <silent> æ <c-\><c-n>æ

nnoremap <silent> ø :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:edit term://$SHELL<cr>
nnoremap Ø :vsplit<cr>:silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:edit term://$SHELL<cr>

" stuff I like
nnoremap D :quit<cr>
nnoremap <space>j zz<c-d>zz
nnoremap <space>k zz<c-u>zz
vnoremap <space>j zz<c-d>zz
vnoremap <space>k zz<c-u>zz
nnoremap <space>r :Semshi rename<cr>

" commenting
Plug 'tpope/vim-commentary'
nnoremap -- :.,.Commentary<cr>j
nmap - <plug>Commentary
vmap - <plug>Commentary
xmap - <plug>Commentary
omap - <plug>Commentary

" Add more surround targets
Plug 'wellle/targets.vim'

" Allow custom mapping to be repeatable
Plug 'tpope/vim-repeat'

function! SetTerminalMapping() abort
    nnoremap <buffer> p pi<cr><c-\><c-n>
    nnoremap <buffer> a i<right>
    nnoremap <buffer> A i<end>
    nnoremap <buffer> I i<home>
    nnoremap <buffer> dd i<esc>dd<c-\><c-n>?\$<cr>
    nnoremap <buffer> u i<C-r><esc>
endfunction
autocmd TermOpen * call SetTerminalMapping()
autocmd TermOpen * startinsert
