# ----------------------------------------
# X configuration
# ----------------------------------------

xrdb ~/.Xresources
xrandr --auto
xrandr --output eDP-1 --scale 1.25x1.25
xrandr --output eDP-1-1 --set "scaling mode" "Full aspect"

# Prevent showing a cross cursor in polybar
xsetroot -cursor_name left_ptr

# Start WM
exec qtile start
