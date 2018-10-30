let g:previm_open_cmd = "open -a 'Safari Technology Preview'"
let g:previm_enable_realtime = 1


augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
