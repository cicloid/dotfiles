" Add Bundles to Runtime path
set rtp+=~/.vim/bundles/ "Submodules


call plug#begin()

Plug 'tpope/vim-sensible'
so ~/.vim/plugs/appearance.plugs
so ~/.vim/plugs/git.plugs
so ~/.vim/plugs/project.plugs
so ~/.vim/plugs/ruby.plugs
so ~/.vim/plugs/search.plugs
so ~/.vim/plugs/textobjects.plugs
so ~/.vim/plugs/vim-improvements.plugs

call plug#end()
