
REPO_NAME="dotfiles"
CURRENT_PATH=$(pwd)
REPO_PATH="$CURRENT_PATH/dev/$REPO_NAME"
DOTFILES_PATH="$REPO_PATH/dotfiles"

PACKAGES=(
    bitwarden
    discord
    dolphin
    fish
    grim slurp wl-clipboard
    firefox
    htop
    kitty
    kubectx
    man
    ncdu
    neovim
    otf-hasklig-nerd
    openssh
    reflector
    rsync
    rofi
    telegram-desktop
    ttf-apple-emoji
    vim-plug
    visual-studio-code-bin
    wget
    whois
    zoxide
    zip

    fnm
    starship
)

yay
yay -S $PACKAGES

mkdir ~/.ssh

CONFIG_PATH="$HOME/.config"
mkdir $CONFIG_PATH

mkdir "${CONFIG_PATH}/git"
ln -sf "${DOTFILES_PATH}/git/.gitignore" "${CONFIG_PATH}/git/ignore"

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPN3sulvGbTMs1WtoAnkd4dRt6I2sfaaN08wFJaLp8A julian@jarminowski.de'

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

ln -sf "$DOTFILES_PATH/fish/config.fish" "$CONFIG_PATH/fish"

mkdir "$CONFIG_PATH/nvim"
ln -sf "$DOTFILES_PATH/nvim/init.vim" "$CONFIG_PATH/nvim"

mkdir "$CONFIG_PATH/kitty"
ln -sf "$DOTFILES_PATH/kitty/kitty.conf" "$CONFIG_PATH/kitty"

# Finish
echo "You may still want to configure the following things:"
echo "  - Enable color and ILoveCandy output in /etc/pacman.conf"
echo "Reboot."
