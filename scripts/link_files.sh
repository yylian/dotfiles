SYMLINK_DIRECTORY="${DOTFILES_PATH}/symlinks"

mkdir ~/dev
mkdir ~/Virtuelle_Maschinen
mkdir ~/.ssh

touch ~/.hushlogin

ln -sf "${SYMLINK_DIRECTORY}/.gitignore" $HOME
ln -sf "${SYMLINK_DIRECTORY}/.tmux.conf" $HOME
ln -sf "${SYMLINK_DIRECTORY}/.zshrc" $HOME
ln -sf "${SYMLINK_DIRECTORY}/.alacritty.yml" $HOME
ln -sf "${SYMLINK_DIRECTORY}/ssh_config" "$HOME/.ssh/config"
