function ls --wraps=lsd --description 'alias ls lsd'
  if type -q lsd
    lsd $argv
  else
    command ls $argv
  end
end
