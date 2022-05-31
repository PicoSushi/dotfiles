# Defined in - @ line 0
function screenshot --description 'alias screenshot '
	  set --local current_date (date +%Y-%m-%d_%H-%M-%S)
    mkdir -p ~/Pictures/Screenshots
    import ~/Pictures/Screenshots/{$current_date}.png
    xdg-open ~/Pictures/Screenshots/{$current_date}.png
end
