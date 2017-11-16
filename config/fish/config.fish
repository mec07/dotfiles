set -x PATH $HOME/bin /Library/TeX/texbin $HOME/go/bin $PATH
set -x EDITOR vim
set -x TERM 'xterm-256color'
set -x LANG en_GB.UTF-8
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x GOPATH ~/go
set -x GOBIN ~/go/bin

##############################################################################
# Aliases
##############################################################################
function gstat
	git status
end

function gadd
	git add -u $argv
end

function gco
	git checkout $argv
end

function gmerge
	git merge --squash $argv
end

function gupstream
	git push --set-upstream origin (git_branch_name)
end

function gbranch
	git checkout -b $argv
end

function gpush
	git push
end

function swap
	kubectl config use-context $argv
end

function FZF
	fzf | read -l result; and vim $result
end

##############################################################################
# OMF
##############################################################################
# Path to oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf

# Path to oh-my-fish configuration.
set -g OMF_CONFIG $HOME/.config/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

##############################################################################
# Autojump:
##############################################################################
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

##############################################################################
# Virtual fish -- Has to be done last
##############################################################################
eval (python -m virtualfish auto_activation)

