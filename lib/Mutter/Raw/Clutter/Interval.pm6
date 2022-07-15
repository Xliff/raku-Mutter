use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Interval;

### /usr/src/mutter-42.1/clutter/clutter/clutter-interval.h

sub clutter_interval_clone (MutterClutterInterval $interval)
  returns MutterClutterInterval
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_compute (MutterClutterInterval $interval, gdouble $factor)
  returns GValue
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_compute_value (
  MutterClutterInterval $interval,
  gdouble         $factor,
  GValue          $value
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_get_final_value (
  MutterClutterInterval $interval,
  GValue                $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_get_initial_value (
  MutterClutterInterval $interval,
  GValue          $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_get_interval (MutterClutterInterval $interval)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_get_value_type (MutterClutterInterval $interval)
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_is_valid (MutterClutterInterval $interval)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_new (GType $gtype)
  returns MutterClutterInterval
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_new_with_values (
  GType  $gtype,
  GValue $initial,
  GValue $final
)
  returns MutterClutterInterval
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_peek_final_value (MutterClutterInterval $interval)
  returns GValue
  is native(mutter-clutter)
  is export
{ * }

sub clutter_interval_peek_initial_value (MutterClutterInterval $interval)
  returns GValue
  is native(mutter-clutter)
  is export
{ * }

# sub clutter_interval_set_final (MutterClutterInterval $interval, ...)
#   is native(mutter-clutter)
#   is export
# { * }

sub clutter_interval_set_final_value (
  MutterClutterInterval $interval,
  GValue          $value
)
  is native(mutter-clutter)
  is export
{ * }

# sub clutter_interval_set_initial (MutterClutterInterval $interval, ...)
#   is native(mutter-clutter)
#   is export
# { * }

sub clutter_interval_set_initial_value (
  MutterClutterInterval $interval,
  GValue          $value
)
  is native(mutter-clutter)
  is export
{ * }

# sub clutter_interval_set_interval (MutterClutterInterval $interval, ...)
#   is native(mutter-clutter)
#   is export
# { * }

sub clutter_interval_validate (
  MutterClutterInterval $interval,
  GParamSpec            $pspec
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
