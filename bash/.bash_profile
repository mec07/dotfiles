export PATH=$PATH:/Users/mcoury/bin

alias ls='ls -a'
alias ll='ls -l'

# python virtual environment
#alias venv='source ./venv/bin/activate'
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh



# git shortcuts
alias gstat='git status'
alias gadd='git add -u'
alias gpush='git push'
alias glog='git log'
alias gfetch='git fetch --all'
alias gpull='git pull --rebase'
alias swap='kubectl config use-context'
alias k='kubectl'
