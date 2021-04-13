""*** GENERAL SETTING ***

"" ** FILES **

let g:python3_host_prog = '~/.config/nvim/venv/bin/python'
set backup backupdir=~/.config/nvim/shada/backup
set gdefault directory=~/.config/nvim/shada/swap
set undofile undodir=~/.config/nvim/shada/undo
set tags^=.git/tags;~
set path+=**
set spelllang=en_us,nb              " Dual English/Norwegian spell checker
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"

" ** INDENTATION AND TABS **
"
set breakindent                     " break has same indentation
set copyindent                      " copy indentation on newline
set expandtab                       " convert tabs to spaces
set shiftwidth=4                    " number of spaces in tabs
set softtabstop=4                   " Insert spaces instead of tabs
set tabstop=4                       " number of spaces in a tab
set nojoinspaces                    " 'J' after '.' creates single space.
set shiftround                      " rounds down number of spaces for tab alignment
set number relativenumber           " line numbering

" ** VISUALS **

set inccommand=nosplit
set list listchars=tab:ᵗ\ ,trail:▮,nbsp:░
set formatoptions=croqnlj           " continue commenting
set previewheight=3
set scrolloff=5                     " never reach bottom
set linebreak                       " smart (fake) auto-line break
set statusline=\ %f%=%m

" ** BEHAVIOR **

set clipboard=unnamed,unnamedplus   " common clipboard for all vim sessions
set completeopt=longest,menuone
set mouse=n                         " enable mouse
set nofoldenable                    " disallow folding by default
set nostartofline                   " leave the cursor in place
set spell                           " Check my (natural language) spelling
set splitbelow splitright           " default splits to down right position
set wildmode=longest:full,list:full

" *** PLUGINS ***

highlight ErrorMsg   ctermbg=5 ctermfg=8
call plug#begin()
Plug 'goerz/jupytext.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'osyo-manga/vim-anzu'
let g:anzu_status_format = "%/ %#WarningMsg#[%i/%l]"

Plug 'wellle/targets.vim'

Plug 'chrisbra/Recover.vim'
let g:RecoverPlugin_Edit_Unmodified = 1

Plug 'tpope/vim-fugitive'

Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'peterhoeg/vim-qml', {'for': 'qml'}

Plug 'jamessan/vim-gnupg'
Plug 'ap/vim-css-color'

Plug 'airblade/vim-gitgutter'

Plug 'benekastah/neomake'
let g:neomake_python_enabled_makers = ['pep257', 'mypy', 'pylint']

Plug 'kassio/neoterm'
let g:neoterm_keep_term_open = 0
let g:neoterm_default_mod = 'belowright vertical'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'deoplete-plugins/deoplete-tag'
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}

Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="vertical"


Plug 'ap/vim-buftabline'
let g:buftabline_numbers = 1

call plug#end()

" *** HIGHLIGHTING ***

colorscheme hybrid

highlight BufTabLineCurrent             ctermbg=2       ctermfg=0
highlight BufTabLineModifiedCurrent     ctermbg=3       ctermfg=0
highlight BufTabLineActive              ctermbg=0       ctermfg=10
highlight BufTabLineModifiedActive      ctermbg=0       ctermfg=11
highlight BufTabLineHidden              ctermbg=0       ctermfg=15
highlight BufTabLineFill                ctermbg=0

highlight ColorColumn                   ctermbg=0
highlight Comment       cterm=italic
highlight MatchParen    cterm=bold      ctermbg=0       ctermfg=None
highlight Normal                        ctermbg=None
highlight SpecialKey                                    ctermfg=7
highlight SpellBad      cterm=underline ctermbg=None    ctermfg=None
highlight SpellCap      cterm=None      ctermbg=None    ctermfg=None
highlight SpellLocal    cterm=underline ctermbg=None    ctermfg=None
highlight SpellRare     cterm=None      ctermbg=None    ctermfg=None
highlight Statusline                    ctermbg=3       ctermfg=0
highlight StatuslineNC                  ctermbg=15      ctermfg=0
highlight Visual                        ctermbg=8
highlight TermCursorNC                  ctermbg=1       ctermfg=0

highlight link NeomakeErrorSign GitgutterDelete
highlight link NeomakeWarningSign GitgutterChange

" *** AUTOCOMMANDS ***

augroup MyAutoCommands
    autocmd!
    autocmd BufWritePre * ++once let &backupext='-'.strftime("%y%m")
    autocmd BufWritePost * Neomake
    autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>

    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * startinsert

    autocmd FileType python setlocal colorcolumn=+1 | set textwidth=80

    autocmd InsertEnter * call deoplete#enable()
    autocmd InsertLeave * pclose!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    autocmd BufEnter * exec "inoremap <silent> <tab> <C-R>=g:ExpandJumpIterateTab()<cr>"
augroup end

function! g:ExpandJumpIterateTab()
    let out = ""
    if UltiSnips#CanExpandSnippet() | call UltiSnips#ExpandSnippet()
    elseif UltiSnips#CanJumpForwards() | call UltiSnips#JumpForwards()
    elseif pumvisible() | let out = "\<down>\<cr>"
    else | let out = "\<tab>" | endif
    return out
endfunction

" *** MAPPINGS ***

" ** REMAPPING ÆØÅ **
nnoremap <silent> å :silent exec ':cd '.system('git rev-parse --show-toplevel 2>/dev/null')<cr>
nmap <silent> Å :vs<cr>å
tmap <silent> å <c-\><c-n>å
nnoremap <silent> æ :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>
nmap <silent> Æ :vs<cr>æ
tmap <silent> æ <c-\><c-n>æ
nnoremap <silent> ø :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:Tnew<cr>

" ** MY ESCAPE SEQUENCES **
inoremap <nowait> jk <esc>
cnoremap <nowait> jk <esc>
inoremap <esc> <esc>
tnoremap <esc> <c-\><c-n>
tnoremap <c-v><esc> <esc>
nmap <esc> <esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)

" ** IMPROVE THE DEFAULTS **
nmap n <Plug>(anzu-n-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap N <Plug>(anzu-N-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap * <Plug>(anzu-star-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap # <Plug>(anzu-sharp-with-echo)<Plug>(anzu-smart-sign-matchline)

" ** SOME PREFERRED CHANGES **
nnoremap s :silent! w<cr>
nnoremap D :quit<cr>
cnoremap xa noau xa

" ** CTRL-MOVE **
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
inoremap <c-l> <esc><c-w>l
inoremap <c-h> <esc><c-w>h
inoremap <c-j> <esc><c-w>j
inoremap <c-k> <esc><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k

nnoremap <space>s :set spell!<cr>
nnoremap <space>+ z=
nnoremap <space>\ ]s
nnoremap <space>i zg]s
nnoremap <space>l :bnext<cr>
nnoremap <space>h :bprev<cr>

nnoremap -- :.,.Commentary<cr>j
nmap - <plug>Commentary
vmap - <plug>Commentary
xmap - <plug>Commentary
omap - <plug>Commentary

nnoremap <space>r :w<cr>:TREPLSendLine<cr>
nnoremap <space>p :w<cr>:T python %<cr><esc>
nnoremap <space>t :w<cr>:T pytest --doctest-modules %<cr><esc>
