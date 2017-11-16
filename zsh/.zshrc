zmodload zsh/zprof

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

if [[ $+commands["hub"] ]]; then
  eval "$(hub alias -s)"
fi

if [[ -s "/Userc/cicloid/.iterm2_shell_integrations.zsh" ]]; then
  source /Users/cicloid/.iterm2_shell_integration.zsh
fi



export PATH="$HOME/.yarn/bin:$PATH"
