function gsw
        # ブランチ一覧を取得（ローカル + リモート）
        # --format で整形し、HEAD や現在のブランチを除外
        set -l branch (git branch --all --color=always --format='%(refname:short)' | \
                    string match -v "*HEAD*" | \
                    fzf \
                        --ansi \
                        --reverse \
                        --border \
                        --prompt "Switch Branch > " \
                        --preview "git log --oneline --graph --color=always -n 10 (string replace 'origin/' '' {})"
            )
    
        if test -n "$branch"
                # リモートブランチ（origin/xxx）を選択した場合は origin/ を削って switch
                set -l target (string replace -r '^origin/' '' $branch)
                git switch $target
        end
end
