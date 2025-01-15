function docker-exec-root --wraps=docker\ exec\ -it\ -u\ 0\ \(docker\ ps\ \|\ fzf\ --header-lines\ 1\ \|\ awk\ \'\{print\ \$1\}\'\)\ bash --description alias\ docker-exec-root\ docker\ exec\ -it\ -u\ 0\ \(docker\ ps\ \|\ fzf\ --header-lines\ 1\ \|\ awk\ \'\{print\ \$1\}\'\)\ bash
  docker exec -it -u 0 (docker ps | fzf -1 --header-lines 1 | awk '{print $1}') bash $argv
end
