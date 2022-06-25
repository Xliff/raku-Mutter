use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Window::Shape;

### /usr/src/mutter-42.1/src/meta/meta-window-shape.h

sub meta_window_shape_equal (
  MetaWindowShape $shape_a,
  MetaWindowShape $shape_b
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_shape_get_borders (
  MetaWindowShape $shape,
  gint            $border_top    is rw,
  gint            $border_right  is rw,
  gint            $border_bottom is rw,
  gint            $border_left   is rw
)
  is native(mutter)
  is export
{ * }

sub meta_window_shape_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_window_shape_hash (MetaWindowShape $shape)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_window_shape_new (cairo_region_t $region)
  returns MetaWindowShape
  is native(mutter)
  is export
{ * }

sub meta_window_shape_ref (MetaWindowShape $shape)
  returns MetaWindowShape
  is native(mutter)
  is export
{ * }

sub meta_window_shape_to_region (
  MetaWindowShape $shape,
  gint            $center_width,
  gint            $center_height
)
  returns cairo_region_t
  is native(mutter)
  is export
{ * }

sub meta_window_shape_unref (MetaWindowShape $shape)
  is native(mutter)
  is export
{ * }
