if has("mouse")
  set mouse=a
endif

if &term =~ '^xterm'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
