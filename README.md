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

Code structure:

```
.
├── i3bar.lua      -- entry program
├── util.lua       -- utility functions
├── conkyrc.lua    -- example conkyrc (conky config)
├── bin            -- external executable dependencies
├── components     -- modular drawable components
└── resource       -- dumb resource files(image, etc.)
```

the process to add a new component:

1. create `your_component.lua` under `/components`.
2. in `/i3bar.lua`, declare your component in the beginning like other components do.
3. draw your component with `draw_component` function

Never doubt about font settings in `draw_component` function, it's just a prest, you can set your own font style inside component drawing logic(i.e. in `/components/your_component.lua`)

A component is a function, the simlest component is `/components/arch_logo.lua`, it just draw an image under `/resource/arch-logo.svg`:

```lua
-- we need the util function to easily draw an SVG image
-- see `/util.lua` to see all util functions
local util = require 'util'

-- an Arch Linux logo <(=*/ω＼*=)>
-- every component function get a single `opt` argument
--    it contains(for detailed list, see `draw_component` function in `/i3bar.lua`):
--        - useful variables
              cr: current drawing cairo context,
                  needed with usage of any cairo related operations
              RESOURCE_PATH: `/resource` path
--        - position parameter from `draw_component` function
--              opt.x, opt.y
return function (opt)
    util.draw_svg({cr = opt.cr,
              x = opt.x, y = opt.y + 5,
              h = 20, w = 20,
              file = opt.RESOURCE_PATH .. 'arch-logo.svg'})
end
```

Keep in mind, the component is a Lua script, so you can do anything to an "input" you want with Lua, and display an "output" by drawing with Cairo functions on `opt.cr`.

For Cairo usage, see: https://www.cairographics.org/manual/ , the Lua interface is very identical to the documentation's C expression(without type signature)

# Credits

- [anowplaying.py](https://github.com/diadara/conky-clementine/blob/master/anowplaying.py) script for Clementine status.
- [ ろうか @rouka0101](https://twitter.com/rouka0101)'s AWWWWEEEESOOOMEEE Chino illustration in screenshot.
