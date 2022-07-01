use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Color;

### /usr/src/mutter-42.1/clutter/clutter/clutter-color.h

sub clutter_color_add (
  MutterClutterColor $a,
  MutterClutterColor $b,
  MutterClutterColor $result
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_alloc ()
  returns MutterClutterColor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_param_color_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_param_spec_color (
  Str                $name,
  Str                $nick,
  Str                $blurb,
  MutterClutterColor $default_value,
  GParamFlags        $flags
)
  returns GParamSpec
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_get_color (GValue $value)
  returns MutterClutterColor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_set_color (GValue $value, MutterClutterColor $color)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_copy (MutterClutterColor $color)
  returns MutterClutterColor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_darken (
  MutterClutterColor $color,
  MutterClutterColor $result
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_equal (MutterClutterColor $v1, MutterClutterColor $v2)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_free (MutterClutterColor $color)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_from_hls (
  MutterClutterColor $color,
  gfloat             $hue,
  gfloat             $luminance,
  gfloat             $saturation
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_from_pixel (MutterClutterColor $color, guint32 $pixel)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_from_string (MutterClutterColor $color, Str $str)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_get_static (MutterClutterStaticColor $color)
  returns MutterClutterColor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_hash (MutterClutterColor $v)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_init (
  MutterClutterColor $color,
  guint8             $red,
  guint8             $green,
  guint8             $blue,
  guint8             $alpha
)
  returns MutterClutterColor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_interpolate (
  MutterClutterColor $initial,
  MutterClutterColor $final,
  gdouble            $progress,
  MutterClutterColor $result
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_lighten (
  MutterClutterColor $color,
  MutterClutterColor $result
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_new (
  guint8 $red,
  guint8 $green,
  guint8 $blue,
  guint8 $alpha
)
  returns MutterClutterColor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_shade (
  MutterClutterColor $color,
  gdouble            $factor,
  MutterClutterColor $result
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_subtract (
  MutterClutterColor $a,
  MutterClutterColor $b,
  MutterClutterColor $result
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_to_hls (
  MutterClutterColor $color,
  gfloat             $hue        is rw,
  gfloat             $luminance  is rw,
  gfloat             $saturation is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_to_pixel (MutterClutterColor $color)
  returns guint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_to_string (MutterClutterColor $color)
  returns Str
  is native(mutter-clutter)
  is export
{ * }
