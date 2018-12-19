#!/bin/sh

# Setup brew and install dependencies listed in the Brewfile
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew tap homebrew/bundle
brew bundle

DOTFILES_DIR=$PWD/dotfiles

# Setup zsh and oh-my-zsh
ZSH_PATH=$(which zsh)
if ! grep -q $ZSH_PATH '/etc/shells'; then
  echo $ZSH_PATH | sudo tee -a /etc/shells
fi
if [ $SHELL != $ZSH_PATH ]; then
  chsh -s $ZSH_PATH
fi
# Remove existing oh-my-zsh installation
rm -rf $HOME/.oh-my-zsh
# Workaround to avoid running zsh after installation of oh-my-zsh. Check https://github.com/robbyrussell/oh-my-zsh/pull/5893
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
rm -f $HOME/.zshrc $HOME/.zshrc.pre-oh-my-zsh
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
# TODO: improve plugin installation
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Load iTerm2 DynamicProfiles
# TODO: find a way to automatically set as the default profile
rm -f $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/iterm2Profiles.json
ln -s $DOTFILES_DIR/iterm2Profiles.json $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/

# VSCode sync extension
code --install-extension Shan.code-settings-sync
