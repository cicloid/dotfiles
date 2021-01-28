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

