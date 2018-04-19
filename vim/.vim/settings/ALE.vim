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

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']


let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_javascript_eslint_use_global = 1

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
