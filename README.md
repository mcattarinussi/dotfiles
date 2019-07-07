# My dotfiles

Dotfiles and bootstrap scripts for my Mac.

Inspired by:
- https://github.com/driesvints/dotfiles
- https://github.com/mathiasbynens/dotfiles

# Setup

- Install [xcode](https://developer.apple.com/xcode/) from the App Store (or in the Terminal: `xcode-select --install`)
- Open Terminal and create a folder to download this repo (e.g. `mkdir -p code/github.com/mcattarinussi`)
- Clone this repository: `git clone https://github.com/mcattarinussi/dotfiles code/github.com/mcattarinussi/dotfiles`
- cd into the repo folder and run `sh install.sh`
- Open iTerm and set `Mattia` profile as default
- Logout and login again to see the shell configuration updated
- Setup vscode sync token as described [here](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
- Setup gpg and ssh (follow [this guide](https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3#setup-the-gpg-agent-for-ssh-authentication))
- Copy aws credentials backup in ~/.aws
