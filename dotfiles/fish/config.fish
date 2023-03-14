set fish_greeting ""
set -x EDITOR nvim


switch (uname)
    case Darwin
            eval (/opt/homebrew/bin/brew shellenv)
end

# Aliases definitions
alias l="ls -lahF"
alias reload="source ~/.config/fish/config.fish"
alias findBigFiles='du -hs $(ls)'

alias ssh='TERM=xterm-256color command ssh'

alias kclear='kubectx -u'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

alias glg="git log --oneline --decorate --graph --all"
alias gst="git status"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gpf="git pull --all && git fetch --prune"
alias gdb="git branch --merged | egrep -v '(^\*|master|dev|main)' | xargs git branch -d && git remote prune origin"

# Application sourcing

# z
zoxide init fish | source
# fnm
fnm env --use-on-cd | source
# kubectl
kubectl completion fish | source
# Starship rs
starship init fish | source
# Python pyenv
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source


# mclist
function mclist_ip; echo "2a01:04f8:0252:1ce6::$argv:0"; end

# local backup
function backup; rsync --verbose --recursive --delete-before --whole-file --times --exclude=".DS_Store" --exclude=".Trash/" ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/ pi@solar:~/backup; end

# Container
#alias docker=podman
#export DOCKER_HOST='unix:///Users/yylian/.local/share/containers/podman/machine/podman-machine-default/podman.sock'

# start stopped docker container with sh
# docker run -it --entrypoint /bin/sh dmn

