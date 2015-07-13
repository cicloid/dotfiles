" Make it beautiful - colors and fonts
" http://ethanschoonover.com/solarized/vim-colors-solarized
set t_Co=256

set textwidth=78
execute "set colorcolumn=" . join(range(81,335), ',')

hi ColorColumn guibg=#2d2d2d ctermbg=233

colorscheme argonaut
set background=dark


" Always show statusline even on single buffer
set laststatus=2

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  end
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif


