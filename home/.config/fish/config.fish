function fish_prompt
    ~/bin/powerline-go -max-width 0 -colorize-hostname -error $status -shell bare -modules aws,terraform-workspace,venv,user,host,ssh,cwd,perms,jobs,git,hg,exit -newline
end

function fish_right_prompt
    set ok_kaomoji "('_')\n(◕‿◕)"
    set ng_kaomoji "(>_<)\n(;_;)\n(〃＞＿＜;〃)"

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
    if [ -z {$BUNDLE_GEMFILE} ];
        echo ''
    else
        echo '('; and echo {$BUNDLE_GEMFILE} | rev | cut -d '/' -f 2 | rev; and echo ')'
    end
end
rvm default

# direnv
eval (direnv hook fish)

# ruby
# rbenv init - | source
# set -gx PATH (gem environment | egrep "USER INSTALLATION DIRECTORY" | cut -d ':' -f 2 | cut -d ' ' -f 2)/bin $PATH

# rbenv
status --is-interactive; and source (rbenv init -|psub)

set -gx EDITOR nano
if type -q jed
    set -gx EDITOR jed
end
