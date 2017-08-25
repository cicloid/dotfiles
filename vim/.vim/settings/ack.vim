" Open the Ag command and place the cursor into the quotes
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  nmap ,kk :Ack ""<Left>

  let g:ack_working_path_mode="r"
  let g:ack_use_dispatch = 1
endif
