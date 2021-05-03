# Defined interactively
function weather
curl --fail --silent --show-error --location --max-time 1 'wttr.in?format=3' 2>/dev/null
end
