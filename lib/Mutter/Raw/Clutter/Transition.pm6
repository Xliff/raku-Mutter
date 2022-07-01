use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Transitions;

### /usr/src/mutter-42.1/clutter/clutter/clutter-transition.h

sub clutter_transition_get_animatable (
  MutterClutterTransition $transition
)
  returns MutterClutterAnimatable
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_get_interval (
  MutterClutterTransition $transition
)
  returns MutterClutterInterval
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_get_remove_on_complete (
  MutterClutterTransition $transition
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_animatable (
  MutterClutterTransition $transition,
  MutterClutterAnimatable $animatable
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_from (
  MutterClutterTransition $transition,
  GType                   $value_type
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_from_value (
  MutterClutterTransition $transition,
  GValue                  $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_interval (
  MutterClutterTransition $transition,
  MutterClutterInterval   $interval
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_remove_on_complete (
  MutterClutterTransition $transition,
  gboolean                $remove_complete
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_to (
  MutterClutterTransition $transition,
  GType                   $value_type
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_set_to_value (
  MutterClutterTransition $transition,
  GValue                  $value
)
  is native(mutter-clutter)
  is export
{ * }
