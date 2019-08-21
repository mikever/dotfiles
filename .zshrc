# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# CONVENIENCE COMMANDS
# git commands
alias glod="git log --oneline --decorate"
alias gs="git status --short"
alias gaa="git add -A :/$*"
alias gcm="git commit -m $*"
alias gdt="git difftool"
# terminal commands
alias lal="ls -al"
alias cpwd="pwd | tr -d '\n' | pbcopy"
alias cat="ccat"
alias p2="python2.7"
alias p3="python3"
alias {v, vi, vim, nv}='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias rr='ranger'
# tmux commands
alias tm="tmux"
alias tml="tmux ls"
alias tmd="tmux detach"
alias tma="tmux attach"
alias tman="tmux a -t"
alias tmn="tmux new -s"
alias tmk="tmux kill-session"
alias tmka="tmux kill-session -a"
# shortcuts to common directories/files
alias pers="cd /Users/mveronie/personal-projects"
alias work="cd /Users/mveronie/work-projects"
alias dlog="nv /Users/mveronie/work-projects/dev-log/log.md"
# ssh logins
alias sand="ssh -A devservices"
alias glam="ssh -A glam"
alias seedst="ssh -A seedstest"
alias seeds="ssh -A seeds"
alias csis="ssh -A csis.at"
alias csist="ssh -A test.csis.at"
alias sls="ssh -A files-software.at"
alias slstest="ssh -A files-software-test.at"
alias apiat="ssh -A api.at"
alias apiatest="ssh -A api-test.at"
alias fexpress="ssh -A fileexpress"
alias imgcat="/usr/bin/imgcat"

# Ranger File Navigator - Make sure config is not loaded twice
    export RANGER_LOAD_DEFAULT_RC=false

# Visual Studio Code
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /*  ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# CD and LS
function cd {
    builtin cd "$@" && ls -F
}

# pyenv
eval "$(pyenv init -)"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ctags setup
ctags=/usr/local/bin/ctags

# zsh syntax highlighting - needs to be at the end of file
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# Git configuration for dotfiles
alias config='/usr/bin/git --git-dir=/Users/mveronie/.cfg/ --work-tree=/Users/mveronie'
