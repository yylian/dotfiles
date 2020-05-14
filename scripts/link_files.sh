SYMLINK_DIRECTORY="${DOTFILES_PATH}/symlinks"
SCRIPTS_DIRECTORY="~/bin"

mkdir ~/dev
mkdir ~/Virtuelle_Maschinen
mkdir ~/.ssh
mkdir ~/bin

touch ~/.hushlogin

ln -sf "${SYMLINK_DIRECTORY}/.gitignore" "~/."
ln -sf "${SYMLINK_DIRECTORY}/.bash-aliases" "~/."
ln -sf "${SYMLINK_DIRECTORY}/.tmux.conf" "~/."
ln -sf "${SYMLINK_DIRECTORY}/.zshrc" "~/."
ln -sf "${SYMLINK_DIRECTORY}/ssh_config" "~/.ssh/config"

ln -sf "${SYMLINK_DIRECTORY}/tdev" "${SCRIPTS_DIRECTORY}/."
