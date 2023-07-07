import os
import subprocess

from typing import List

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.log_utils import logger

from extra import resize_left, resize_right

# Globals
mod = "mod4"
terminal = guess_terminal()

# Keybind
keys = [
    # Move window focus
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Resize windows
    Key([mod, "control"], "h", lazy.function(resize_left)),
    Key([mod, "control"], "l", lazy.function(resize_right)),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),


    # Volume
    Key([], "XF86AudioMute", lazy.widget["pulsevolume"].mute()),
    Key([], "XF86AudioRaiseVolume", lazy.widget["pulsevolume"].increase_vol()),
    Key([], "XF86AudioLowerVolume", lazy.widget["pulsevolume"].decrease_vol()),
    # Brightness
    Key([], 'XF86MonBrightnessDown', lazy.spawn("brightnessctl s 10%-")),
    Key([], 'XF86MonBrightnessUp', lazy.spawn("brightnessctl s +10%")),

    # System Mode
    KeyChord([mod, "shift"], "s", [
        Key([], "p", lazy.spawn("systemctl poweroff")),
        Key([], "r", lazy.spawn("systemctl reboot")),
        Key([], "l",
            lazy.spawn("i3lock -i ~/Pictures/wallpapers/current.png"))],
        mode=True,
        name="System"
    ),

    # Others
    Key([mod], "a", lazy.spawn("rofi -show drun")),
    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod], "Return", lazy.spawn(terminal)),
    # reload_config hasn't been released yet. It'll be needed on Wayland.
    # Key([mod, "shift"], "r", lazy.reload_config()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.window.kill()),
]

# Groups
groups = [
    Group("1"),
    Group("2", matches=[Match(wm_class=["Firefox", "Nightly", "Navigator", "Devtools"])]),
    Group("3", matches=[Match(wm_class=["Thunderbird", "Daily", "Mail"])]),
    Group("4", matches=[Match(wm_class=["discord"])]),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
    Group("0", label="10")
]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False)),
    ])

# Layouts
layouts = [
    layout.Bsp(
        border_focus="#15539e",
        border_normal="#353535",
        border_width=2,
        fair=False,
        grow_amount=5,
        ratio=1.5
    ),
    layout.Floating(
        border_focus="#357bcf",
        border_normal="#353535",
        border_width=2
    )
]

# Screen
topbar = bar.Bar(
    [
        widget.GroupBox(
            disable_drag=True,
            hide_unused=True,
            highlight_method="text",
            this_current_screen_border="357bcf"
        ),
        widget.Spacer(length=bar.STRETCH),
        widget.Clock(
          format="%a %d %b %H:%M"
        ),
        widget.Spacer(length=bar.STRETCH),
        widget.Battery(format="B: {percent:2.0%}"),
        widget.PulseVolume(
            fmt="V: {}",
            limit_max_volume=True,
            step=5
        ),
        widget.Wlan(
            disconnected_message="Off",
            format="W: {percent:2.0%}",
            interface="wlp170s0"
        ),
        widget.Systray(icon_size=32),
        widget.Wallpaper(
            directory="~/Pictures/wallpapers/",
            label="",
            wallpaper="fedora12-wallpaper.png"
        )
    ],
    64,
)
screens = [
  Screen(
      top=topbar
  )
]

widget_defaults = dict(
    font="Canterell Bold",
    fontsize=26
)

# Floating windows
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_instance_class="Browser", wm_class="Nightly"),
    Match(wm_instance_class="Browser", wm_class="firefox-nightly"),
    Match(wm_instance_class="Browser", wm_class="Firefox")
])

# Other
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = "floating_only"
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

# Play nice with Java applications
wmname = "LG3D"

# Autostart
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart')
    subprocess.call([home])

#@hook.subscribe.screen_change
#def onScreenChange(_):
#    lazy.restart() # qtile is not defined...
