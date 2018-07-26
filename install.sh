#!/bin/sh

# Setup brew and install dependencies listed in the Brewfile
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew tap homebrew/bundle
brew bundle
