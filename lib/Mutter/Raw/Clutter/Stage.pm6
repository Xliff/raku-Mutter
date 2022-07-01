use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Stage;

### /usr/src/mutter-42.1/clutter/clutter/clutter-stage.h

sub clutter_perspective_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_ensure_viewport (MutterClutterStage $stage)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_actor_at_pos (
  MutterClutterStage    $stage,
  MutterClutterPickMode $pick_mode,
  gfloat                $x,
  gfloat                $y
)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_capture_final_size (
  MutterClutterStage          $stage,
  cairo_rectangle_int_t       $rect,
  gint                        $out_width  is rw,
  gint                        $out_height is rw,
  gfloat                      $out_scale  is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_device_actor (
  MutterClutterStage         $stage,
  MutterClutterInputDevice   $device,
  MutterClutterEventSequence $sequence
)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_event_actor (
  MutterClutterStage $stage,
  MutterClutterEvent $event
)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_grab_actor (MutterClutterStage $stage)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_key_focus (MutterClutterStage $stage)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_minimum_size (
  MutterClutterStage $stage,
  guint              $width  is rw,
  guint              $height is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_perspective (
  MutterClutterStage       $stage,
  MutterClutterPerspective $perspective
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_title (MutterClutterStage $stage)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_get_view_at (MutterClutterStage $stage, gfloat $x, gfloat $y)
  returns MutterClutterStageView
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_grab (MutterClutterStage $stage, MutterClutterActor $actor)
  returns MutterClutterGrab
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_is_redraw_queued_on_view (
  MutterClutterStage     $stage,
  MutterClutterStageView $view
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_paint_to_buffer (
  MutterClutterStage      $stage,
  cairo_rectangle_int_t   $rect,
  gfloat                  $scale,
  CArray[uint8]           $data,
  gint                    $stride,
  guint                   $format,       #= MutterMutterCoglPixelFormat
  MutterClutterPaintFlag  $paint_flags,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_paint_to_content (
  MutterClutterStage      $stage,
  cairo_rectangle_int_t   $rect,
  gfloat                  $scale,
  MutterClutterPaintFlag  $paint_flags,
  CArray[Pointer[GError]] $error
)
  returns MutterClutterContent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_paint_to_framebuffer (
  MutterClutterStage     $stage,
  MutterCoglFramebuffer  $framebuffer,
  cairo_rectangle_int_t  $rect,
  gfloat                 $scale,
  MutterClutterPaintFlag $paint_flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_read_pixels (
  MutterClutterStage $stage,
  gint               $x,
  gint               $y,
  gint               $width,
  gint               $height
)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_schedule_update (MutterClutterStage $stage)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_set_key_focus (
  MutterClutterStage $stage,
  MutterClutterActor $actor
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_set_minimum_size (
  MutterClutterStage $stage,
  guint              $width,
  guint              $height
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_set_title (MutterClutterStage $stage, Str $title)
  is native(mutter-clutter)
  is export
{ * }
