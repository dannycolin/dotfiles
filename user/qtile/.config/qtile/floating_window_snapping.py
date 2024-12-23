"""
Floating Window Snapping

A Qtile plugin that allows floating window to automatically snap to other windows
and screens.

Usage:

1. Put this file in the same folder as your Qtile's config.py file
   (default: ~/.config/qtile/)
2. In config.py, add:
```
from floating_window_snapping import move_snap_window

mouse = [
    Drag(
        [mod],
        "Button1",
        move_snap_window(snap_dist=20),
        start=lazy.window.get_position()
    ),
]
```
3. snap_dist (default 20) controls how many pixels the mouse has to move
before a snapped window will un-snap.
~10 for light strength snapping, ~20-30 for medium and higher for high res
displays or high dpi mice.

Tested on Qtile 0.29.0 under Wayland

TODO:
* Border snapping on floating window resize
* Reuse border detection logic in https://github.com/qtile/qtile/pull/4557/files
"""

from libqtile.lazy import lazy

def _get_borders(window):
    """Generate list of 4-tuples describing
    the borders including border width of every window and screen.
    """
    borders = []
    for s in window.qtile.screens:
        borders.append((s.x, s.y, s.x + s.width, s.y + s.height))
        for w in s.group.windows:
            if w.is_visible:
                borders.append((w.x, w.y, w.x+w.width+2*w.borderwidth, w.y+w.height+2*w.borderwidth))
    borders.remove((window.x, window.y, window.x+window.width+2*window.borderwidth, window.y+window.height+2*window.borderwidth))
    return borders

def _borders_touch(window, x, y, snap_dist):
    """Compares this window's borders to the borders of other
    windows/screens to see if they touch.
    """
    overlap_args = {"x": x, "y": y}
    borders = _get_borders(window)
    for b in borders:
        # Are the two borders on the same line
        if any(i in [window.x, window.x+window.width+2*window.borderwidth] for i in [b[0], b[2]]):
            # Are they actually overlapping
            if window.y < b[3] and (window.y + window.height) > b[1]:
                # Has the mouse moved outside of the snap area
                if abs(window.x - x) < snap_dist or abs((window.x+window.width) - x) < snap_dist:
                    try:
                        # Window should snap so don't move along this axis
                        del overlap_args["x"]
                    except Exception:
                        pass
        # Repeat for y
        if any(i in [window.y, window.y+window.height++2*window.borderwidth] for i in [b[1], b[3]]):
            if window.x < b[2] and (window.x+window.width) > b[0]:
                if abs(window.y - y) < snap_dist or abs((window.y+window.height) - y) < snap_dist:
                    try:
                        del overlap_args["y"]
                    except Exception:
                        pass
    return overlap_args


@lazy.window.function
def move_snap_window(window, x, y, snap_dist=20):
    """Move floating window to x and y.
    Border snapping makes floating window's borders
    stick to other borders for easy alignment
    """
    window._tweak_float(**_borders_touch(window, x, y, snap_dist))
