# source nix
. $HOME/.nix-profile/etc/profile.d/nix.sh

###########################################
# Checkout.com specific
###########################################
export AWS_VAULT_KEYCHAIN_NAME=login
export GOPRIVATE="github.com/processout/*"
source ~/.kube/load_kubeconfigs.sh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"

# Set right hand prompt to the time
#RPROMPT='[%D{%F}T%*]'
#TMOUT=1
#TRAPALRM() {
#    zle reset-prompt
#}

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
  bb
  git
  gh
  ssh-agent
  virtualenv
  kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#
############################
# Go setup
############################
# In next laptop setup, remove the GOPATH line (let it default to $HOME/go)
export GOPATH="$HOME"
export PATH=$GOPATH/bin:$PATH
export GO111MODULE="on"

# Add the development version of go to path so that it uses that
function godev() {
	export PATH=$HOME/go_dev/go/bin:$PATH
}

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

############################
# git aliases
############################
alias gstat='git status'
alias gadd='git add -u'
alias gco='git checkout'
alias gcom='git commit -m'
alias gpush='make test lint && git push'
alias glog='git log'
alias gfetch='git fetch --all'
alias gpull='git pull --rebase'
alias gbranch='git checkout -b'
alias gbranchdel='git branch -D'
function gbranchname() {
	echo $(git symbolic-ref HEAD | cut -d'/' -f3)
}
function gupstream() {
	git push --set-upstream origin $(gbranchname)
}
function gempty() {
	if (( $# == 0 )) then
		git commit --allow-empty -m "build"
	else
		git commit --allow-empty -m $1
	fi
}
function gbranchls() {
	if (( $# == 0 )) then
		git branch --sort=-committerdate | head -n 10
	else
		git branch --sort=-committerdate | head -n $1
	fi
}
export GPG_TTY=$(tty)

############################
# kubectl aliases
############################
#export COC_DEV_CONFIG="/Users/marc/src/github.com/shellagilehub/secrets/environments/azure/westeurope/dev/01/coconutconfig"
#export COC_TEST_CONFIG="/Users/marc/src/github.com/shellagilehub/secrets/environments/azure/westeurope/test/01/coconutconfig"
#export COC_PROD_CONFIG="/Users/marc/src/github.com/shellagilehub/secrets/environments/azure/westeurope/prod/01/coconutconfig"
#alias kd='kubectl --kubeconfig=$COC_DEV_CONFIG'
#alias kt='kubectl --kubeconfig=$COC_TEST_CONFIG'
#alias kp='kubectl --kubeconfig=$COC_PROD_CONFIG'
alias k='kubectl'

############################
# copy & paste
############################
alias pbcopy="xclip -sel clip"
alias pbpaste='xclip -selection clipboard -o'

############################
# FZF
############################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

############################
# direnv
############################
eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marccoury/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marccoury/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marccoury/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marccoury/google-cloud-sdk/completion.zsh.inc'; fi


############################
# handy timestamp commands
############################
alias epoch="date +%s"
alias epochms="date +%s000"
ts () {
    date -u -r $((${1:?}))
}
tsms () {
    date -u -r $((${1:?}/1000))
}

alias resetclock="sudo hwclock -s"
