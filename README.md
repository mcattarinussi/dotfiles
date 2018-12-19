# My dotfiles

Dotfiles and bootstrap scripts for my Mac.

Inspired by:
- https://github.com/driesvints/dotfiles
- https://github.com/mathiasbynens/dotfiles

# Setup

- Open the console and create a folder for code: `mkdir -p code/mcattarinussi`
- Install [xcode](https://developer.apple.com/xcode/) from the App Store (or using the cli: `xcode-select --install`)
- Clone this repository: git clone https://github.com/mcattarinussi/dotfiles code/mcattarinussi/dotfiles
- Run `sh install.sh` (must be run from the root folder of this repo)
- Open iTerm and set `Mattia` profile as default
- Logout to see the shell configuration updated
- Setup vscode sync token as described [here](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
- Setup gpg and ssh (follow [this guide](https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3#setup-the-gpg-agent-for-ssh-authentication))
- Copy aws credentials backup in ~/.aws
