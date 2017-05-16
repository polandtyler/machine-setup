# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/a664291/.oh-my-zsh
DEFAULT_USER=""
prompt_context(){ }

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add the following line to your ~/.bash_profile or ~/.zshrc file (and remember
# to source the file to update your current session):
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws docker jsontools npm nyan osx redis-cli)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ******************************************************************************************
# ************************************ ALIASES *********************************************
# ******************************************************************************************

## ZSH
alias zsh="atom ~/.zshrc"
alias reload="source ~/.zshrc"

## GIT
alias gs="git status"
alias gch="git checkout"
alias gc="git commit"
alias addall="git add -A"
alias add="git add"
alias ls="ll -a"
alias pull="git fetch && git pull"
alias push="git push origin"
alias clone="git clone"

## VIM
alias vimreload="source ~/.vimrc"

## NAVIGATION
alias mcweb="cd ~/Development/work/mc-web"
alias personal="cd ~/Development/personal_learning/learning"

## DOCKER
alias dockerClean="docker rmi $(docker images | grep "^<none>" | awk "{print $3}")"
# Stop all containers
dockerStop() { docker stop $(docker ps -a -q); }
# Remove all containers
dockerRemove() { docker rm $(docker ps -a -q); }
# Stop and Remove all containers
alias dockerNuke='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

## AWS
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
export AWS_DEFAULT_PROFILE="soke"

# remove that annoying username (called @ top)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)"
  fi
}
