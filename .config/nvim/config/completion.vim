" Main plugin
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Only use when in insert mode
autocmd InsertEnter * call deoplete#enable()
autocmd InsertLeave * pclose!

" Content to fill completion with
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}

" Snippet system
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="vertical"
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
au BufEnter * exec "inoremap <silent> " .
        \ g:UltiSnipsExpandTrigger .
        \ " <C-R>=g:ExpandSnippet()<cr>"
