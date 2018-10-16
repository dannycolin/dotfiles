![Picture of the Two Dark Colorscheme](twodark.jpg)

# Two Dark Base16 Colorscheme

A Base16 colorscheme inspired by [One Dark][onedark] from [Atom Text Editor][atom].

## What's different from One Dark

In One Dark, only red and yellow colors have a dark version. So I've added the 
missing ones. I've calculed the difference between _lightred_ and _darkred_ 
colors of One Dark and I've substract the hex result (221c2f) to all the other 
colors except _color7_, _color8_ and _color15_.

To obtain _color15_, I've substract `282c34` to `ffffff`. For _color7_, 
I've substract `222222` to _color15_. I've done the same with _color0_ to
get _color8_ but in that case I've added `222222`.

| Xresources | Hex     | Name         | 
| :------    | :------ | :----------- |
| color0     | #282c34 | darkblack    |
| color8     | #4a4e56 | lightblack   |
| color1     | #be5046 | darkred      |
| color9     | #e06c75 | lightred     |
| color2     | #76a74a | darkgreen    |
| color10    | #98c379 | lightgreen   |
| color3     | #c3a44c | darkyellow   |
| color11    | #e5c07b | lightyellow  |
| color4     | #3f93c0 | darkblue     |
| color12    | #61afef | lightblue    |
| color5     | #a45cae | darkmagenta  |
| color13    | #c678dd | lightmagenta |
| color6     | #349a93 | darkcyan     | 
| color14    | #56b6c2 | lightcyan    |
| color7     | #b5b1a9 | darkwhite    |
| color15    | #d7d3cb | lightwhite   |

[atom]: https://atom.io
[onedark]: https://github.com/atom/one-dark-syntax
