export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

zplug "junegunn/fzf-bin", \
  from:gh-r, \
  as:command, \
  rename-to:fzf, \
  use:"*darwin*amd64*"

zplug "stedolan/jq", \
  from:gh-r, \
  as:command, \
  rename-to:jq
zplug "b4b4r07/emoji-cli", \
  on:"stedolan/jq"

zplug "raylee/tldr", from:github, as:command, use:"tldr"

zplug 'modules/utility', from:prezto
zplug 'modules/osx', from:prezto
zplug 'modules/git', from:prezto
zplug 'modules/editor', from:prezto

zplug "plugins/vi-mode",   from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

zplug "rimraf/k"

zplug "iam4x/zsh-iterm-touchbar", from:github

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
#
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi


# Then, source plugins and add commands to $PATH
#
#
zplug load


#####################################################################
# completions
#####################################################################

# Enable completions
if [ -d ~/.zsh/comp ]; then
  fpath=(~/.zsh/comp $fpath)
  autoload -U ~/.zsh/comp/*(:t)
fi

zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
# Use cache completion
# apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perl -M,
# bogofilter (zsh 4.2.1 >=), fink, mac_apps...
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1

zstyle ':completion:*' matcher-list '' \
  'm:{a-z}={A-Z}' \
  'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'

# sudo completions
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*' menu select

zstyle ':completion:*' keep-prefix

zstyle ':completion:*' completer _oldlist _complete _match _ignored \
  _approximate _list _history


# Hostnames completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
${${${${${(f)"$(<${HOME}/.ssh/known_hosts)"//\[/}//\]:/ }:#[\|]*}%%\
  *}%%,*}
  ${${${(@M)${(f)"$(<${HOME}/.ssh/config)"}:#Host *}#Host }:#*[*?]*}
  ${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}#*[[:blank:]]}}
    )'
      zstyle ':completion:*:*:*:hosts' ignored-patterns 'ip6*' 'localhost*'

      autoload -U compinit; compinit -d ~/.zcompdump

# Original complete functions
compdef '_files -g "*.hs"' runhaskell
compdef _man w3mman
compdef _tex platex

# cd search path
cdpath=(
  $HOME
)

zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"



######################################################################
## colors
######################################################################

#if [ $TERM = "dumb" ]; then
  #    # Disable colors in GVim
  #    # alias ls="ls -F --show-control-chars"
  #    # alias la='ls -aF --show-control-chars'
  #    # alias ll='ls -lF --show-control-chars'
  #    # alias l.='ls -dF .[a-zA-Z]*'
  #else
    #    # Color settings for zsh complete candidates
      #    # alias ls='ls -F --color=always'
      #    # alias la='ls -aF --color=always'
      #    # alias ll='ls -lF --color=always'
      #    # alias l.='ls -dF .[a-zA-Z]* --color=always'
      #    export LSCOLORS=ExFxCxdxBxegedabagacad
      #    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
      #    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
      #fi

## use prompt colors feature
#autoload -U colors
#colors

#if [ $TERM = "dumb" ]; then
  #    # Use simple prompt in GVim
  #    PROMPT='%n%# '
  #else
    #    PROMPT='%{[$[31+$RANDOM % 7]m%}%U%B%n%#'"%b%{[m%}%u "

#    if [ ${VIMSHELL_TERM:-""} = "terminal" ] \
  #        || [ ${VIMSHELL_TERM:-""} = "" ]; then
    #    RPROMPT="%{[33m%}[%35<..<%~]%{[m%}"
    #else
      #    PROMPT='%{[$[31+$RANDOM % 7]m%}%B%n%#'"%b%{[m%}%u "

#    # For test
  #    # PROMPT="%{$fg[green]%}%B%~$%b%{${reset_color}%} "
  #fi
  #fi

#if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] ; then
  #    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
  #fi

#if [ $UID = "0" ]; then
  #    PROMPT="%B%{[31m%}%/#%{^[[m%}%b "
  #    PROMPT2="%B%{[31m%}%_#%{^[[m%}%b "
  #fi

## Multi line prompt
#PROMPT2="%_%% "
## Spell miss prompt
#SPROMPT="correct> %R -> %r [n,y,a,e]? "

#####################################################################
# options
######################################################################
#{{{
setopt auto_resume
# Ignore <C-d> logout
setopt ignore_eof
# Disable beeps
setopt no_beep
# {a-c} -> a b c
setopt brace_ccl
# Enable spellcheck
setopt correct
# Enable "=command" feature
setopt equals
# Disable flow control
setopt no_flow_control
# Ignore dups
setopt hist_ignore_dups
# Reduce spaces
setopt hist_reduce_blanks
# Ignore add history if space
setopt hist_ignore_space
# Save time stamp
setopt extended_history
# Expand history
setopt hist_expand
# Better jobs
setopt long_list_jobs
# Enable completion in "--option=arg"
setopt magic_equal_subst
# Add "/" if completes directory
setopt mark_dirs
# Disable menu complete for vimshell
setopt no_menu_complete
setopt list_rows_first
# Expand globs when completion
setopt glob_complete
# Enable multi io redirection
setopt multios
# Can search subdirectory in $PATH
setopt path_dirs
# For multi byte
setopt print_eightbit
# Print exit value if return code is non-zero
setopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_silent
# Short statements in for, repeat, select, if, function
setopt short_loops
# Ignore history (fc -l) command in history
setopt hist_no_store
setopt transient_rprompt
unsetopt promptcr
setopt hash_cmds
setopt numeric_glob_sort
# Enable comment string
setopt interactive_comments
# Improve rm *
setopt rm_star_wait
# Enable extended glob
setopt extended_glob
# Note: It is a lot of errors in script
# setopt no_unset
# Prompt substitution
setopt prompt_subst

if [[ ${VIMSHELL_TERM:-""} != "" ]]; then
  setopt no_always_last_prompt
else
  setopt always_last_prompt
fi

# List completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
# Check original command in alias completion
setopt complete_aliases
unsetopt hist_verify
# }}}

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
alias -s html=opera
alias -s xhtml=opera
alias -s gif=display
alias -s jpg=display
alias -s jpeg=display
alias -s png=display
alias -s bmp=display
alias -s mp3=amarok
alias -s m4a=amarok
alias -s ogg=amarok
# }}}

# Improve lv
alias lv='lv -c -T8192'

# Better mv, cp, mkdir
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

# emacs no window
alias emacsnw="env TERM=xterm-256color emacs -nw"

# Automatic exec emacs
alias emacsclient="emacsclient -a emacs"

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


#####################################################################
# keybinds
######################################################################
# VIM keybinds
bindkey -v

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# Like bash
bindkey "^u" backward-kill-line

export KEYTIMEOUT=1


#####################################################################
# functions
######################################################################

# Set environment variables easily
setenv () { export $1="$@[2,-1]" }

#-------------------------------------------------------
# Print all histories
function history-all { history -E 1 }

#-------------------------------------------------------
# File encode conversion
euc() {
  for i in $@; do;
    nkf -e -Lu $i >! /tmp/euc.$$ # -Lu : New line is LF
    mv -f /tmp/euc.$$ $i
  done;
}
sjis() {
  for i in $@; do;
    nkf -s -Lw $i >! /tmp/euc.$$ # -Lw : New line is CRLF
    mv -f /tmp/euc.$$ $i
  done;
}

r() {
  source ~/.zshrc
  if [ -d ~/.zsh/comp ]; then
    # Reload complete functions
    local f
    f=(~/.zsh/comp/*(.))
    unfunction $f:t 2> /dev/null
    autoload -U $f:t
  fi
}


#####################################################################
# others
######################################################################

  source ~/.zsh.custom

# Improve terminal title
case "${TERM}" in
  kterm*|xterm*|vt100)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
  ;;
esac

# Share zsh histories
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history
setopt share_history

# Enable math functions
zmodload zsh/mathfunc


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.iterm2_shell_integration.zsh
export PATH="/usr/local/opt/ruby/bin:$PATH"

export GOPRIVATE="*"

