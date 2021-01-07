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
if test -f $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
    export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
end

# rename tmux window
function window_rename --on-event fish_preexec
    if type -q tmux ;and set -q TMUX ;and test -n $argv[1]
        tmux rename-window (printf "%.8s" $argv[1])
    end
end

# pager
set -gx PAGER less
if type -q bat
    set -gx PAGER bat
    set -gx MANPAGER sh -c 'col -bx | bat -l man -p'
end
set -gx LESS --HILITE-UNREAD --ignore-case --jump-target=5 --LONG-PROMPT --RAW-CONTROL-CHARS

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

# asdf
if type -q asdf
    status --is-interactive; and source /usr/local/opt/asdf/asdf.fish
end

# gem bin
set -gx PATH (gem environment | egrep "EXECUTABLE DIRECTORY" | cut -d ':' -f 2 | cut -d ' ' -f 2) $PATH
set -gx GEM_ROOT (ruby -e 'print Gem.user_dir')

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
