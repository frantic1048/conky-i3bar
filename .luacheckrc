exclude_files = {'.luacheckrc'}

stds.conky = {
    globals = { -- these globals can be set and accessed.
        'conky'
    },
    read_globals = { -- these globals can only be accessed.
        'conky_parse',
        'conky_window'
    }
}

stds.cairo = {
    read_globals = {
        'cairo_create',
        'cairo_destroy',
        'cairo_xlib_surface_create',
        'cairo_surface_destroy',
        'cairo_move_to',
        'cairo_select_font_face',
        'cairo_set_font_size',
        'cairo_set_source_rgba',
        'cairo_show_text',
        'cairo_stroke',
        'cairo_rectangle',
        'cairo_fill',
        'cairo_matrix_t',
        'cairo_matrix_init',
        'cairo_get_matrix',
        'cairo_set_matrix',
        'cairo_transform',
        'cairo_translate',
        'cairo_scale',
        'cairo_font_options_create',
        'cairo_font_options_destroy',
        'cairo_font_options_set_antialias',
        'cairo_font_options_set_subpixel_order',
        'cairo_font_options_set_hint_style',
        'cairo_font_options_set_hint_metrics',
        'cairo_set_font_options',
        'CAIRO_FONT_SLANT_NORMAL',
        'CAIRO_FONT_WEIGHT_NORMAL',
        'CAIRO_ANTIALIAS_SUBPIXEL',
        'CAIRO_SUBPIXEL_ORDER_RGB',
        'CAIRO_HINT_STYLE_FULL',
        'CAIRO_HINT_METRICS_DEFAULT'

    }
}

stds.rsvg = {
  read_globals = {
    'rsvg_handle_new_from_file',
    'rsvg_destroy_handle',
    'RsvgDimensionData',
    'rsvg_handle_get_dimensions',
    'rsvg_handle_render_cairo'
  }
}

stds.imlib = {
  read_globals = {
    'imlib_load_image',
    'imlib_context_set_image',
    'imlib_image_get_width',
    'imlib_image_get_height',
    'imlib_create_cropped_scaled_image',
    'imlib_free_image',
    'imlib_render_image_on_drawable',

  }
}

std = 'min+conky+cairo+rsvg+imlib'
