# Load Xresources on boot
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start the WM
exec bspwm
