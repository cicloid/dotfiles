# Bootstrap script for Cicloid

#----------------------------------------------------------------------------------------------------------------
# OSX
#----------------------------------------------------------------------------------------------------------------
sudo systemsetup -settimezone America/Mexico_City
sudo systemsetup -setrestartfreeze on

# System
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write -g ApplePersistence -bool no

# UI
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Tap with two fingers to emulate right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Enable three finger tap (look up)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Enable three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Disable Zoom in or out
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

# Disable Smart zoom, double-tap with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool false

# Disable Rotate
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool false

# Disable Swipe between pages with two fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

# Swipe between full-screen apps
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2

# Finder
defaults write com.apple.finder NewWindowTarget PfHm
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Safari
shell 'defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2'
shell 'defaults write com.apple.Safari IncludeDebugMenu -bool true'
shell 'defaults write com.apple.Safari ProxiesInBookmarksBar "()"'


#----------------------------------------------------------------------------------------------------------------
# homebrew
#----------------------------------------------------------------------------------------------------------------
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install git zsh stow
echo "Updating shells"
pbcopy "/usr/loca/bin/zsh"
sudo vi /etc/shells
chsh -s "/usr/loca/bin/zsh"


#----------------------------------------------------------------------------------------------------------------
# Dotfiles
#----------------------------------------------------------------------------------------------------------------
curl https://codeload.github.com/cicloid/dotfiles/zip/master > dotfiles.zip
unzip -o dotfiles.zip
rm dotfiles.zip
mv dotfiles-master dotfiles
pushd $HOME/dotfiles
  stow zsh
  stow homebrew
popd

#----------------------------------------------------------------------------------------------------------------
# ssh
#----------------------------------------------------------------------------------------------------------------
file="/Users/$USER/.ssh/id_rsa"
if ! [ -f "$file" ]; then
	echo "$file not found."
	ssh-keygen -t rsa -b 4096 -C "$USER@$HOST"
  ssh-add ~/.ssh/id_rsa
  pbcopy < ~/.ssh/id_rsa.pub
  open https://github.com/settings/ssh
  read -p "GitHub all up to date?"
fi

#----------------------------------------------------------------------------------------------------------------
# Link Dotfiles
#----------------------------------------------------------------------------------------------------------------
pushd $HOME/dotfiles
git init .
git remote add -t \* -f origin git@github.com:cicloid/dotfiles.git
git fetch origin
git reset --hard origin/master
git branch --set-upstream-to=origin/master master
echo "Updating submodules"
git submodule init
git submodule update
echo "Updating zpresto submodules"
pushd $HOME/dotfiles/zsh/.zprezto
git submodule init
git submodule update
popd
popd

#----------------------------------------------------------------------------------------------------------------
# Install missing homebrew stuff
#----------------------------------------------------------------------------------------------------------------
brew tap homebrew/bundle
brew bundle
brew upgrade `brew outdated`
brew cleanup
brew cask cleanup

#----------------------------------------------------------------------------------------------------------------
# Set stow
#----------------------------------------------------------------------------------------------------------------
pushd $HOME/dotfiles
  stow hammerspoon
  stow homebrew
  stow git
  stow node
  stow ruby
  stow scripts
  stow tmux
  stow vim
popd

#----------------------------------------------------------------------------------------------------------------
# Docker, dlite setup
#----------------------------------------------------------------------------------------------------------------
sudo dlite install
dlite start

#----------------------------------------------------------------------------------------------------------------
# Set Login Items
#----------------------------------------------------------------------------------------------------------------
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Dropbox.app", hidden:true}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Flux.app", hidden:true}'
osascript -e 'tell application "System Events" to get the name of every login item'

#----------------------------------------------------------------------------------------------------------------
# TODO
#----------------------------------------------------------------------------------------------------------------
open /Applications/App\ Store.app/
open /Applications/System\ Preferences.app/
open /Applications/Google\ Chrome.app

echo "TODO: Setings"
echo " - Spotlight"
echo " - iTerm PrefsCustomFolder"
echo " - Google and Twitter Accounts"
echo " - Disable iCloud in Contacts app preferences"
echo " - Dropbox setup, Day One and 1Password Sync"
echo " - Chrome Login, set downloads folder, 1Password add on"
echo " - Keys, and ENV settings"

echo "TODO: Install"
echo " - Mac App Store (PDF Expert, Dash, Day One, Fantastical, Pixelmator)"
echo " - Fantastical Default Calendar Settings"

read -p "Press enter to restart"
sudo shutdown -r now

