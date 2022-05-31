# Defined in /home/picosushi/.config/fish/functions/gcd.fish @ line 2
function gcd --description 'alias gcd cd (ghq root)/(ghq list | fzf)'
	cd (ghq root)/(ghq list | fzf) $argv;
end
