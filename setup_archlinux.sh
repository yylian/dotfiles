
REPO_NAME="dotfiles"
CURRENT_PATH=$(pwd)
REPO_PATH="$CURRENT_PATH/dev/$REPO_NAME"
DOTFILES_PATH="$REPO_PATH/dotfiles"

PACKAGES=(
    bitwarden
    dolphin
    fish
    firefox
    grim slurp wl-clipboard
    htop
    hyprland hyprpaper
    kitty
    keychain
    kubectx
    man
    ncdu
    neovim
    otf-hasklig-nerd
    openssh
    reflector
    ripgrep
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

    pyenv pyenv-virtualenv

    lutris steam proton-ge-custom-bin
    discord
)

yay
yay -S $PACKAGES

mkdir ~/.ssh

CONFIG_PATH="$HOME/.config"
mkdir $CONFIG_PATH

mkdir "${CONFIG_PATH}/git"
ln -sf "${DOTFILES_PATH}/git/ignore" "${CONFIG_PATH}/git/ignore"

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPN3sulvGbTMs1WtoAnkd4dRt6I2sfaaN08wFJaLp8A julian@jarminowski.de'
git config --global rebase.autosquash true

# Create dirs and link files
mkdir "$HOME/dev"
mkdir "$HOME/.ssh"
mkdir "$HOME/.config"

mkdir "$HOME/.config/nvim"
mkdir "$HOME/.config/fish"
ln -sf "/home/yylian/dev/dotfiles/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "/home/yylian/dev/dotfiles/dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sf "/home/yylian/dev/dotfiles/dotfiles/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "/home/yylian/dev/dotfiles/dotfiles/fish/functions" "$HOME/.config/fish/functions"

# Link folders
ln -sf "/home/yylian/dev/dotfiles/dotfiles/git" "$HOME/.config/git"
ln -sf "/home/yylian/dev/dotfiles/dotfiles/kitty" "$HOME/.config/kitty"
ln -sf "/home/yylian/dev/dotfiles/dotfiles/hypr" "$HOME/.config/hypr"
