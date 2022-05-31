function hp --wraps='hgrep $argv | bat --plain' --description 'alias hp=hgrep $argv | bat --plain'
  hgrep $argv | bat --plain;
end
