use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Timeline;

### /usr/src/mutter-42.1/clutter/clutter/clutter-timeline.h

#: ClutterTimelineProgressFunc (ClutterTimeline *timeline,
#:                              gdouble          elapsed,
#:                              gdouble          total,
#:                              gpointer         user_data --> gdouble);

sub clutter_timeline_add_marker (
  ClutterTimeline $timeline,
  Str             $marker_name,
  gdouble         $progress
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_add_marker_at_time (
  ClutterTimeline $timeline,
  Str             $marker_name,
  guint           $msecs
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_advance (ClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_advance_to_marker (
  ClutterTimeline $timeline,
  Str             $marker_name
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_actor (ClutterTimeline $timeline)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_auto_reverse (ClutterTimeline $timeline)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_cubic_bezier_progress (
  ClutterTimeline  $timeline,
  graphene_point_t $c_1,
  graphene_point_t $c_2
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_current_repeat (ClutterTimeline $timeline)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_delay (ClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_delta (ClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_direction (ClutterTimeline $timeline)
  returns ClutterTimelineDirection
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_duration (ClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_duration_hint (ClutterTimeline $timeline)
  returns gint64
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_elapsed_time (ClutterTimeline $timeline)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_frame_clock (ClutterTimeline $timeline)
  returns ClutterFrameClock
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_progress (ClutterTimeline $timeline)
  returns gdouble
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_progress_mode (ClutterTimeline $timeline)
  returns ClutterAnimationMode
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_repeat_count (ClutterTimeline $timeline)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_timeline_get_step_progress (
  ClutterTimeline $timeline,
  gint            $n_steps    is rw,
  ClutterStepMode $step_mode
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

sub clutter_timeline_has_marker (ClutterTimeline $timeline, Str $marker_name)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_is_playing (ClutterTimeline $timeline)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_timeline_list_markers (
  ClutterTimeline $timeline,
  gint            $msecs,
  gsize           $n_markers
)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_timeline_new_for_actor (ClutterActor $actor, gint $duration_ms)
  returns ClutterTimeline
  is native(mutter)
  is export
{ * }

sub clutter_timeline_new_for_frame_clock (
  ClutterFrameClock $frame_clock,
  gint              $duration_ms
)
  returns ClutterTimeline
  is native(mutter)
  is export
{ * }

sub clutter_timeline_pause (ClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_remove_marker (
  ClutterTimeline $timeline,
  Str             $marker_name
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_rewind (ClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_actor (
  ClutterTimeline $timeline,
  ClutterActor    $actor
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_auto_reverse (
  ClutterTimeline $timeline,
  gboolean        $reverse
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_cubic_bezier_progress (
  ClutterTimeline  $timeline,
  graphene_point_t $c_1,
  graphene_point_t $c_2
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_delay (ClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_direction (
  ClutterTimeline          $timeline,
  ClutterTimelineDirection $direction
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_duration (ClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_frame_clock (
  ClutterTimeline   $timeline,
  ClutterFrameClock $frame_clock
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_progress_func (
  ClutterTimeline $timeline,
                  &func (
                    ClutterTimeline,
                    gdouble,
                    gdouble,
                    gpointer
                    --> gdouble
                  ),
  gpointer        $data,
                  &notify (gpointer)
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_progress_mode (
  ClutterTimeline      $timeline,
  ClutterAnimationMode $mode
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_repeat_count (ClutterTimeline $timeline, gint $count)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_set_step_progress (
  ClutterTimeline $timeline,
  gint            $n_steps,
  ClutterStepMode $step_mode
)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_skip (ClutterTimeline $timeline, guint $msecs)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_start (ClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }

sub clutter_timeline_stop (ClutterTimeline $timeline)
  is native(mutter)
  is export
{ * }
