# VirtualBox
vboxmanage setproperty machinefolder ~/dev/Virtuelle_Maschinen
rm -rf ~/VirtualBox\ VMs/

# VS Code Plugins
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap
code --install-extension christian-kohler.path-intellisense
code --install-extension tintoy.msbuild-project-tools
code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension jchannon.csharpextensions
code --install-extension ms-vscode.csharp

# Intellij
defaults write com.jetbrains.intellij.ce NSNavLastRootDirectory ~/dev/intellij/

# git
cp assets/.gitignore ~/
git config --global core.excludesfile '~/.gitignore'

echo "Input your git username: "
read username
git config --global user.name $username

echo "Now your git email"
read email
git config --global user.email $email

git config --global alias.co 'checkout'
git config --global alias.cp 'cherry-pick'
git config --global alias.lg 'log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold)%s %Creset| %Cgreen%cr %C(white)%cn%Creset' --abbrev-commit --date=relative'
git config --global alias.wdiff 'diff --color-words'
git config --global pull.rebase true
