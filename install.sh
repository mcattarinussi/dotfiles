#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` timestamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

DOTFILES_DIR=$PWD/dotfiles


###############################################################################
# Apply mac custom settings                                                   #
###############################################################################

./.macos


###############################################################################
# brew                                                                        #
###############################################################################

# Install brew
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install apps and packages listed in the Brewfile
brew update
brew tap homebrew/bundle
brew bundle


###############################################################################
# terminal - iterm2 and zsh                                                   #
###############################################################################

# Setup zsh as default shell
ZSH_PATH=$(which zsh)
if ! grep -q $ZSH_PATH '/etc/shells'; then
  echo $ZSH_PATH | sudo tee -a /etc/shells
fi
if [ $SHELL != $ZSH_PATH ]; then
  chsh -s $ZSH_PATH
fi

# Install oh-my-zsh
rm -rf $HOME/.oh-my-zsh
# CHSH=no and RUNZSH=no prevents this script to run zsh when it finishes
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -f $HOME/.zshrc $HOME/.zshrc.pre-oh-my-zsh
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc

# Install oh-my-zsh plugins
# TODO: improve plugin installation
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Load iTerm2 DynamicProfiles
# TODO: find a way to automatically set as the default profile
rm -f $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/iterm2Profiles.json
ln -s $DOTFILES_DIR/iterm2Profiles.json $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/


###############################################################################
# VSCode                                                                      #
###############################################################################

# VSCode sync extension
code --install-extension Shan.code-settings-sync
