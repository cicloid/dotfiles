export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zmodload zsh/mathfunc

zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# zplug "raylee/tldr", from:github, as:command, use:"tldr"
# zplug "rimraf/k"
# zplug "iam4x/zsh-iterm-touchbar", from:github
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*", \
    if:"[[ $OSTYPE == *darwin* ]]"

zplug "sharkdp/fd", from:gh-r, \
  as:command, \
  rename-to:fd, \
  use:"*darwin*", \
  if:"[[ $OSTYPE == *darwin* ]]"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2

zplug 'modules/utility', from:prezto, lazy:yes
zplug 'modules/osx', from:prezto, lazy:yes
zplug 'modules/git', from:prezto
zplug 'modules/editor', from:prezto

zplug "plugins/vi-mode",   from:oh-my-zsh, defer:1
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]", defer:2

# Can manage local plugins
zplug "~/.zsh", from:local, defer:2
zplug "~/.zsh.w", from:local, defer:2

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme, defer:2

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load
