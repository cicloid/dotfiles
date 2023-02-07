ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

zinit ice wait"2" # load after 2 seconds
zinit snippet OMZP::rbenv

zinit ice wait"2" # load after 2 seconds
zinit snippet OMZP::ruby

zinit load zdharma-continuum/history-search-multi-word
zinit light zdharma-continuum/fast-syntax-highlighting

# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# NEOVIM
# zinit ice from"gh-r" as"program" bpick"*appimage*" ver"nightly" mv"nvim* -> nvim" pick"nvim"
# zinit light neovim/neovim

# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep

zinit snippet OMZL::clipboard.zsh
zinit snippet PZTM::utility
zinit snippet PZTM::osx
zinit snippet PZTM::editor
zinit snippet OMZP::vi-mode

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl

zinit snippet PZT::/modules/git/alias.zsh

zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" for \
        direnv/direnv

for file in ${HOME}/.zsh/*.zsh; do
  source $file
done

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
unsetopt BEEP
setopt vi


# Load starship theme
eval "$(starship init zsh)"

### End of Zinit's installer chunk
#
#
alias n="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /opt/homebrew/opt/asdf/libexec/asdf.sh
