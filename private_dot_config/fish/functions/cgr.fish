function cgr --wraps='cd (git rev-parse --show-toplevel)' --description 'alias cgr cd (git rev-parse --show-toplevel)'
  cd (git rev-parse --show-toplevel) $argv
        
end
