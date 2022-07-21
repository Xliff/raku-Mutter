use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::GestureAction;

### /usr/src/mutter-42.1/clutter/clutter/clutter-gesture-action.h

sub clutter_gesture_action_cancel (MutterClutterGestureAction $action)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_device (
  MutterClutterGestureAction $action,
  guint                      $point
)
  returns MutterClutterInputDevice
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_last_event (
  MutterClutterGestureAction $action,
  guint                      $point
)
  returns MutterClutterEvent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_motion_coords (
  MutterClutterGestureAction $action,
  guint                      $point,
  gfloat                     $motion_x is rw,
  gfloat                     $motion_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_motion_delta (
  MutterClutterGestureAction $action,
  guint                      $point,
  gfloat                     $delta_x is rw,
  gfloat                     $delta_y is rw
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_n_current_points (
  MutterClutterGestureAction $action
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_n_touch_points (
  MutterClutterGestureAction $action
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_press_coords (
  MutterClutterGestureAction $action,
  guint                      $point,
  gfloat                     $press_x is rw,
  gfloat                     $press_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_release_coords (
  MutterClutterGestureAction $action,
  guint                      $point,
  gfloat                     $release_x is rw,
  gfloat                     $release_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_sequence (
  MutterClutterGestureAction $action,
  guint                      $point
)
  returns MutterClutterEventSequence
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_threshold_trigger_distance (
  MutterClutterGestureAction $action,
  gfloat                     $x        is rw,
  gfloat                     $y        is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_threshold_trigger_edge (
  MutterClutterGestureAction $action
)
  returns MutterClutterGestureTriggerEdge
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_get_velocity (
  MutterClutterGestureAction $action,
  guint                      $point,
  gfloat                     $velocity_x is rw,
  gfloat                     $velocity_y is rw
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_new ()
  returns MutterClutterAction
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_set_n_touch_points (
  MutterClutterGestureAction $action,
  gint                       $nb_points
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_set_threshold_trigger_distance (
  MutterClutterGestureAction $action,
  gfloat                     $x,
  gfloat                     $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_gesture_action_set_threshold_trigger_edge (
  MutterClutterGestureAction      $action,
  MutterClutterGestureTriggerEdge $edge
)
  is native(mutter-clutter)
  is export
{ * }
