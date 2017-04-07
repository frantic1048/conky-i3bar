require 'cairo'

local i3bar_util = require "util"

-- displays what Clementine is playing.
-- draw nothiong if Clementine is not running
return function (opt)
    local xpos = opt.x
    local ypos = opt.y
    local r, g, b, a
    local playing = conky_parse([[
          ${if_running clementine}
          ${if_empty ${exec ]] .. opt.PROJECT_ROOT .. [[bin/clementine_play.py -a}}
          ${else}${exec ]] .. opt.PROJECT_ROOT .. [[bin/clementine_play.py -a} - ]] ..
              [[${exec ]] .. opt.PROJECT_ROOT .. [[bin/clementine_play.py -t}
          ${endif}
          ${endif}
    ]])

    -- draw small text 'music'
    ypos = ypos + 16
    r, g, b, a = 0.9, 0.9, 0.9, 0.9
    cairo_move_to(opt.cr, xpos, ypos)
    cairo_select_font_face(
        opt.cr,
        opt.primary_font,
        opt.primary_font_slant,
        opt.primary_font_face)
    cairo_set_font_size(opt.cr, 9)
    cairo_set_source_rgba(opt.cr, r, g, b, a)
    cairo_show_text(opt.cr, 'music')
    cairo_stroke(opt.cr)

    xpos = xpos + 27
    ypos = ypos - 16
    i3bar_util.draw_svg({cr = opt.cr,
        x = xpos, y = ypos,
        file = opt.RESOURCE_PATH .. 'music-frame.svg'})

    ypos = ypos + 20
    xpos = xpos - 42
    r, g, b, a = 1, 1, 1, 0.9
    cairo_move_to(opt.cr, xpos, ypos)
    cairo_select_font_face(opt.cr, 'Source Han Sans SC Light', opt.primary_font_slant, opt.primary_font_face)
    cairo_set_font_size(opt.cr, opt.primary_font_size - 3)
    cairo_set_source_rgba(opt.cr, r, g, b, a)
    cairo_show_text(opt.cr, playing)
    cairo_stroke(opt.cr)
end
