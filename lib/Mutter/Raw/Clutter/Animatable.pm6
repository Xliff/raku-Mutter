use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Animatable;

### /usr/src/mutter-42.1/clutter/clutter/clutter-animatable.h

sub clutter_animatable_find_property (
  MutterClutterAnimatable $animatable,
  Str                     $property_name
)
  returns GParamSpec
  is native(mutter-clutter)
  is export
{ * }

sub clutter_animatable_get_actor (MutterClutterAnimatable $animatable)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_animatable_get_initial_state (
  MutterClutterAnimatable $animatable,
  Str                     $property_name,
  GValue                  $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_animatable_interpolate_value (
  MutterClutterAnimatable $animatable,
  Str                     $property_name,
  MutterClutterInterval   $interval,
  gdouble                 $progress,
  GValue                  $value
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_animatable_set_final_state (
  MutterClutterAnimatable $animatable,
  Str                     $property_name,
  GValue                  $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_animatable_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
