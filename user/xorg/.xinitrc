# Fix Gnome apps slow to start due to failing services (dbus timeout)
# This happens if you have flatpak and especially the xdg-desktop-portal package
# installed on your system
#
# See:
# - https://github.com/flatpak/xdg-desktop-portal-gtk/issues/72
# - https://dbus.freedesktop.org/doc/dbus-update-activation-environment.1.html
#dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment --systemd DISPLAY XAUTHORITY
fi

# Load Xresources on boot
xrdb ~/.Xresources

# Set wallpaper
sh .fehbg

# Set default mouse pointer
#
# This is needed to prevent showing a cross pointer when hovering polybar
xsetroot -cursor_name left_ptr

# Xorg fails to boot when the eGPU is connected so we need to run
# `xrandr --auto`. This is probably due to the HiDPi configuration
# in my dotfiles.
#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --output eDP-1-1 --scale 1.25x1.25

# Start the WM
#exec bspwm
exec qtile start
