# -*- Mode: shell-script;coding:utf-8 -*- #
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt fade

setopt histignorealldups sharehistory
setopt auto_cd

# Use emacs keybindings
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

function powerline_precmd() {
    PS1="$($GOPATH/src/github.com/$USER/powerline-go/powerline-go -error $? -shell zsh)"
}

# ================================================================
# powerline-go
# ================================================================
function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# ================================================================
# pet
# ================================================================
function pet-select() {
    BUFFER=$(pet search --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

# ================================================================
# zplug
# ================================================================
if [[ -f /usr/share/zplug/init.zsh ]]; then
    source /usr/share/zplug/init.zsh

    if ! zplug check --verbose; then
        printf "Install zplug? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi

    # Searching like fish
    zplug "zsh-users/zsh-history-substring-search"
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down

    # Additional completion definitions for Zsh
    zplug "zsh-users/zsh-completions", depth:1

    # enhancd
    zplug "b4b4r07/enhancd", use:init.sh
    export ENHANCD_COMMAND="c"

    zplug "mollifier/cd-gitroot"

    zplug "rupa/z", use:z.sh

    # better than zsh-users/zsh-syntax-highlighting
    zplug "zdharma/fast-syntax-highlighting", defer:2

    zplug load
fi

if [[ -f ~/.alias ]]; then
    source ~/.alias
fi

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ -d $HOME/.local/google-cloud-sdk ]]; then
    # The next line updates PATH for the Google Cloud SDK.
    source "$HOME/.local/google-cloud-sdk/path.zsh.inc"

    # The next line enables shell command completion for gcloud.
    source "$HOME/.local/google-cloud-sdk/completion.zsh.inc"
fi
