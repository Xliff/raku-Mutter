use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::KeyframeTransition;

### /usr/src/mutter-42.1/clutter/clutter/clutter-keyframe-transition.h

sub clutter_keyframe_transition_clear (
  MutterClutterKeyframeTransition $transition
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_get_key_frame (
  MutterClutterKeyframeTransition $transition,
  guint                            $index,
  gdouble                          $key        is rw,
  MutterClutterAnimationMode       $mode       is rw,
  GValue                           $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_get_n_key_frames (
  MutterClutterKeyframeTransition $transition
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_new (Str $property_name)
  returns MutterClutterTransition
  is native(mutter-clutter)
  is export
{ * }

# sub clutter_keyframe_transition_set (
#   MutterClutterKeyframeTransition $transition,
#   GType $gtype,
#   guint $n_key_frames
# )
#   is native(mutter-clutter)
#   is export
# { * }

sub clutter_keyframe_transition_set_key_frame (
  MutterClutterKeyframeTransition $transition,
  guint                           $index,
  gdouble                         $key,
  MutterClutterAnimationMode      $mode,
  GValue                          $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_set_key_frames (
  MutterClutterKeyframeTransition $transition,
  guint                           $n_key_frames,
  CArray[gdouble]                 $key_frames
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_set_modes (
  MutterClutterKeyframeTransition    $transition,
  guint                              $n_modes,
  CArray[MutterClutterAnimationMode] $modes
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keyframe_transition_set_values (
  MutterClutterKeyframeTransition $transition,
  guint                           $n_values,
  Pointer                         $values       #= Array of GValues
)
  is native(mutter-clutter)
  is export
{ * }
