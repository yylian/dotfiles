# Load files
source ~/.bash-aliases
source ~/.constants
# z
source /usr/local/etc/profile.d/z.sh

export ZSH="/Users/$USER/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Add plugins wisely, as too many plugins slow down shell startup.
plugins=( git gitfast z )

# Path configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/opt/local/sbin"

export PATH="$PATH:$HOME/.dotnet/tools/"

# Set titlebar color
echo -e -n "\033]6;1;bg;red;brightness;0\a"
echo -e -n "\033]6;1;bg;green;brightness;0\a"
echo -e -n "\033]6;1;bg;blue;brightness;0\a"

# Set title for titlebar
echo -ne "\033]0;""\007"

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
