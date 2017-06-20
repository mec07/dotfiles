set -x PATH $HOME/bin $PATH
set -x EDITOR vim
set -x TERM 'xterm-256color'
set -x LANG en_GB.UTF-8
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# Aliases
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

# Autojump:
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

eval (python -m virtualfish auto_activation)

