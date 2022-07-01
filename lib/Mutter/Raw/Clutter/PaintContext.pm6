use v6.c;

use NativeCall;

use Cairo;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::PaintContext;

### /usr/src/mutter-42.1/clutter/clutter/clutter-paint-context.h

sub clutter_paint_context_destroy (
  MutterClutterPaintContext $paint_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_get_framebuffer (
  MutterClutterPaintContext $paint_context
)
  returns MutterCoglFramebuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_get_paint_flags (
  MutterClutterPaintContext $paint_context
)
  returns MutterClutterPaintFlag
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_get_redraw_clip (
  MutterClutterPaintContext $paint_context
)
  returns cairo_region_t
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_get_stage_view (
  MutterClutterPaintContext $paint_context
)
  returns MutterClutterStageView
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_new_for_framebuffer (
  MutterCoglFramebuffer  $framebuffer,
  cairo_region_t         $redraw_clip,
  MutterClutterPaintFlag $paint_flags
)
  returns MutterClutterPaintContext
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_pop_framebuffer (
  MutterClutterPaintContext $paint_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_push_framebuffer (
  MutterClutterPaintContext $paint_context,
  MutterCoglFramebuffer     $framebuffer
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_ref (MutterClutterPaintContext $paint_context)
  returns MutterClutterPaintContext
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_context_unref (MutterClutterPaintContext $paint_context)
  is native(mutter-clutter)
  is export
{ * }
