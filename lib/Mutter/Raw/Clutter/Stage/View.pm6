use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Stage::View;

### /usr/src/mutter-42.1/clutter/clutter/clutter-stage-view.h

sub clutter_stage_view_destroy (MutterClutterStageView $view)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_frame_clock (MutterClutterStageView $view)
  returns MutterClutterFrameClock
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_framebuffer (MutterClutterStageView $view)
  returns MutterCoglFramebuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_layout (
  MutterClutterStageView $view,
  cairo_rectangle_int_t  $rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_offscreen_transformation_matrix (
  MutterClutterStageView $view,
  graphene_matrix_t      $matrix
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_onscreen (MutterClutterStageView $view)
  returns MutterCoglFramebuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_refresh_rate (MutterClutterStageView $view)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_get_scale (MutterClutterStageView $view)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_invalidate_offscreen_blit_pipeline (
  MutterClutterStageView $view
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_stage_view_peek_scanout (MutterClutterStageView $view)
  returns MutterCoglScanout
  is native(mutter-clutter)
  is export
{ * }
