use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::PropertyTransition;

### /usr/src/mutter-42.1/clutter/clutter/clutter-property-transition.h

sub clutter_property_transition_get_property_name (
  MutterClutterPropertyTransition $transition
)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_property_transition_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_property_transition_new (Str $property_name)
  returns MutterClutterTransition
  is native(mutter-clutter)
  is export
{ * }

sub clutter_property_transition_new_for_actor (
  MutterClutterActor $actor,
  Str                $property_name
)
  returns MutterClutterTransition
  is native(mutter-clutter)
  is export
{ * }

sub clutter_property_transition_set_property_name (
  MutterClutterPropertyTransition $transition,
  Str                             $property_name
)
  is native(mutter-clutter)
  is export
{ * }
