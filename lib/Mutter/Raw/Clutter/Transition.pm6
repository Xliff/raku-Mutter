use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Transitions;

### /usr/src/mutter-42.1/clutter/clutter/clutter-transition.h

sub clutter_transition_get_animatable (ClutterTransition $transition)
  returns ClutterAnimatable
  is native(mutter)
  is export
{ * }

sub clutter_transition_get_interval (ClutterTransition $transition)
  returns ClutterInterval
  is native(mutter)
  is export
{ * }

sub clutter_transition_get_remove_on_complete (ClutterTransition $transition)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_transition_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_animatable (
  ClutterTransition $transition,
  ClutterAnimatable $animatable
)
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_from (
  ClutterTransition $transition,
  GType             $value_type
)
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_from_value (
  ClutterTransition $transition,
  GValue            $value
)
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_interval (
  ClutterTransition $transition,
  ClutterInterval   $interval
)
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_remove_on_complete (
  ClutterTransition $transition,
  gboolean          $remove_complete
)
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_to (
  ClutterTransition $transition,
  GType             $value_type
)
  is native(mutter)
  is export
{ * }

sub clutter_transition_set_to_value (
  ClutterTransition $transition,
  GValue            $value
)
  is native(mutter)
  is export
{ * }
