syntax enable
colorscheme hybrid

let loaded_netrwPlugin = 1  " do not load netrw

let g:vim_root = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:python3_host_prog = '~/.config/nvim/venv/bin/python'

call plug#begin()

" get tabs/spacing style from file
Plug 'tpope/vim-sleuth'

" Ask for diff during recover
Plug 'chrisbra/Recover.vim'
let g:RecoverPlugin_Edit_Unmodified = 1

" Git interface
Plug 'tpope/vim-fugitive'

Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'Konfekt/vim-mailquery', {'for': 'mail'}
let g:mailquery_folder = '/home/jonathf/.config/neomutt/mail'

" decrypt on read, encrypt on write
Plug 'jamessan/vim-gnupg'

augroup MyConfig
    autocmd!
    exec 'source' g:vim_root . '/config/autocmd.vim'
    exec 'source' g:vim_root . '/config/setting.vim'
    exec 'source' g:vim_root . '/config/mapping.vim'
    exec 'source' g:vim_root . '/config/highlight.vim'
    exec 'source' g:vim_root . '/config/interface.vim'
    exec 'source' g:vim_root . '/config/completion.vim'
augroup END

call plug#end()
