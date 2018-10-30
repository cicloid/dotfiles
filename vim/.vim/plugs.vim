" Add Bundles to Runtime path
set rtp+=~/.vim/bundles/ "Submodules


call plug#begin()

so ~/.vim/plugs/vim-improvements.plugs
so ~/.vim/plugs/appearance.plugs
so ~/.vim/plugs/git.plugs
so ~/.vim/plugs/project.plugs
so ~/.vim/plugs/search.plugs
so ~/.vim/plugs/languages.plugs
so ~/.vim/plugs/ruby.plugs
so ~/.vim/plugs/textobjects.plugs

call plug#end()
