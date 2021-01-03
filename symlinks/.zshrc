# Basics
export LANG=en_US.UTF-8
autoload -U compinit && compinit
HISTFILE=~/.zsh_history

# Set config for tabbing
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# Better history searching
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Prompt
setopt PROMPT_SUBST
PROMPT='%F{cyan}%c$(GIT_PROMPT)%f '

function GIT_PROMPT() {
  # Get branch name or short SHA1 commit hash. Fails and exits when not in a git directory
  reference=$(GIT_PROMPT_WRAPPER symbolic-ref HEAD 2> /dev/null) || \
  reference=$(GIT_PROMPT_WRAPPER rev-parse --short HEAD 2> /dev/null) || return 0
  REFERENCE=${reference#refs/heads/}
  echo "%F{white}.$(GIT_STATUS_COLOR)${REFERENCE}"
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
alias ls="ls --color=auto"
alias l="ls -lahF"
alias reload='source ~/.zshrc'
alias find_big_files='du -hs $(ls)'

alias glog='git log --oneline --decorate --graph --all'
alias gst="git status"
alias gco="git checkout"
alias gitupdate="git pull --all && git fetch --prune"
alias gitcleanbranches="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"

alias tkill="tmux kill-server"
tdev() {
  tmux new-session -d -s dev
  tmux new-window -n dev
  tmux split-window -h
  tmux split-window -v
  tmux selectp -t 0
  tmux attach -t dev
}

f() {
	grep -rl "$1" .
}

# Source z
[[ -r "/usr/local/etc/profile.d/z.sh" ]] && . /usr/local/etc/profile.d/z.sh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Do this only on macos
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
