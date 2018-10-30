" Tabularize {
if exists(":Tabularize")
  nmap <Leader>tab= :Tabularize /=<CR>
  vmap <Leader>tab= :Tabularize /=<CR>
  nmap <Leader>tab: :Tabularize /:<CR>
  vmap <Leader>tab: :Tabularize /:<CR>
  nmap <Leader>tab:: :Tabularize /:\zs<CR>
  vmap <Leader>tab:: :Tabularize /:\zs<CR>
  nmap <Leader>tab, :Tabularize /,<CR>
  vmap <Leader>tab, :Tabularize /,<CR>
  nmap <Leader>tab<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>tab<Bar> :Tabularize /<Bar><CR>

  " The following function automatically aligns when typing a
  " supported character
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction

endif
" }
