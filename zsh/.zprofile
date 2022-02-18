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

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/{bin,sbin}
  $GOPATH/bin
  $path
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

# # Set the Less input preprocessor.
# # Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
# if (( $#commands[(i)lesspipe(|.sh)] )); then
#   export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
# fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

if [[ -f /usr/local/opt/asdf/asdf.sh ]]; then
  . /usr/local/opt/asdf/asdf.sh
fi

if [[ -s /usr/local/etc/profile.d/z.sh ]]; then
	. `brew --prefix`/etc/profile.d/z.sh
fi

if [[ -s "$HOME/.homebrewrc" ]]; then
   . ~/.homebrewrc
fi

if [[ -s "$HOME/.zsh.custom" ]]; then
  . ~/.zsh.custom
fi

source $HOME/.cargo/env

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
