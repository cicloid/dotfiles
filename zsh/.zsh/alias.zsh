
#####################################################################
# alias
######################################################################
# Global aliases {{{
alias -g A="| awk"
alias -g G="| grep"
alias -g GV="| grep -v"
alias -g H="| head"
alias -g L="| $PAGER"
alias -g P=' --help | less'
alias -g R="| ruby -e"
alias -g S="| sed"
alias -g T="| tail"
alias -g V="| vim -R -"
alias -g U=' --help | head'
alias -g W="| wc"
# }}}

# Suffix aliases {{{
alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s gz=gzcat
alias -s tbz=bzcat
alias -s bz2=bzcat
alias -s java=vim
alias -s c=vim
alias -s h=vim
alias -s C=vim
alias -s cpp=vim
alias -s txt=vim
alias -s xml=vim
alias -s html=open
alias -s xhtml=open
alias -s gif=open
alias -s jpg=open
alias -s jpeg=open
alias -s png=open
alias -s bmp=open
alias -s mp3=open
alias -s m4a=open
alias -s ogg=open
# }}}

# Better mv, cp, mkdir
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

# Use rlwrap commands
if [ -x '/usr/bin/rlwrap' -o  -x '/usr/local/bin/rlwrap' ]; then
  alias irb='rlwrap irb'
  alias ghci='rlwrap ghci'
  alias clisp="rlwrap -b '(){}[],#\";| ' clisp"
  alias gcl="rlwrap -b '(){}[],#\";| ' gcl"
  alias gosh="rlwrap -b '(){}[],#\";| ' gosh"
fi

# Move to previous directory
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

# development
alias py='python'
alias rb='ruby'
alias gdb='gdb -silent'
alias gpp='g++'

# Improve du, df
alias du="du -h"
alias df="df -h"

# Improve od for hexdump
  alias od='od -Ax -tx1z'
  alias hexdump='hexdump -C'
  alias hexd=hexdump

# Better where
alias where="command -v"

# Better jobs
alias j="jobs -l"

alias ..="cd .."
alias ...="cd ..; cd .."
