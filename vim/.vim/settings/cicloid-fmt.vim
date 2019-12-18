

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_command_wrapper = 'nice -n5 %*'

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

autocmd! filetypedetect BufRead,BufNewFile *.tf.tt
autocmd BufRead,BufNewFile *.tf.tt set filetype=terraform

"   if get(g:, 'terraform_fmt_on_save', 0)
"     augroup vim.mastermold.terraform.fmt
"       autocmd!
"       autocmd BufWritePre *.tf.tt call terraform#fmt()
"     augroup END
"   endif

