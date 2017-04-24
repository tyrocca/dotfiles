#!/bin/bash

verify_tmux_version () {
    tmux_home=~/dotfiles/tmux
    tmux_version="$(tmux -V | cut -c 6-)"

    if [ -f /usr/bin/tmux-next ] || [ "$(echo "$tmux_version >= 2.1" | bc)" -eq 1 ] ; then
        tmux source-file "$tmux_home/tmux-mac.conf"
        exit
    elif [[ $(echo "$tmux_version >= 1.9" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/tmux_1.9_to_2.1.conf"
        exit
    elif [[ $(echo "$tmux_version <= 1.9" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/tmux-linux.conf"
        exit
    else
        tmux source-file "$tmux_home/tmux-mac.conf"
        exit
    fi
}
verify_tmux_version
