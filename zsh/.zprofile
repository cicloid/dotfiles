#
# Executes commands at login pre-zshrc.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Better umask
umask 022

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Print core files?
#unlimit
#limit core 0
#limit -s
#limit coredumpsize  0

# improved less option
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# export LESS='-F -g -i -M -R -S -w -X -z-4'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
cdpath=(
  $cdpath
 )



### Go Stuff
#
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  /usr/local/{bin,sbin}
  /usr/local/opt/go/libexec/bin
  ~/Library/Python/3.7/bin
  $GOPATH/bin
  $path
  /Applications/Postgres.app/Contents/Versions/latest/bin
  /sbin
  /bin
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# Ruby RBENV
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if [[ -s `brew --prefix`/etc/profile.d/z.sh ]]; then
	. `brew --prefix`/etc/profile.d/z.sh
fi

if which direnv > /dev/null; then
	eval "$(direnv hook zsh)"
fi

alias dokku='$HOME/.dokku/contrib/dokku_client.sh'

if [[ -s "$HOME/.homebrewrc" ]]; then
  . ~/.homebrewrc
fi

if [[ -s "$HOME/.zsh.custom" ]]; then
  . ~/.zsh.custom
fi

if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

export TF_PLUGIN_CACHE_DIR=$HOME/.terraform.d/cache/

export PATH="$HOME/.cargo/bin:$PATH"
