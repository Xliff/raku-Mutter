use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::ScrollActor;

### /usr/src/mutter-42.1/clutter/clutter/clutter-scroll-actor.h

sub clutter_scroll_actor_get_scroll_mode (MutterClutterScrollActor $actor)
  returns MutterClutterScrollMode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_scroll_actor_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_scroll_actor_new ()
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_scroll_actor_scroll_to_point (
  MutterClutterScrollActor $actor,
  graphene_point_t         $point
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_scroll_actor_scroll_to_rect (
  MutterClutterScrollActor $actor,
  graphene_rect_t          $rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_scroll_actor_set_scroll_mode (
  MutterClutterScrollActor $actor,
  MutterClutterScrollMode  $mode
)
  is native(mutter-clutter)
  is export
{ * }
