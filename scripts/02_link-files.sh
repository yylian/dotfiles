SYMLINK_DIRECTORY="~/.files/symlinks/"

mkdir ~/dev
mkdir ~/Virtuelle_Maschinen
mkdir ~/.ssh

touch ~/.hushlogin

ln -sf .gitignore ~/.
ln -sf "${SYMLINK_DIRECTORY}.bash-aliases" "~/."
ln -sf "${SYMLINK_DIRECTORY}.tmux.conf" "~/."
ln -sf "${SYMLINK_DIRECTORY}.zshrc" "~/."
ln -sf "${SYMLINK_DIRECTORY}ssh_config" "~/.ssh/config"
ln -sf "${SYMLINK_DIRECTORY}tdev" "~/."
