# dotfiles

These are my very own dotfiles. The setup script is supposed to only work on
OSX, but the asset files such as `.zshrc`, or the alacritty config, do work
cross-platform.

## Setup

Setup like this on macOS directly after finishing the installation:
```
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/yylian/dotfiles/master/setup_macos.sh)"
```

To add the ssh key permanent to the keystore on MacOS:
```
ssh-add -k --apple-use-keychain ~/.ssh/id_ed25519 
```
On archlinux you will need to have followed the the [installation
instructions](https://wiki.archlinux.org/index.php/installation_guide) and have
a user with sudo permissions `(yylian ALL=(ALL) NOPASSWD:ALL)`, [pam](https://wiki.archlinux.org/title/SSH_keys#pam_ssh) and curl. As display manager  [ly](https://github.com/nullgemm/ly) is used, voicefiltering over [LADSPA](https://medium.com/@gamunu/linux-noise-cancellation-b9f997f6764d)
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yylian/dotfiles/master/setup_archlinux.sh)"
```
