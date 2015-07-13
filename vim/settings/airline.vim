let g:airline#extensions#tabline#enabled = 1

" TODO: Apparently this is deprecated
" let g:airline_enable_syntastic  = 1
" let g:airline_enable_branch     = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'

let g:airline_symbols.whitespace = 'Ξ'
" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
" let g:airline_symbols.readonly = ''
let g:airline_symbols.readonly  = '⭤'
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch    = '⭠'
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr    = '⭡'

