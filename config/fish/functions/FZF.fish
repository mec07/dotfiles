function FZF
	fzf | read -l result; and vim $result
end
