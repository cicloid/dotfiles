" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'


" Appearance
"
Plug 'keith/tmux.vim'
Plug 'sonph/onehalf', {'rtp': 'vim' }
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'

" Search
"
Plug 'junegunn/fzf.vim'
Plug 'osyo-manga/vim-over'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-hopping'
Plug 'justinmk/vim-sneak'
Plug 'skwp/vim-easymotion'

" Languages
"
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'davidhalter/jedi-vim'

" Project Management
"
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'


" Text editing
"
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'austintaylor/vim-indentobject'
Plug 'bootleq/vim-textobj-rubysymbol'
Plug 'coderifous/textobj-word-column.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tomtom/tcomment_vim'

" Ruby
"
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" Initialize plugin system
call plug#end()

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor
