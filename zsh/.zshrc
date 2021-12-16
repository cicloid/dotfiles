ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

# Load starship theme
zinit ice as"command" from"gh-r" \
          atclone"starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship


zinit ice wait"2" # load after 2 seconds
zinit snippet OMZP::rbenv

zinit ice wait"2" # load after 2 seconds
zinit snippet OMZP::ruby

zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting


zinit snippet OMZL::clipboard.zsh
zinit snippet PZTM::utility
zinit snippet PZTM::osx
zinit snippet PZTM::editor
zinit snippet OMZP::vi-mode

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
