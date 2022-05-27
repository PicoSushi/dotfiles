#!/usr/bin/env bash
set -x

# run (only once) processes which spawn with the same name
function run {
    if ! pgrep "$1" ; then
        $@&
    fi
}

# run (only once) processes which spawn with different name
if ! pgrep gnome-keyring-d ; then
    gnome-keyring-daemon --daemonize --login &
fi
if ! pgrep pulseaudio ; then
    start-pulseaudio-x11 &
fi
if ! pgrep polkit-mate-aut ; then
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
fi
if ! pgrep xfce4-power-man ; then
    xfce4-power-manager &
fi

# run xfsettingsd
run nm-applet
run variety

# run light-locker
run xscreensaver --no-splash

# run compton --shadow-exclude '!focused'
run picom -b
run pcmanfm --daemon-mode

# run xcape -e 'Super_L=Super_L|Control_L|Escape'
run thunar --daemon
run pa-applet
run pamac-tray

run VBoxClient-all

if [ -d ~/Pictures/Wallpapers ]; then
    feh --randomize --bg-fill "${HOME}/Pictures/Wallpapers"
fi

