use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::Clutter::FrameClock;

### /usr/src/mutter-42.1/clutter/clutter/clutter-frame-clock.h

sub clutter_frame_clock_add_timeline (
  MutterClutterFrameClock $frame_clock,
  MutterClutterTimeline   $timeline
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_destroy (MutterClutterFrameClock $frame_clock)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_get_max_render_time_debug_info (
  MutterClutterFrameClock $frame_clock
)
  returns GString
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_get_refresh_rate (MutterClutterFrameClock $frame_clock)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_inhibit (MutterClutterFrameClock $frame_clock)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_new (
  gfloat                          $refresh_rate,
  gint64_t                        $vblank_duration_us,
  MutterClutterFrameListenerIface $iface,
  gpointer                        $user_data
)
  returns MutterClutterFrameClock
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_notify_presented (
  MutterClutterFrameClock $frame_clock,
  MutterClutterFrameInfo  $frame_info
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_notify_ready (MutterClutterFrameClock $frame_clock)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_record_flip (
  MutterClutterFrameClock $frame_clock,
  gint64_t                $flip_time_us,
  MutterClutterFrameHint  $hints
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_remove_timeline (
  MutterClutterFrameClock $frame_clock,
  MutterClutterTimeline   $timeline
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_schedule_update (MutterClutterFrameClock $frame_clock)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_schedule_update_now (
  MutterClutterFrameClock $frame_clock
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_clock_uninhibit (MutterClutterFrameClock $frame_clock)
  is native(mutter-clutter)
  is export
{ * }
