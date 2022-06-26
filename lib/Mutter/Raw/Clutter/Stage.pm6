use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Stage;

### /usr/src/mutter-42.1/clutter/clutter/clutter-stage.h

sub clutter_perspective_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_stage_ensure_viewport (ClutterStage $stage)
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_actor_at_pos (
  ClutterStage    $stage,
  ClutterPickMode $pick_mode,
  gfloat          $x,
  gfloat          $y
)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_capture_final_size (
  ClutterStage          $stage,
  cairo_rectangle_int_t $rect,
  gint                  $out_width  is rw,
  gint                  $out_height is rw,
  gfloat                $out_scale  is rw
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_device_actor (
  ClutterStage         $stage,
  ClutterInputDevice   $device,
  ClutterEventSequence $sequence
)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_event_actor (ClutterStage $stage, ClutterEvent $event)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_grab_actor (ClutterStage $stage)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_key_focus (ClutterStage $stage)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_minimum_size (
  ClutterStage $stage,
  guint        $width  is rw,
  guint        $height is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_perspective (
  ClutterStage       $stage,
  ClutterPerspective $perspective
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_title (ClutterStage $stage)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_stage_get_view_at (ClutterStage $stage, gfloat $x, gfloat $y)
  returns ClutterStageView
  is native(mutter)
  is export
{ * }

sub clutter_stage_grab (ClutterStage $stage, ClutterActor $actor)
  returns ClutterGrab
  is native(mutter)
  is export
{ * }

sub clutter_stage_is_redraw_queued_on_view (
  ClutterStage     $stage,
  ClutterStageView $view
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_stage_paint_to_buffer (
  ClutterStage            $stage,
  cairo_rectangle_int_t   $rect,
  gfloat                  $scale,
  CArray[uint8]           $data,
  gint                    $stride,
  CoglPixelFormat         $format,
  ClutterPaintFlag        $paint_flags,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_stage_paint_to_content (
  ClutterStage            $stage,
  cairo_rectangle_int_t   $rect,
  gfloat                  $scale,
  ClutterPaintFlag        $paint_flags,
  CArray[Pointer[GError]] $error
)
  returns ClutterContent
  is native(mutter)
  is export
{ * }

sub clutter_stage_paint_to_framebuffer (
  ClutterStage          $stage,
  CoglFramebuffer       $framebuffer,
  cairo_rectangle_int_t $rect,
  gfloat                $scale,
  ClutterPaintFlag      $paint_flags
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_read_pixels (
  ClutterStage $stage,
  gint         $x,
  gint         $y,
  gint         $width,
  gint         $height
)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_stage_schedule_update (ClutterStage $stage)
  is native(mutter)
  is export
{ * }

sub clutter_stage_set_key_focus (ClutterStage $stage, ClutterActor $actor)
  is native(mutter)
  is export
{ * }

sub clutter_stage_set_minimum_size (
  ClutterStage $stage,
  guint        $width,
  guint        $height
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_set_title (ClutterStage $stage, Str $title)
  is native(mutter)
  is export
{ * }
