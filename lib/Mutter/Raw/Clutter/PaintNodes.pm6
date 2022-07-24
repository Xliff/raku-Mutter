use v6.c;

use NativeCall;

use Cairo;

use GLib::Raw::Definitions;
use Pango::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::PaintNodes;

### /usr/src/mutter-42.1/clutter/clutter/clutter-paint-nodes.h

sub clutter_actor_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_node_new (MutterClutterActor $actor, gint $opacity)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_blit_node_add_blit_rectangle (
  MutterClutterBlitNode $blit_node,
  gint                  $src_x,
  gint                  $src_y,
  gint                  $dst_x,
  gint                  $dst_y,
  gint                  $width,
  gint                  $height
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_blit_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_blit_node_new (MutterCoglFramebuffer $src)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_blur_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_blur_node_new (gint $width, gint $height, gfloat $sigma)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_clip_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_clip_node_new ()
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_color_node_new (MutterClutterColor $color)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layer_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layer_node_new (
  graphene_matrix_t $projection,
  cairo_rectangle_t $viewport,
  gfloat            $width,
  gfloat            $height,
  guint8            $opacity
)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layer_node_new_to_framebuffer (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPipeline    $pipeline
)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pipeline_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pipeline_node_new (MutterCoglPipeline $pipeline)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_root_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_root_node_new (
  MutterCoglFramebuffer $framebuffer,
  MutterClutterColor    $clear_color,
  MutterCoglBufferBit   $clear_flags
)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_node_new (
  PangoLayout        $layout,
  MutterClutterColor $color
)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_texture_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_texture_node_new (
  MutterCoglTexture          $texture,
  MutterClutterColor         $color,
  MutterClutterScalingFilter $min_filter,
  MutterClutterScalingFilter $mag_filter
)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transform_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_transform_node_new (graphene_matrix_t $projection)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }
