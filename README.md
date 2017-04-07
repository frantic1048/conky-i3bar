# conky-i3bar

Real conky window as i3bar replacement, works with trayer.

![screenshot](https://u.nya.is/buemoq.png)

# Feature

- i3wm workspace status
- system load diagram
- NVIDIA graphic card load diagram
- date & time
- Clementine current playing music



# Dependencies

- Conky with Lua binding, of course !
- luajson (for processing i3's output)
- Python3 (for python script to get Clementine status)
- trayer (if you want a systray)


# Usage

```
git clone https://github.com/frantic1048/conky-i3bar.git
conky -c conky-i3bar/conkyrc.lua &

# show sys tray wit trayer
trayer --edge bottom \
    # more options you like
    --aligin right \
    --SetDockType true &


# forget about i3bar (｢・ω・)｢
```



# Credits

- [anowplaying.py](https://github.com/diadara/conky-clementine/blob/master/anowplaying.py) script for Clementine status.
