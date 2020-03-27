function pet-prev
  set line (echo $history[1])
  pet new $line
end
