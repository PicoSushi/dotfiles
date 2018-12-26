# Defined in - @ line 0
function gcd --description 'alias gcd cd (ghq root)/(ghq list | fzf)'
	cd (ghq root)/(ghq list | fzf) $argv;
end
