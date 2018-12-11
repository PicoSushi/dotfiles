function fish_prompt
    ~/bin/powerline-go -max-width 0 -colorize-hostname -error $status -shell bare -modules aws,terraform-workspace,venv,user,host,ssh,cwd,perms,jobs,git,hg,exit -newline
end

function fish_right_prompt
    set ok_kaomoji "('_')"
    set ng_kaomoji "(>_<)\n(;_;)"

    if [ $status -eq 0 ]
        set_color green
        printf $ok_kaomoji | sort -R | head -1
        set_color normal
    else
        set_color red
        printf $ng_kaomoji | sort -R | head -1
        set_color normal
    end
    echo -n "["
    date "+%Y/%m/%d %H:%M:%S"
    echo -n "]"
end
