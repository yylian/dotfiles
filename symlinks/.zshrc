echo $PATH
# Basics
export PATH="/usr/local/bin:/usr/bin:/bin:/opt/local/bin:/usr/local/sbin:/usr/sbin:/opt/local/sbin"
export LANG=en_US.UTF-8

# zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# plugins
plugins=( git gitfast z tmux )

PROMPT='%F{cyan}%c$(GIT_PROMPT)%f '

function GIT_PROMPT() {
  # Get branch name or short SHA1 commit hash. Fails and exits when not in a git directory
  reference=$(GIT_PROMPT_WRAPPER symbolic-ref HEAD 2> /dev/null) || \
  reference=$(GIT_PROMPT_WRAPPER rev-parse --short HEAD 2> /dev/null) || return 0
  REFERENCE=${reference#refs/heads/}

  echo "%F{white}.$(GIT_STATUS_COLOR)$REFERENCE"
}

function GIT_STATUS_COLOR() {
  if [[ -n $(GIT_PROMPT_WRAPPER status --porcelain | tail -n1) ]]; then
    echo "%F{yellow}"
  else
    echo "%F{green}"
  fi
}

# Wrap git into function to avoid interfering with git commands run by the user
function GIT_PROMPT_WRAPPER() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Alias
alias l="ls -lahF -G"
alias reload='source ~/.zshrc'
alias find_big_files='du -hs $(ls)'

alias glog='git log --oneline --decorate --graph --all'
alias gst="git status"
alias gco="git checkout"
alias gitupdate="git pull --all && git fetch --prune"
alias gitcleanbranches="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"

f() {
	grep -rl "$1" .
}

tdev() {
  tmux new-session -d -s dev
  tmux new-window -n dev
  tmux split-window -h
  tmux split-window -v
  tmux selectp -t 0
  tmux attach -t dev
}

# Additional Path
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# add latext to path on macos
PATH=$PATH:/usr/texbin:/Library/TeX/texbin

# iterm2
echo -ne "\033]6;1;bg;red;brightness;0\a"
echo -ne "\033]6;1;bg;green;brightness;0\a"
echo -ne "\033]6;1;bg;blue;brightness;0\a"
echo -ne "\033]0;""\007"
DISABLE_AUTO_TITLE="true"
