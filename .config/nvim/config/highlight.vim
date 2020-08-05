highlight LineNr ctermfg=darkgrey
highlight ColorColumn ctermbg=237
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=7
highlight Normal ctermbg=None
highlight MatchParen cterm=bold ctermbg=0 ctermfg=None
highlight SpellBad cterm=underline ctermbg=None ctermfg=None
highlight SpellCap cterm=None ctermbg=None ctermfg=None
highlight SpellRare cterm=None ctermbg=None ctermfg=None
highlight SpellLocal cterm=underline ctermbg=None ctermfg=None
highlight OverLength ctermbg=237
highlight Comment cterm=italic
highlight Visual ctermbg=0 ctermfg=1

" Semantic highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
function MyCustomHighlights()
    highlight semshiLocal           ctermfg=3
    highlight semshiGlobal          ctermfg=3
    highlight semshiImported        ctermfg=11 cterm=bold
    highlight semshiBuiltin         ctermfg=3

    highlight semshiParameter       ctermfg=12
    highlight semshiParameterUnused ctermfg=4 cterm=underline
    highlight semshiFree            ctermfg=13
    highlight semshiAttribute       ctermfg=14
    highlight semshiSelf            ctermfg=12 cterm=bold
    highlight semshiUnresolved      ctermbg=0 cterm=underline,bold
    highlight semshiSelected        ctermfg=7 ctermbg=0

    highlight semshiErrorSign       ctermfg=9
    highlight semshiErrorChar       ctermfg=9
    sign define semshiError text=XX texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()
autocmd ColorScheme python call MyCustomHighlights()

" HTML color codes highlight with their color value
Plug 'ap/vim-css-color'
