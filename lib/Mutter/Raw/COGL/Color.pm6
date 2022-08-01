use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::COGL::Color;

### /usr/src/mutter-42.1/cogl/cogl/cogl-color.h

sub cogl_color_copy (MutterCoglColor $color)
  returns MutterCoglColor
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_equal (MutterCoglColor $v1, MutterCoglColor $v2)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_free (MutterCoglColor $color)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_alpha (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_alpha_byte (MutterCoglColor $color)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_alpha_float (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_blue (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_blue_byte (MutterCoglColor $color)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_blue_float (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_green (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_green_byte (MutterCoglColor $color)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_green_float (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_red (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_red_byte (MutterCoglColor $color)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_get_red_float (MutterCoglColor $color)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_init_from_4f (
  MutterCoglColor $color,
  gfloat          $red,
  gfloat          $green,
  gfloat          $blue,
  gfloat          $alpha
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_init_from_4fv (
  MutterCoglColor $color,
  CArray[gfloat]  $color_array
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_init_from_4ub (
  MutterCoglColor $color,
  uint8_t         $red,
  uint8_t         $green,
  uint8_t         $blue,
  uint8_t         $alpha
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_init_from_hsl (
  MutterCoglColor $color,
  gfloat          $hue,
  gfloat          $saturation,
  gfloat          $luminance
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_new ()
  returns MutterCoglColor
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_premultiply (MutterCoglColor $color)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_alpha (MutterCoglColor $color, gfloat $alpha)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_alpha_byte (MutterCoglColor $color, uint8 $alpha)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_alpha_float (MutterCoglColor $color, gfloat $alpha)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_blue (MutterCoglColor $color, gfloat $blue)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_blue_byte (MutterCoglColor $color, uint8 $blue)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_blue_float (MutterCoglColor $color, gfloat $blue)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_green (MutterCoglColor $color, gfloat $green)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_green_byte (MutterCoglColor $color, uint8 $green)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_green_float (MutterCoglColor $color, gfloat $green)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_red (MutterCoglColor $color, gfloat $red)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_red_byte (MutterCoglColor $color, uint8 $red)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_set_red_float (MutterCoglColor $color, gfloat $red)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_to_hsl (
  MutterCoglColor $color,
  gfloat          $hue        is rw,
  gfloat          $saturation is rw,
  gfloat          $luminance  is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_color_unpremultiply (MutterCoglColor $color)
  is native(mutter-clutter)
  is export
{ * }
