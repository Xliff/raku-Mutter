use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Stage::View;


### /usr/src/mutter-42.1/clutter/clutter/clutter-stage-view.h

sub clutter_stage_view_destroy (ClutterStageView $view)
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_frame_clock (ClutterStageView $view)
  returns ClutterFrameClock
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_framebuffer (ClutterStageView $view)
  returns CoglFramebuffer
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_layout (
  ClutterStageView $view,
  cairo_rectangle_int_t $rect
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_offscreen_transformation_matrix (
  ClutterStageView $view,
  graphene_matrix_t $matrix
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_onscreen (ClutterStageView $view)
  returns CoglFramebuffer
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_refresh_rate (ClutterStageView $view)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_get_scale (ClutterStageView $view)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_invalidate_offscreen_blit_pipeline (
  ClutterStageView $view
)
  is native(mutter)
  is export
{ * }

sub clutter_stage_view_peek_scanout (ClutterStageView $view)
  returns CoglScanout
  is native(mutter)
  is export
{ * }
