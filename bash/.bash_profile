export PATH=$PATH:/Users/mcoury/bin

alias ls='ls -a -G'
alias ll='ls -l'

# python virtual environment
#alias venv='source ./venv/bin/activate'
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# terminal colours
export CLICOLOR=1
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
export LSCOLORS=GxFxCxDxBxegedabagaced


# git shortcuts
alias gstat='git status'
alias gadd='git add -u'
alias gpush='git push'
alias glog='git log'
alias gfetch='git fetch --all'
alias gpull='git pull --rebase'
alias swap='kubectl config use-context'
alias k='kubectl'
