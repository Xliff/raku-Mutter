use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Timeline;

### /usr/src/mutter-42.1/clutter/clutter/clutter-timeline.h

#: MutterClutterTimelineProgressFunc (MutterClutterTimeline *timeline,
#:                              gdouble          elapsed,
#:                              gdouble          total,
#:                              gpointer         user_data --> gdouble);

sub clutter_timeline_add_marker (
  MutterClutterTimeline $timeline,
  Str                   $marker_name,
  gdouble               $progress
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_add_marker_at_time (
  MutterClutterTimeline $timeline,
  Str                   $marker_name,
  guint                 $msecs
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_advance (MutterClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_advance_to_marker (
  MutterClutterTimeline $timeline,
  Str                   $marker_name
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_actor (MutterClutterTimeline $timeline)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_auto_reverse (MutterClutterTimeline $timeline)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_cubic_bezier_progress (
  MutterClutterTimeline  $timeline,
  graphene_point_t       $c_1,
  graphene_point_t       $c_2
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_current_repeat (MutterClutterTimeline $timeline)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_delay (MutterClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_delta (MutterClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_direction (MutterClutterTimeline $timeline)
  returns MutterClutterTimelineDirection
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_duration (MutterClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_duration_hint (MutterClutterTimeline $timeline)
  returns gint64
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_elapsed_time (MutterClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_frame_clock (MutterClutterTimeline $timeline)
  returns MutterClutterFrameClock
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_progress (MutterClutterTimeline $timeline)
  returns gdouble
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_progress_mode (MutterClutterTimeline $timeline)
  returns MutterClutterAnimationMode
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_repeat_count (MutterClutterTimeline $timeline)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_step_progress (
  MutterClutterTimeline $timeline,
  gint                  $n_steps    is rw,
  MutterClutterStepMode $step_mode
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_timeline_has_marker (
  MutterClutterTimeline $timeline,
  Str                   $marker_name
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_is_playing (MutterClutterTimeline $timeline)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_list_markers (
  MutterClutterTimeline $timeline,
  gint                  $msecs,
  gsize                 $n_markers
)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_timeline_new_for_actor (
  MutterClutterActor $actor,
  gint               $duration_ms
)
  returns MutterClutterTimeline
  is native(mutter)
  is export
{ * }

sub clutter_timeline_new_for_frame_clock (
  MutterClutterFrameClock $frame_clock,
  gint                    $duration_ms
)
  returns MutterClutterTimeline
  is native(mutter)
  is export
{ * }

sub clutter_timeline_pause (MutterClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_remove_marker (
  MutterClutterTimeline $timeline,
  Str                   $marker_name
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_rewind (MutterClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_actor (
  MutterClutterTimeline $timeline,
  MutterClutterActor    $actor
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_auto_reverse (
  MutterClutterTimeline $timeline,
  gboolean              $reverse
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_cubic_bezier_progress (
  MutterClutterTimeline  $timeline,
  graphene_point_t $c_1,
  graphene_point_t $c_2
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_delay (MutterClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_direction (
  MutterClutterTimeline          $timeline,
  MutterClutterTimelineDirection $direction
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_duration (
  MutterClutterTimeline $timeline,
  guint                 $msecs
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_frame_clock (
  MutterClutterTimeline   $timeline,
  MutterClutterFrameClock $frame_clock
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_progress_func (
  MutterClutterTimeline $timeline,
                        &func (
                          MutterClutterTimeline,
                          gdouble,
                          gdouble,
                          gpointer
                          --> gdouble
                        ),
  gpointer              $data,
                        &notify (gpointer)
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_progress_mode (
  MutterClutterTimeline      $timeline,
  MutterClutterAnimationMode $mode
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_repeat_count (
  MutterClutterTimeline $timeline,
  gint                  $count
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_step_progress (
  MutterClutterTimeline $timeline,
  gint                  $n_steps,
  MutterClutterStepMode $step_mode
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_skip (MutterClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_start (MutterClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_stop (MutterClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }
