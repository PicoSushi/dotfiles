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

# rename tmux window
function window_rename --on-event fish_preexec
    if test -n (echo $TERM | grep -e screen -e tmux) && test -n $argv[1]
        tmux rename-window (printf "%.16s" $argv[1])
    end
end

# pager
set -gx PAGER less
if type -q bat
    set -gx PAGER bat
end

set -gx EDITOR nano
if type -q jed
    set -gx EDITOR jed
end

# direnv
if type -q direnv
    eval (direnv hook fish)
end

# rbenv
if type -q rbenv
    status --is-interactive; and source (rbenv init -|psub)
end

# gem bin
set -gx PATH (gem environment | egrep "EXECUTABLE DIRECTORY" | cut -d ':' -f 2 | cut -d ' ' -f 2) $PATH

# Golang
set -x GOPATH $HOME
set -x PATH $PATH $HOME/bin
