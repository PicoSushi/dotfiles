function fish_prompt
    ~/bin/powerline-go -max-width 0 -colorize-hostname -error $status -shell bare -modules aws,terraform-workspace,venv,user,host,ssh,cwd,perms,jobs,git,hg,exit -newline
end

function fish_greeting
    if type -q pup
        if type -q ponysay
            timeout --preserve-status --signal=KILL 2 curl --silent 'https://saizeriya-1000yen.herokuapp.com/get' | pup 'div.box > h2 text{}' 2>/dev/null | ponysay
        else if type -q cowsay
            timeout --preserve-status --signal=KILL 2 curl --silent 'https://saizeriya-1000yen.herokuapp.com/get' | pup 'div.box > h2 text{}' 2>/dev/null | cowsay -n -f (cowsay -l | tail -n +2 | tr ' ' '\n' | sort -R | head -1)
        end
    end
end

# rename tmux window
function window_rename --on-event fish_preexec
    if test -n (echo $TERM | grep -e screen -e tmux) ;and test -n $argv[1]
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

# Rust
set -x PATH $PATH $HOME/.cargo/bin

# opam configuration
source /home/picosushi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
