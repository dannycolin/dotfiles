from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile import hook, layout

from typing import List  # noqa: F401

import os
import subprocess

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart')
    subprocess.call([home])

# ------------------------------
# Variables
# ------------------------------
mod = "mod4"

# ------------------------------
# Keybinds
# ------------------------------
keys = [
    # Switch between windows in current stack pane
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),

    # Move windows up or down in current stack
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    
    # Start terminal
    Key([mod], "Return", lazy.spawn("xterm")),
    
    # Kill application 
    Key([mod, "shift"], "q", lazy.window.kill()),

    # Open app lancher
    Key([mod], "a", lazy.spawn("rofi -show drun")),
    
    # Reload Qtile configuration
    Key([mod, "shift"], "r", lazy.restart()),
]

# ------------------------------
# Workspaces
# ------------------------------
groups = [
    Group("1"),
    Group("2", matches=[Match(wm_class=["Nightly"])]),
    Group("3"),
    Group("4", matches=[Match(wm_class=["Thunderbird"])]),
    Group("5", 
        matches=[
            Match(wm_class=["Gimp"]),
            Match(wm_class=["Inkscape"])
        ]
    ),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
    Group("0", label="10")
]

for group in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], group.name, lazy.group[group.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name)),
    ])

layouts = [
    layout.Bsp(
        border_focus = "#0a84ff",
        border_normal = "#2a2a2e",
        fair = False
    )
]

# Remove default bottom bar
screens = [Screen(bottom=None)]

# ------------------------------
# Mouse
# ------------------------------

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

# ------------------------------
# General
# ------------------------------
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# Prevent reparenting for Java applications
wmname = "LG3D"

