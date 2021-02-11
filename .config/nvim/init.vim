syntax enable
colorscheme hybrid

let loaded_netrwPlugin = 1

"*** GENERAL SETTING ***

let g:python3_host_prog = '~/.config/nvim/venv/bin/python'

set backup
set backupdir=~/.config/nvim/shada/backup
set breakindent                     " break has same indentation
set clipboard=unnamed,unnamedplus   " common clipboard for all vim sessions
set completeopt=longest,menuone
set copyindent                      " copy indentation on newline
set directory=~/.config/nvim/shada/swap
set expandtab                       " convert tabs to spaces
set formatoptions=croqnlj           " continue commenting
set gdefault                        " swap all by default
set inccommand=nosplit
set linebreak                       " auto-line break
set list
set listchars=tab:ᵗ\ ,trail:▮,nbsp:░
set mouse=n                         " enable mouse
set nofoldenable                    " disallow folding by default
set nojoinspaces                    " 'J' after '.' creates single space.
set nostartofline                   " leave the cursor in place
set number                          " line numbering
set path+=**
set previewheight=3
set relativenumber                  " set relative number
set scrolloff=5                     " never reach bottom
set shiftround                      " rounds down number of spaces for alignment
set shiftwidth=4                    " number of spaces in tabs
set softtabstop=4                   " Insert spaces instead of tabs
set spelllang=en_us,nb              " Dual English/Norwegian spell checker
set spell                           " Check my (natural language) spelling
set splitbelow                      " make splits on below
set splitright                      " make splits on right side
set statusline+=\ %f%=%m%r\ %l:%c
set tabstop=4                       " number of spaces in a tab
set tags^=.git/tags;~
set undodir=~/.config/nvim/shada/undo
set undofile
set updatetime=1000
set wildignore=.dll,.o,.obj,.bak,.pyc,.pdf,.png,.jpg,.pkl,.xz
set wildmode=longest:full,list:full

" *** AUTOCOMMANDS ***

augroup MyAutoCommands
    autocmd!
    autocmd BufWritePre * let &backupext='-'.strftime("%y%m")
    autocmd BufWritePost * Neomake
    autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>
    autocmd TermOpen * normal G$zb | setlocal nonumber | startinsert

    autocmd FileType python setlocal colorcolumn=+1 | set textwidth=79

    autocmd InsertEnter * call deoplete#enable()
    autocmd InsertLeave * pclose!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:ExpandSnippet()<cr>"
augroup end

function! g:ExpandSnippet()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ""
    endif
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res
        return ""
    elseif pumvisible()
        return "\<down>\<cr>"
    endif
    return "\<tab>"
endfunction

" *** MAPPINGS ***

nnoremap s :silent! w<cr>
cnoremap xa noau xa
nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
nnoremap <cr> <c-]>
inoremap <nowait> jk <esc>
cnoremap <nowait> jk <esc>
tnoremap <esc> <c-\><c-n>
nnoremap <tab> <c-w><c-w>
nnoremap <silent> å :silent exec ':cd '.system('git rev-parse --show-toplevel 2>/dev/null')<cr>
nmap <silent> Å :vs<cr>å
tmap <silent> å <c-\><c-n>å
nnoremap <silent> æ :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>
nmap <silent> Æ :vs<cr>æ
tmap <silent> æ <c-\><c-n>æ
nnoremap <silent> ø :silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:edit term://$SHELL<cr>
nnoremap Ø :vsplit<cr>:silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:edit term://$SHELL<cr>
nnoremap D :quit<cr>
nnoremap <space>s :set spell!<cr>
nnoremap <space>+ z=
nnoremap <space>\ ]s
nnoremap <space>i zg]s
nnoremap <space>j zz<c-d>zz
nnoremap <space>k zz<c-u>zz
vnoremap <space>j zz<c-d>zz
vnoremap <space>k zz<c-u>zz
nnoremap <space>l :bnext<cr>
nnoremap <space>h :bprev<cr>

nmap n <Plug>(anzu-n-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap N <Plug>(anzu-N-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap * <Plug>(anzu-star-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap # <Plug>(anzu-sharp-with-echo)<Plug>(anzu-smart-sign-matchline)
nmap <esc> <esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)

nnoremap -- :.,.Commentary<cr>j
nmap - <plug>Commentary
vmap - <plug>Commentary
xmap - <plug>Commentary
omap - <plug>Commentary

" *** PLUGINS ***

call plug#begin()

Plug 'osyo-manga/vim-anzu'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'  " get tabs/spacing style from file
Plug 'chrisbra/Recover.vim'
Plug 'tpope/vim-fugitive'
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'jamessan/vim-gnupg'
Plug 'ap/vim-css-color'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'SirVer/ultisnips'

call plug#end()

" *** PLUGIN SETTINGS ***

let g:RecoverPlugin_Edit_Unmodified = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '±±'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '±-'
let g:gitgutter_sign_removed_first_line = '‾‾'
let g:neomake_error_sign = {'text': '!!', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '??', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': 'mm', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ii', 'texthl': 'NeomakeInfoSign'}
let g:neomake_python_enabled_makers = ['pep257', 'mypy', 'pylint']
let g:UltiSnipsEditSplit="vertical"
let g:anzu_status_format = "%/ %#WarningMsg#[%i/%l]"

" *** HIGHLIGHTING ***

highlight BufTabLineActive              ctermbg=0       ctermfg=12
highlight BufTabLineCurrent             ctermbg=0       ctermfg=3
highlight BufTabLineFill                ctermbg=0
highlight BufTabLineHidden              ctermbg=0       ctermfg=15
highlight BufTabLineModifiedActive      ctermbg=12      ctermfg=0
highlight BufTabLineModifiedCurrent     ctermbg=3       ctermfg=0
highlight BufTabLineModifiedHidden      ctermbg=15      ctermfg=0

highlight ColorColumn                   ctermbg=0
highlight Comment      cterm=italic
highlight LineNr                                        ctermfg=5
highlight MatchParen   cterm=bold       ctermbg=0       ctermfg=None
highlight Normal                        ctermbg=None
highlight SpecialKey                                    ctermfg=7
highlight SpellBad     cterm=underline  ctermbg=None    ctermfg=None
highlight SpellCap     cterm=None       ctermbg=None    ctermfg=None
highlight SpellLocal   cterm=underline  ctermbg=None    ctermfg=None
highlight SpellRare    cterm=None       ctermbg=None    ctermfg=None
highlight Statusline                    ctermbg=3       ctermfg=0
highlight StatuslineNC                  ctermbg=12      ctermfg=0
highlight Visual                        ctermbg=8

highlight link NeomakeErrorSign GitgutterDelete
highlight link NeomakeWarningSign GitgutterChange
