SYMLINK_DIRECTORY="${DOTFILES_PATH}/symlinks"

mkdir ~/dev
mkdir ~/Virtuelle_Maschinen
mkdir ~/.ssh

touch ~/.hushlogin

ln -sf "${SYMLINK_DIRECTORY}/.gitignore" "~/."
ln -sf "${SYMLINK_DIRECTORY}/.tmux.conf" "~/."
ln -sf "${SYMLINK_DIRECTORY}/.zshrc" "~/."
ln -sf "${SYMLINK_DIRECTORY}/ssh_config" "~/.ssh/config"
