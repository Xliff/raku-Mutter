use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::OffscreenEffect;

### /usr/src/mutter-42.1/clutter/clutter/clutter-offscreen-effect.h

sub clutter_offscreen_effect_create_texture (
  MutterClutterOffscreenEffect $effect,
  gfloat                       $width,
  gfloat                       $height
)
  returns MutterCoglHandle
  is native(mutter)
  is export
{ * }

sub clutter_offscreen_effect_get_pipeline (
  MutterClutterOffscreenEffect $effect
)
  returns MutterCoglPipeline
  is native(mutter)
  is export
{ * }

sub clutter_offscreen_effect_get_target_size (
  MutterClutterOffscreenEffect $effect,
  gfloat                       $width   is rw,
  gfloat                       $height  is rw
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_offscreen_effect_get_texture (MutterClutterOffscreenEffect $effect)
  returns MutterCoglHandle
  is native(mutter)
  is export
{ * }

sub clutter_offscreen_effect_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_offscreen_effect_paint_target (
  MutterClutterOffscreenEffect $effect,
  MutterClutterPaintNode       $node,
  MutterClutterPaintContext    $paint_context
)
  is native(mutter)
  is export
{ * }
