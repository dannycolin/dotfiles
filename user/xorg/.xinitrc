# Load Xresources on boot
xrdb ~/.Xresources

# Set wallpaper
sh .fehbg

# Set default mouse pointer
# 
# This is needed to prevent showing a cross pointer when hovering polybar
xsetroot -cursor_name left_ptr

# Start the WM
exec bspwm
