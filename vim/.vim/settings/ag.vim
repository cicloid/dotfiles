" Open the Ag command and place the cursor into the quotes
if executable('ag')
  nmap ,ag :Ag ""<Left>
  nmap ,af :AgFile ""<Left>

  map <C-F> :Ag ""<Left>

  let g:ag_working_path_mode="r"
endif

