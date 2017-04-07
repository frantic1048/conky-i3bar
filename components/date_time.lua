require 'cairo'

local i3bar_util = require 'util'

-- simple text date time
return function (opt)
    local xpos = opt.x
    local ypos = opt.y

    -- text color
    local r, g, b, a

    local time = conky_parse('${time %H:%M}')
    local sec = conky_parse('${time %S}')
    local day_of_week = conky_parse('${time %a}')
    local day = conky_parse('${time %d}')
    local month = conky_parse('${time %b}')
    local year = conky_parse('${time %Y}')

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
    cairo_show_text(opt.cr, 'time')
    cairo_stroke(opt.cr)

    xpos = xpos + 23
    ypos = ypos - 16
    i3bar_util.draw_svg({
      cr = opt.cr,
      x = xpos, y = ypos,
      file = opt.RESOURCE_PATH .. 'date-time-frame.svg'
    })

    xpos = xpos + 18
    ypos = ypos + 21
    r, g, b, a = 1, 1, 1, 0.9
    cairo_move_to(opt.cr, xpos, ypos)
    cairo_set_font_size(opt.cr, opt.primary_font_size + 3)
    cairo_set_source_rgba(opt.cr, r, g, b, a)
    cairo_show_text(opt.cr, time)
    cairo_stroke(opt.cr)

    xpos = xpos + 56
    r, g, b, a = 0.9, 0.9, 0.9, 0.9
    cairo_move_to(opt.cr, xpos, ypos)
    cairo_set_font_size(opt.cr, opt.primary_font_size - 5)
    cairo_set_source_rgba(opt.cr, r, g, b, a)
    cairo_show_text(opt.cr, sec)
    cairo_stroke(opt.cr)

    xpos = xpos + 24
    ypos = ypos - 2
    r, g, b, a = 0.9, 0.9, 0.9, 0.9
    cairo_move_to(opt.cr, xpos, ypos)
    cairo_set_font_size(opt.cr, opt.primary_font_size - 7)
    cairo_set_source_rgba(opt.cr, r, g, b, a)
    cairo_show_text(opt.cr, day_of_week)
    cairo_stroke(opt.cr)

    xpos = xpos + 24
    ypos = ypos + 1
    r, g, b, a = 0.9, 0.9, 0.9, 0.9
    cairo_move_to(opt.cr, xpos, ypos)
    cairo_set_font_size(opt.cr, opt.primary_font_size - 4)
    cairo_set_source_rgba(opt.cr, r, g, b, a)
    cairo_show_text(opt.cr, day .. ' ' .. month .. ' ' .. year)
    cairo_stroke(opt.cr)
end
