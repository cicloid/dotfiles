" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Just for NVIM
if has('nvim')
  let g:python3_host_prog = '/Users/cicloid/.pyenv/versions/3.5.1/bin/python'
  let g:python_host_prog =  '/Users/cicloid/.pyenv/versions/2.7.11/bin/python2'
endif

" ================ General Config ====================

set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" Numbers
set numberwidth=5
set number                      "Line numbers are good


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on

" Chnage the leader for a easier to reach on my keyboards
let mapleader=","

" =============== Plug Initialization ===============
" This loads all the plugins specified in ~/.vim/plugs.vim
" Use Plug plugin to manage all other plugins
if filereadable(expand("~/.vim/plugs.vim"))
  source ~/.vim/plugs.vim
endif

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" ================ Custom Settings ========================
so ~/.vim/settings.vim
