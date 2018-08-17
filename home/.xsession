export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
xcompmgr &                      # transparency
pcmanfm -d &
nm-applet --sm-disable &

# Keyboard
setkbmap dvorak
xmodmap .Xmodmap

# Screensaver
xscreensaver -no-splash &

# Run some Terminal
if [[ -x /usr/bin/terminator ]]; then terminator &
elif [[ -x /usr/bin/urxvt ]]; then urxvt &
fi

# Run Enpass
if [[ -x /opt/Enpass/bin/runenpass.sh ]]; then /opt/Enpass/bin/runenpass.sh &
fi

if [[ -x /usr/bin/vmware-user ]]; then
    /usr/bin/vmware-user
elif [[ -x /usr/bin/VBoxClient ]]; then
    :
else
    if [ $(head -1 /proc/meminfo| awk '{print int($2/1024/1000)}') -ge 4 ] && false; then
        if  hash firefox >& /dev/null; then
            firefox
        fi
    fi
fi

# 前回異常終了していた場合、ロックファイルを削除してEmacsを起動
if [ -f $HOME/.emacs.desktop.lock ]; then
    if [ ! $(ps -p $(cat $HOME/.emacs.desktop.lock) -o comm=) = "emacs" ]; then
        rm $HOME/.emacs.desktop.lock
    fi
fi
emacs &

if [[ -x "$HOME/Enpass/runenpass.sh" ]]; then
    $HOME/Enpass/runenpass.sh &
fi

if [[ -x /usr/bin/dropbox ]]; then
    dropbox start
fi

# Setup X
feh --recursive --randomize --bg-fill $HOME/Pictures/Wallpapers/*
exec awesome
