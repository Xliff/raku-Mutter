use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Color;

### /usr/src/mutter-42.1/clutter/clutter/clutter-color.h

sub clutter_color_add (ClutterColor $a, ClutterColor $b, ClutterColor $result)
  is native(mutter)
  is export
{ * }

sub clutter_color_alloc ()
  returns ClutterColor
  is native(mutter)
  is export
{ * }

sub clutter_param_color_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_param_spec_color (
  Str          $name,
  Str          $nick,
  Str          $blurb,
  ClutterColor $default_value,
  GParamFlags  $flags
)
  returns GParamSpec
  is native(mutter)
  is export
{ * }

sub clutter_value_get_color (GValue $value)
  returns ClutterColor
  is native(mutter)
  is export
{ * }

sub clutter_value_set_color (GValue $value, ClutterColor $color)
  is native(mutter)
  is export
{ * }

sub clutter_color_copy (ClutterColor $color)
  returns ClutterColor
  is native(mutter)
  is export
{ * }

sub clutter_color_darken (ClutterColor $color, ClutterColor $result)
  is native(mutter)
  is export
{ * }

sub clutter_color_equal (gconstpointer $v1, gconstpointer $v2)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_color_free (ClutterColor $color)
  is native(mutter)
  is export
{ * }

sub clutter_color_from_hls (
  ClutterColor $color,
  gfloat       $hue,
  gfloat       $luminance,
  gfloat       $saturation
)
  is native(mutter)
  is export
{ * }

sub clutter_color_from_pixel (ClutterColor $color, guint32 $pixel)
  is native(mutter)
  is export
{ * }

sub clutter_color_from_string (ClutterColor $color, Str $str)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_color_get_static (ClutterStaticColor $color)
  returns ClutterColor
  is native(mutter)
  is export
{ * }

sub clutter_color_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_color_hash (gconstpointer $v)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_color_init (
  ClutterColor $color,
  guint8       $red,
  guint8       $green,
  guint8       $blue,
  guint8       $alpha
)
  returns ClutterColor
  is native(mutter)
  is export
{ * }

sub clutter_color_interpolate (
  ClutterColor $initial,
  ClutterColor $final,
  gdouble      $progress,
  ClutterColor $result
)
  is native(mutter)
  is export
{ * }

sub clutter_color_lighten (ClutterColor $color, ClutterColor $result)
  is native(mutter)
  is export
{ * }

sub clutter_color_new (guint8 $red, guint8 $green, guint8 $blue, guint8 $alpha)
  returns ClutterColor
  is native(mutter)
  is export
{ * }

sub clutter_color_shade (
  ClutterColor $color,
  gdouble      $factor,
  ClutterColor $result
)
  is native(mutter)
  is export
{ * }

sub clutter_color_subtract (
  ClutterColor $a,
  ClutterColor $b,
  ClutterColor $result
)
  is native(mutter)
  is export
{ * }

sub clutter_color_to_hls (
  ClutterColor $color,
  gfloat       $hue        is rw,
  gfloat       $luminance  is rw,
  gfloat       $saturation is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_color_to_pixel (ClutterColor $color)
  returns guint32
  is native(mutter)
  is export
{ * }

sub clutter_color_to_string (ClutterColor $color)
  returns Str
  is native(mutter)
  is export
{ * }
