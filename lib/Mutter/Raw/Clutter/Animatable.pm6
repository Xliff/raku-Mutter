use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Animatable;

### /usr/src/mutter-42.1/clutter/clutter/clutter-animatable.h

sub clutter_animatable_find_property (
  ClutterAnimatable $animatable,
  Str               $property_name
)
  returns GParamSpec
  is native(mutter)
  is export
{ * }

sub clutter_animatable_get_actor (ClutterAnimatable $animatable)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_animatable_get_initial_state (
  ClutterAnimatable $animatable,
  Str               $property_name,
  GValue            $value
)
  is native(mutter)
  is export
{ * }

sub clutter_animatable_interpolate_value (
  ClutterAnimatable $animatable,
  Str               $property_name,
  ClutterInterval   $interval,
  gdouble           $progress,
  GValue            $value
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_animatable_set_final_state (
  ClutterAnimatable $animatable,
  Str               $property_name,
  GValue            $value
)
  is native(mutter)
  is export
{ * }
