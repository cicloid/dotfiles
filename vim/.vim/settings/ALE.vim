" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
      \ 'sh' : ['shellcheck'],
      \ 'vim' : ['vint'],
      \ 'html' : ['tidy'],
      \ 'python' : ['flake8'],
      \ 'ruby' : ['rubocop'],
      \ 'markdown' : ['mdl'],
      \ 'javascript' : ['eslint'],
      \ 'jsx': ['stylelint', 'eslint']
      \}
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:ale_linters = {
      \ 'sh' : ['shellcheck'],
      \ 'vim' : ['vint'],
      \ 'html' : ['tidy'],
      \ 'python' : ['flake8'],
      \ 'ruby' : ['rubocop'],
      \ 'markdown' : ['mdl'],
      \ 'javascript' : ['eslint'],
      \ 'jsx': ['stylelint', 'eslint']
      \}

" If emoji not loaded, use default sign
try
  let g:ale_sign_error = emoji#for('boom')
  let g:ale_sign_warning = emoji#for('small_orange_diamond')
catch
  " Use same sign and distinguish error and warning via different colors.
  let g:ale_sign_error = '•'
  let g:ale_sign_warning = '•'
endtry
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']


let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_javascript_eslint_use_global = 1


let g:ale_sign_column_always = 1
