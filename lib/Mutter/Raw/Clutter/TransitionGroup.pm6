use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::TransitionGroup;

### /usr/src/mutter-42.1/clutter/clutter/clutter-transition-group.h

sub clutter_transition_group_add_transition (
  MutterClutterTransitionGroup $group,
  MutterClutterTransition      $transition
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_group_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_group_new ()
  returns MutterClutterTransitionGroup
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_group_remove_all (MutterClutterTransitionGroup $group)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transition_group_remove_transition (
  MutterClutterTransitionGroup $group,
  MutterClutterTransition      $transition
)
  is native(mutter-clutter)
  is export
{ * }
