use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::PickContext;

### /usr/src/mutter-42.1/clutter/clutter/clutter-pick-context.h

sub clutter_pick_context_destroy (MutterClutterPickContext $pick_context)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_get_mode (MutterClutterPickContext $pick_context)
  returns MutterClutterPickMode
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_get_transform (
  MutterClutterPickContext $pick_context,
  graphene_matrix_t        $out_matrix
)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_log_overlap (
  MutterClutterPickContext $pick_context,
  MutterClutterActor       $actor
)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_log_pick (
  MutterClutterPickContext $pick_context,
  MutterClutterActorBox    $box,
  MutterClutterActor       $actor
)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_pop_clip (MutterClutterPickContext $pick_context)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_pop_transform (MutterClutterPickContext $pick_context)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_push_clip (
  MutterClutterPickContext $pick_context,
  MutterClutterActorBox    $box
)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_push_transform (
  MutterClutterPickContext $pick_context,
  graphene_matrix_t        $transform
)
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_ref (MutterClutterPickContext $pick_context)
  returns MutterClutterPickContext
  is native(mutter)
  is export
{ * }

sub clutter_pick_context_unref (MutterClutterPickContext $pick_context)
  is native(mutter)
  is export
{ * }
