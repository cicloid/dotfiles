let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

if &background == 'light'
  hi IndentGuidesOdd  ctermbg=white
  hi IndentGuidesEven ctermbg=lightgrey
endif

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
