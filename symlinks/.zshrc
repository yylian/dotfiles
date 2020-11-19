# Basics
export PATH="/usr/local/bin:/usr/bin:/bin:/opt/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/local/sbin"

# z
source /usr/local/etc/profile.d/z.sh

# zsh
export ZSH="/Users/$USER/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# plugins
plugins=( git gitfast z tmux )

# git-prompt
PROMPT='%{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info) '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}@%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[003]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[049]%}"

function git_prompt_info() {
  local ref
  if [[ "$(command git config —get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse —short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Alias
alias l="ls -lah -G"
alias reload='source ~/.zshrc'
alias find_big_files='du -hs $(ls)'

alias git="LANG=en_GB git"
alias glog='git log --oneline --decorate --graph --all'
alias gst="git status"
alias gco="git checkout"
alias gitupdateandclean="git pull --all && git fetch --prune && git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"

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