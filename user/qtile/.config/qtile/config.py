import re
import sys

# Add user-specific packages to the import path
sys.path.append('.local/lib/python3.13/site-packages')

from libqtile import bar, layout, qtile, widget
from libqtile.backend.wayland import InputConfig
from libqtile.config import Click, Drag, Group, InvertMatch, Key, Match, MatchAll, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from floating_window_snapping import move_snap_window

mod = "mod4"
terminal = guess_terminal()

keys = [
    Key([mod], "a", lazy.spawn("rofi -show drun"), desc="Launch default application launcher"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([], "XF86AudioLowerVolume", lazy.widget["pulsevolume"].decrease_vol()),
    Key([], "XF86AudioMute", lazy.widget["pulsevolume"].mute()),
    Key([], "XF86AudioRaiseVolume", lazy.widget["pulsevolume"].increase_vol()),
    Key([], 'XF86MonBrightnessDown', lazy.spawn("brightnessctl s 10%-")),
    Key([], 'XF86MonBrightnessUp', lazy.spawn("brightnessctl s +10%")),
]

# Add key bindings to switch VTs in Wayland.
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

# Add groups and related keybinds.
groups = [
    Group("1", matches=[Match(wm_class=re.compile(r"firefox"))]),
    Group("2", matches=[Match(wm_class=re.compile(r"thunderbird"))]),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
    Group("0"),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key(
                [mod, "shift"],
                i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Bsp(
        border_focus="#357bcf",
        border_normal="#353535",
        border_width=1,
        fair=False,
        grow_amount=5,
        ratio=1.5,
    ),
    layout.Floating(
        border_focus="#357bcf",
        border_normal="#353535",
        border_width=1,
        float_rules=[
            # Run `qtile cmd-obj -o root -f windows` to find the WM_CLASS
            # and name.
            # Firefox Picture-in-Picture
            #MatchAll(
            #    Match(name=re.compile(r"Picture-in-Picture")),
            #    Match(wm_class=re.compile(r"firefox"))
            #),
            # Firefox About dialog
            MatchAll(
                Match(title=re.compile(r"About Firefox Nightly")),
                Match(wm_class=re.compile(r"firefox-nightly"))
            ),
        ]
    ),
]

widget_defaults = dict(
    font="Inter Bold",
    fontsize=14,
    padding=4,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active="#ffffff",
                    borderwidth=0,
                    disable_drag=True,
                    hide_unused=True,
                    highlight_method="block",
                    inactive="#ffffff",
                    margin_x=0,
                    other_current_screen_border="#357bcf",
                    padding=10,
                    rounded=False,
                    this_current_screen_border="#357bcf",
                    toggle=False,
                    use_mouse_wheel=False,
                ),
                widget.Spacer(),
                widget.Clock(
                  format="%a %d %b %H:%M",
                  timezone="America/Montreal"
                ),
                widget.Spacer(),
                widget.PulseVolume(
                    fmt="V: {}",
                    limit_max_volume=True,
                    step=5,
                ),
                widget.Battery(
                    charge_char="+",
                    discharge_char="-",
                    format="B:{char}{percent:2.0%}",
                ),
                #widget.Wlan(
                #    disconnected_message="Off",
                #    format="W: {percent:2.0%}",
                #    interface="wlp1s0",
                #    use_iw=True
                #),
                widget.StatusNotifier(
                    padding=4,
                ),
            ],
            32,
        ),
        wallpaper="~/Pictures/wallpapers/current.png",
        wallpaper_mode="fill",
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        move_snap_window(snap_dist=30),
        start=lazy.window.get_position()
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Configure input devices.
wl_input_rules = {
    "type:keyboard": InputConfig(
        kb_layout="us",
        kb_options="caps:escape",
        kb_variant="altgr-intl"
    ),
}

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 32

# Java UI toolkits hack
wmname = "LG3D"
