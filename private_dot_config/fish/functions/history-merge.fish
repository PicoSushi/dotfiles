function history-merge --on-event fish_preexec
  history save
  history merge
end
