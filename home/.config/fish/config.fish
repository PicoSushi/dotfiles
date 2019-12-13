# ================
# Set PATHes
# ================

# Pyenv
if test -d $HOME/.pyenv
    set -x PYENV_ROOT $HOME/.pyenv
end

# Golang
set -x GOPATH $HOME
set -x PATH $PATH $HOME/bin

# Rust
if test -d $HOME/.cargo/bin
    set -x PATH $PATH $HOME/.cargo/bin
end

# iTerm2
if test -f $HOME/.iterm2_shell_integration.(basename $SHELL)
    source $HOME/.iterm2_shell_integration.(basename $SHELL)
end

function fish_prompt
    if type -q powerline-go
        ~/bin/powerline-go -max-width 0 -colorize-hostname -error $status -shell bare -modules aws,terraform-workspace,venv,user,host,ssh,cwd,perms,jobs,git,hg,exit -newline
    else
        echo [(whoami)@(hostname)](tput bold)(pwd)(tput sgr0)\n\>
    end
end

# rename tmux window
function window_rename --on-event fish_preexec
    if type -q tmux ; and test -n (echo $TERM | grep -e screen -e tmux) ;and test -n $argv[1]
        tmux rename-window (printf "%.8s" $argv[1])
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

# fcitx
if type -q fcitx
    export GTK_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export QT_IM_MODULE=fcitx
end

# fuck
if type -q thefuck
    thefuck --alias | source
end

# opam configuration
source /home/picosushi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# local config
export TERM=xterm
