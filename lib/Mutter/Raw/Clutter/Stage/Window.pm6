use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Clutter::Raw::StageWindow;

### /usr/src/mutter-42.1/clutter/clutter/clutter-stage-window.h

sub _clutter_stage_window_can_clip_redraws (MutterClutterStageWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_finish_frame (
  MutterClutterStageWindow $window,
  MutterClutterStageView   $view,
  MutterClutterFrame       $frame
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_get_frame_counter (MutterClutterStageWindow $window)
  returns int64
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_get_geometry (
  MutterClutterStageWindow    $window,
  cairo_rectangle_int_t       $geometry
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_get_views (MutterClutterStageWindow $window)
  returns GList
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_get_wrapper (MutterClutterStageWindow $window)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_hide (MutterClutterStageWindow $window)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_prepare_frame (
  MutterClutterStageWindow $window,
  MutterClutterStageView   $view,
  MutterClutterFrame       $frame
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_realize (MutterClutterStageWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_redraw_view (
  MutterClutterStageWindow $window,
  MutterClutterStageView   $view,
  MutterClutterFrame       $frame
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_resize (
  MutterClutterStageWindow $window,
  gint                     $width,
  gint                     $height
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_set_accept_focus(
  MutterClutterStageWindow $window,
  gboolean                 $accept_focus
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_set_cursor_visible (
  MutterClutterStageWindow $window,
  gboolean                 $is_visible
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_set_title (
  MutterClutterStageWindow $window,
  Str                      $title
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_show (
  MutterClutterStageWindow $window,
  gboolean                 $do_raise
)
  is native(mutter)
  is export
{ * }

sub _clutter_stage_window_unrealize (MutterClutterStageWindow $window)
  is native(mutter)
  is export
{ * }
