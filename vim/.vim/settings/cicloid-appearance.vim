" Make it beautiful - colors and fonts

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif


if &term =~ 'alacritty'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif

set t_Co=256

set textwidth=78
execute "set colorcolumn=" . join(range(81,335), ',')

" Always show statusline even on single buffer
set laststatus=2

if has("gui_running")

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=80
  set columns=190

  if has("gui_gtk2")
    s#2D2D2Det guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  end
endif

colorscheme solarized8_high
let g:airline_theme='solarized8_high'

if has('termguicolors') && $TERM !~# '^\%(screen\|tmux\)'
  set termguicolors
  colorscheme solarized8_high
else
  set notermguicolors
endif

" Show relative line numbers on all documents for movement
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

let g:indent_guides_enable_on_vim_startup = 1
