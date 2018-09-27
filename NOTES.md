# i3

## New Keybinding layout

| Key binding                | Action                              |
| :------------------------- | :---------------------------------- |
| Super + [0-9]              | Switch to workspace [0-9]           |
| Super + Shift + [0-9]      | Move application to workspace [0-9] |
| Super + d                  | Toggle float window                 |
| Super + f                  | Toggle fullscreen                   |
| Super + h                  | Focus left window                   | 
| Super + j                  | Focus bottom window                 |
| Super + k                  | Focus top window                    |
| Super + l                  | Focus right window                  |
| Super + Shift + h          | Move window to left                 |
| Super + Shift + j          | Move window to bottom               |
| Super + Shift + k          | Move window to top                  |
| Super + Shift + l          | Move window to right                |
| Super + m                  | Open menu                           |
| Super + Shift + r          | Restart i3                          |
| Super + x                  | Split window horizontally           |
| Super + y                  | Split window vertically             |
| Super + minus              | Shrink window horizontally          |
| Super + equal              | Grow window horizontally            |
| Super + Shift + underscore | Shrink window vertically            |
| Super + Shift + plus       | Grow window vertically              |
| ========================== | =================================== |
| Super + s                  | System mode                         |
|         p                  | Poweroff                            |
|         r                  | Restart                             |
| ========================== | =================================== |
| Super + a                  | Applications mode                   |
|         b                  | Web Browser                         |
|         c                  | Console (Terminal)                  |
|         e                  | Email Client                        |
|         f                  | File Manager                        |
|         g                  | Graphic Image Editor                |
|         i                  | IRC Client                          |
|         p                  | PDF Reader                          |
|         t                  | Text Editor                         |
|         v                  | Vector Image Editor                 |
|         w                  | Word Processor                      |
|         s                  | Spreadsheet                         |

## Snippets

### Resize window

bindsym $mod+minus resize shrink width 5 px or 5 ppt
bindsym $mod+equal resize grow width 5 px or 5 ppt
bindsym $mod+Shift+underscore resize shrink height 5 px or 5 ppt
bindsym $mod+Shift+plus resize grow height 5 px or 5 ppt

