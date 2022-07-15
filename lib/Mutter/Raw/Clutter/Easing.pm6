use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Easing;

### /usr/src/mutter-42.1/clutter/clutter/clutter-easing.h

sub clutter_ease_cubic_bezier (
  gdouble $t,
  gdouble $d,
  gdouble $x_1,
  gdouble $y_1,
  gdouble $x_2,
  gdouble $y_2
)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_back (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_bounce (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_circ (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_cubic (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_elastic (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_expo (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_back (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_bounce (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_circ (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_cubic (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_elastic (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_expo (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_quad (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_quart (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_quint (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_out_sine (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_quad (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_quart (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_quint (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_in_sine (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_back (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_bounce (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_circ (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_cubic (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_elastic (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_expo (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_quad (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_quart (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_quint (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_out_sine (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_steps_end (gdouble $t, gdouble $d, gint $steps)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_ease_steps_start (gdouble $t, gdouble $d, gint $steps)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_easing_func_for_mode (MutterClutterAnimationMode $mode)
  returns Pointer # MutterClutterEasingFunc
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_easing_name_for_mode (MutterClutterAnimationMode $mode)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_linear (gdouble $t, gdouble $d)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_easing_for_mode (
  MutterClutterAnimationMode $mode,
  gdouble                    $t,
  gdouble                    $d
)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }
