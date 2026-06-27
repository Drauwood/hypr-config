#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
#  Hyprland
#fi

if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
. "$HOME/.cargo/env"
