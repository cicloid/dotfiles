" Open the Ag command and place the cursor into the quotes
if executable('ag')
  nmap ,ag :Ag ""<Left>
  nmap ,af :AgFile ""<Left>

  map <C-F> :Ag ""<Left>
endif

