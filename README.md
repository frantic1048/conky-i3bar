# conky-i3bar

A real conky window as an i3bar replacement, works with [tint2](https://gitlab.com/o9000/tint2).

![screenshot](https://i.imgur.com/rzcltXb.png)

# Feature

- i3wm workspace status
- system load diagram
- NVIDIA graphic card load diagram
- date & time
- Clementine current playing music
- systray (provided by tint2)


# Dependencies

- Conky with Lua binding, of course!
- luajson (for processing i3's output)
- Python3 (for python script to get Clementine status)
- tint2 (systray support, other individual systray apps is fine)


# Usage

```sh
git clone https://github.com/frantic1048/conky-i3bar.git
conky -c conky-i3bar/conkyrc.lua &

# show sys tray with tint2
#
# NOTE:
#   tint2 has a GUI configuration tool
#   just configure it to what you like
#   
#   or you may want to take a look at frantic1048's config:
#   https://github.com/frantic1048/Vanilla/blob/master/tint2/.config/tint2/tint2rc
#   
#   to work with conky-i3bar
#   configure it with only trayicons is fine
tint -c ~/.config/tint2/tint2rc &


# forget about i3bar (｢・ω・)｢
```

# Tips

## To get the best visual

- A compositor(like [compton](https://wiki.archlinux.org/index.php/Compton)) is recommended. Thus you can make the systray become transparent and even blurred.
- A minimal terminal emulator like [Sakura](https://launchpad.net/sakura) and [Alacritty](https://github.com/jwilm/alacritty) with transparent background config.
- i3-frame with a transparent background.
- If you code much, an editor with full transparent background is recommended, like editors in terminal, or [Atom with transparent patch](https://aur.archlinux.org/packages/atom-editor-transparent/) with a full transparent flavor UI theme(e.g. [Tia-ui](https://atom.io/packages/tia-ui))

## HACKING TO THE GATE

TBD.

# Credits

- [anowplaying.py](https://github.com/diadara/conky-clementine/blob/master/anowplaying.py) script for Clementine status.
- [ ろうか @rouka0101](https://twitter.com/rouka0101)'s AWWWWEEEESOOOMEEE Chino illustration in screenshot.
