" pretty status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Compact the content down
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 0
let g:airline_detect_crypt = 0
let g:airline_powerline_fonts = 0
let g:airline_symbols = {
            \ 'crypt': '', 'linenr': '', 'maxlinenr': '', 'branch': '',
            \ 'paste': '', 'spell': 'S', 'notexists': '', 'whitespace': ''}
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_z = '%2p%% %l/%L:%3v'

" match colors with terminal emulator
let g:airline_theme = 'term'

" display modes as single letters
let g:airline_mode_map = {
    \ '__': '-', 'c': 'C', 'R': 'R', 'Rv': 'R',
    \ 'i': 'I', 'ic': 'I', 'ix': 'I',
    \ 'n': 'N', 'multi' : 'M', 'ni': 'N', 'no': 'N',
    \ 's': 'S', 'S': 'S', '': 'S',
    \ 't': 'T', 'v': 'V', 'V': 'V', '': 'V'}

" Use double digit direct mapping if len(buffers) >= 10
function! g:AirlineSelectToggle()
    let tab_count = len(getbufinfo({'buflisted': 1}))
    " tabline only when having multiple buffers
    " Check if going from single digit or double digit mode
    if tab_count >= 10 && g:tab_count < 10
        " Remove old mapping mode 1
        for idx in range(10)
            execute ':nunmap <space>'.idx
        endfor
        " Create new mappings mode 3
        let g:airline#extensions#tabline#buffer_idx_mode = 3
        for idx in range(100)
            execute 'nmap <space>'.printf('%02d', idx).' <Plug>AirlineSelectTab'.printf('%02d', idx)
        endfor
    endif
    let g:tab_count = tab_count
endfunction
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
for idx in range(10)
    execute ':nmap <space>'.idx.' <Plug>AirlineSelectTab'.idx
endfor
let g:tab_count = 0
call g:AirlineSelectToggle()
if g:tab_count < 10
    autocmd BufCreate,BufDelete * call AirlineSelectToggle()
endif
nmap <space>h <Plug>AirlineSelectPrevTab
nmap <space>l <Plug>AirlineSelectNextTab

" display the current function/method in status
Plug 'liuchengxu/vista.vim', {'for': 'python'}
autocmd VimEnter python call vista#RunForNearestMethodOrFunction()

" left side indicators
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '±±'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '±-'
let g:gitgutter_sign_removed_first_line = '‾‾'

Plug 'benekastah/neomake'
let g:neomake_error_sign = {'text': '!!', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '??', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': 'mm', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ii', 'texthl': 'NeomakeInfoSign'}
let g:neomake_python_enabled_makers = ['pep257', 'mypy', 'pylint']
highlight link NeomakeErrorSign GitgutterDelete
highlight link NeomakeWarningSign GitgutterChange
autocmd BufWritePost * Neomake

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'goerz/jupytext.vim'
