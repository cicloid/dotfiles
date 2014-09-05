" Add Bundles to Runtime path
set rtp+=~/.vim/bundles/ "Submodules


call plug#begin()

Plug 'tpope/vim-sensible'
so ~/.vim/plugs/appearance.plugs
so ~/.vim/plugs/git.plugs
so ~/.vim/plugs/project.plugs

call plug#end()
