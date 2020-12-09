SYMLINK_DIRECTORY="$HOME/.files/symlinks"

mkdir ~/dev
mkdir ~/Virtuelle_Maschinen
mkdir ~/.ssh

ln -sf "${SYMLINK_DIRECTORY}/.gitignore" $HOME
ln -sf "${SYMLINK_DIRECTORY}/.tmux.conf" $HOME
ln -sf "${SYMLINK_DIRECTORY}/.zshrc" $HOME
ln -sf "${SYMLINK_DIRECTORY}/ssh_config" "$HOME/.ssh/config"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        ln -sf "${SYMLINK_DIRECTORY}/.alacritty.linux-gnu.yml" "${HOME}/.alacritty.yml"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        ln -sf "${SYMLINK_DIRECTORY}/.alacritty.darwin.yml" "${HOME}/.alacritty.yml"
fi
