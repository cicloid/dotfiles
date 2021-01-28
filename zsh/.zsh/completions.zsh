
#####################################################################
# completions
#####################################################################

zplug "zsh-users/zsh-completions", defer:3, lazy:true

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

#     # Use cache completion
#     # apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perl -M,
#     # bogofilter (zsh 4.2.1 >=), fink, mac_apps...

zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list '' \
  'm:{a-z}={A-Z}' \
  'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
#
#     # sudo completions
#     zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#       /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
#
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix

zstyle ':completion:*' completer _oldlist _complete _match _ignored \
  _approximate _list _history
#
#
#     # Hostnames completion.
#     zstyle -e ':completion:*:hosts' hosts 'reply=(
#     ${${${${${(f)"$(<${HOME}/.ssh/known_hosts)"//\[/}//\]:/ }:#[\|]*}%%\
#       *}%%,*}
#       ${${${(@M)${(f)"$(<${HOME}/.ssh/config)"}:#Host *}#Host }:#*[*?]*}
#       ${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}#*[[:blank:]]}}
#         )'
#           zstyle ':completion:*:*:*:hosts' ignored-patterns 'ip6*' 'localhost*'
#
#           autoload -U compinit; compinit -d ~/.zcompdump
#
#     # cd search path
#     cdpath=(
#       $HOME
#     )
#
zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"
