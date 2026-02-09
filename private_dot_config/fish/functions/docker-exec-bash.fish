function docker-exec-bash --wraps="docker exec -it (docker ps | fzf -1 --header-lines 1 | awk '{print \$1}') bash " --wraps='docker exec' --description 選択したコンテナに指定ユーザーでbashログイン
    # 1. コンテナIDを取得
    set -l container_id (docker ps | fzf -1 --header-lines 1 | awk '{print $1}')
    # 2. コンテナが選択されなかった場合は終了
    if test -z "$container_id"
        return 1
    end
    # 3. 実行。$argv を bash の前に入れることで -u オプションなどが効くようになる
    docker exec -it $argv $container_id bash
end
