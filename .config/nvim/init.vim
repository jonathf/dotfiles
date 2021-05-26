colorscheme hybrid

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

set breakindent                     " break has same indentation
set copyindent                      " copy indentation on newline
set expandtab                       " convert tabs to spaces
set shiftwidth=2                    " number of spaces in tabs
set softtabstop=2                   " Insert spaces instead of tabs
set tabstop=2                       " number of spaces in a tab
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
set termguicolors
set virtualedit=block,onemore

" ** BEHAVIOR **

set clipboard=unnamed,unnamedplus   " common clipboard for all vim sessions
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set mouse=n                         " enable mouse
set nofoldenable                    " disallow folding by default
set nostartofline                   " leave the cursor in place
set spell                           " Check my (natural language) spelling
set splitbelow splitright           " default splits to down right position
set wildmode=longest:full,list:full

source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/map.vim
