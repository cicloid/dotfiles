# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
zstyle ':omz:*:*' color 'yes'

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

eval "$(hub alias -s)"
eval "$(direnv hook zsh)"

source /Users/cicloid/.iterm2_shell_integration.zsh

# Added by termtile (https://github.com/apaszke/termtile)
alias tul='osascript ~/.termtile/tile.scpt up left'
alias tur='osascript ~/.termtile/tile.scpt up right'
alias tdl='osascript ~/.termtile/tile.scpt down left'
alias tdr='osascript ~/.termtile/tile.scpt down right'
alias tll='osascript ~/.termtile/tile.scpt left'
alias trr='osascript ~/.termtile/tile.scpt right'
alias tup='osascript ~/.termtile/tile.scpt up'
alias tdown='osascript ~/.termtile/tile.scpt down'
alias tbig='osascript ~/.termtile/resize.scpt '
alias tcen='osascript ~/.termtile/center.scpt '
alias tmax='osascript ~/.termtile/maximize.scpt '
alias tsn='osascript ~/.termtile/changeScreen.scpt next'
alias tfs='osascript ~/.termtile/fullscreen.scpt '

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi
