set backup
set backupdir=~/.config/nvim/shada/backup
set breakindent                 " break has same indentation
set clipboard=unnamed,unnamedplus " common clipboard for all vim sessions
set colorcolumn=+1              " indicate end-of-line
set completeopt=longest,menuone
set copyindent                  " copy indentation on newline
set directory=~/.config/nvim/shada/swap
set expandtab                   " convert tabs to spaces
set formatoptions=croqnlj       " continue commenting
set gdefault                    " swap all by default
set inccommand=nosplit
set linebreak                   " auto-line break
set list
set listchars=tab:ᵗ\ ,trail:▮,nbsp:░
set mouse=n                     " enable mouse
set nofoldenable                " disallow folding by default
set nojoinspaces                " 'J' after '.' creates single space.
set nostartofline               " leave the cursor in place
set number                      " line numbering
set path+=**
set previewheight=3
set relativenumber              " set relative number
set scrolloff=5                 " never reach bottom
set shiftround                  " rounds down number of spaces for alignment
set shiftwidth=4                " number of spaces in tabs
set softtabstop=4               " Insert spaces instead of tabs
set spell                       " Check my (natural language) spelling
set spelllang=en,nb             " Dual English/Norwegian spell checker
set splitbelow                  " make splits on below
set splitright                  " make splits on right side
set tabstop=4                   " number of spaces in a tab
set tags^=.git/tags;~
set textwidth=79                " generate newline at col
set undodir=~/.config/nvim/shada/undo
set undofile
set updatetime=100
set wildignore=.dll,.o,.obj,.bak,.pyc,.pdf,.png,.jpg,.pkl,.xz
set wildmode=longest:full,list:full
