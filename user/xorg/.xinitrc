# ----------------------------------------
# X configuration
# ----------------------------------------

xrdb ~/.Xresources
xrandr --output eDP-1 --scale 1.25x1.25

# Prevent showing a cross cursor in polybar
xsetroot -cursor_name left_ptr

# Start WM
exec bspwm
