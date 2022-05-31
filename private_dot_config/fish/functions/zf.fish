# Defined in - @ line 0
function zf --description 'alias zf cd (z -l | cut -c 12- | fzf)'
	cd (z -l | cut -c 12- | fzf --no-sort) $argv;
end
