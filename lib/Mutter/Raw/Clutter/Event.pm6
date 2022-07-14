use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Event;

### /usr/src/mutter-42.1/clutter/clutter/clutter-event.h

sub clutter_event_add_filter (
  MutterClutterStage $stage,
                     &func (
                       MutterClutterEvent,
                       MutterClutterActor,
                       gpointer
                       --> gboolean
                     ),
                     &notify (gpointer),
  gpointer           $user_data
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_events_pending ()
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_current_event ()
  returns MutterClutterEvent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_current_event_time ()
  returns guint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_keysym_to_unicode (guint $keyval)
  returns guint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_unicode_to_keysym (guint32 $wc)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_copy (MutterClutterEvent $event)
  returns MutterClutterEvent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_free (MutterClutterEvent $event)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get ()
  returns MutterClutterEvent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_angle (
  MutterClutterEvent $source,
  MutterClutterEvent $target
)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_axes (MutterClutterEvent $event, guint $n_axes is rw)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_button (MutterClutterEvent $event)
  returns guint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_coords (
  MutterClutterEvent $event,
  gfloat             $x      is rw,
  gfloat             $y      is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_device (MutterClutterEvent $event)
  returns MutterClutterInputDevice
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_device_tool (MutterClutterEvent $event)
  returns MutterClutterInputDeviceTool
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_device_type (MutterClutterEvent $event)
  returns MutterClutterInputDeviceType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_distance (
  MutterClutterEvent $source,
  MutterClutterEvent $target
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_event_code (MutterClutterEvent $event)
  returns uint32_t
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_event_sequence (MutterClutterEvent $event)
  returns MutterClutterEventSequence
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_flags (MutterClutterEvent $event)
  returns MutterClutterEventFlags
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_gesture_motion_delta (
  MutterClutterEvent $event,
  gdouble            $dx     is rw,
  gdouble            $dy     is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_gesture_motion_delta_unaccelerated (
  MutterClutterEvent $event,
  gdouble            $dx     is rw,
  gdouble            $dy     is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_gesture_phase (MutterClutterEvent $event)
  returns MutterClutterTouchpadGesturePhase
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_gesture_pinch_angle_delta (MutterClutterEvent $event)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_gesture_pinch_scale (MutterClutterEvent $event)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_key_code (MutterClutterEvent $event)
  returns guint16
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_key_symbol (MutterClutterEvent $event)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_key_unicode (MutterClutterEvent $event)
  returns gunichar
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_mode_group (MutterClutterEvent $event)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_pad_event_details (
  MutterClutterEvent $event,
  guint              $number is rw,
  guint              $mode   is rw,
  gdouble            $value  is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_position (
  MutterClutterEvent $event,
  graphene_point_t   $position
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_related (MutterClutterEvent $event)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_relative_motion (
  MutterClutterEvent $event,
  gdouble            $dx         is rw,
  gdouble            $dy         is rw,
  gdouble            $dx_unaccel is rw,
  gdouble            $dy_unaccel is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_scroll_delta (
  MutterClutterEvent $event,
  gdouble            $dx     is rw,
  gdouble            $dy     is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_scroll_direction (MutterClutterEvent $event)
  returns MutterClutterScrollDirection
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_scroll_finish_flags (MutterClutterEvent $event)
  returns MutterClutterScrollFinishFlags
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_scroll_source (MutterClutterEvent $event)
  returns MutterClutterScrollSource
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_source (MutterClutterEvent $event)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_source_device (MutterClutterEvent $event)
  returns MutterClutterInputDevice
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_stage (MutterClutterEvent $event)
  returns MutterClutterStage
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_state (MutterClutterEvent $event)
  returns MutterClutterModifierType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_state_full (
  MutterClutterEvent        $event,
  MutterClutterModifierType $button_state    is rw,
  MutterClutterModifierType $base_state      is rw,
  MutterClutterModifierType $latched_state   is rw,
  MutterClutterModifierType $locked_state    is rw,
  MutterClutterModifierType $effective_state is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_time (MutterClutterEvent $event)
  returns guint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_time_us (MutterClutterEvent $event)
  returns int64_t
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_touchpad_gesture_finger_count (MutterClutterEvent $event)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_has_control_modifier (MutterClutterEvent $event)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_has_shift_modifier (MutterClutterEvent $event)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_is_pointer_emulated (MutterClutterEvent $event)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_new (MutterClutterEventType $type)
  returns MutterClutterEvent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_put (MutterClutterEvent $event)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_remove_filter (guint $id)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_sequence_get_slot (MutterClutterEventSequence $sequence)
  returns int32_t
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_sequence_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_button (
  MutterClutterEvent $event,
  guint32            $button
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_coords (
  MutterClutterEvent $event,
  gfloat             $x,
  gfloat             $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_device (
  MutterClutterEvent       $event,
  MutterClutterInputDevice $device
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_device_tool (
  MutterClutterEvent           $event,
  MutterClutterInputDeviceTool $tool
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_flags (
  MutterClutterEvent      $event,
  MutterClutterEventFlags $flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_key_code (
  MutterClutterEvent $event,
  guint16            $key_code
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_key_symbol (
  MutterClutterEvent $event,
  guint              $key_sym
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_key_unicode (
  MutterClutterEvent $event,
  gunichar           $key_unicode
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_related (
  MutterClutterEvent $event,
  MutterClutterActor $actor
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_scroll_delta (
  MutterClutterEvent $event,
  gdouble            $dx,
  gdouble            $dy
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_scroll_direction (
  MutterClutterEvent           $event,
  MutterClutterScrollDirection $direction
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_source (
  MutterClutterEvent $event,
  MutterClutterActor $actor
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_source_device (
  MutterClutterEvent       $event,
  MutterClutterInputDevice $device
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_stage (
  MutterClutterEvent $event,
  MutterClutterStage $stage
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_state (
  MutterClutterEvent        $event,
  MutterClutterModifierType $state
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_set_time (MutterClutterEvent $event, guint32 $time)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_event_type (MutterClutterEvent $event)
  returns MutterClutterEventType
  is native(mutter-clutter)
  is export
{ * }
