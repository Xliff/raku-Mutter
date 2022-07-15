use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Clutter::Raw::PaintNode;

### /usr/src/mutter-42.1/clutter/clutter/clutter-paint-node.h

sub clutter_paint_node_add_child (
  MutterClutterPaintNode $node,
  MutterClutterPaintNode $child
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_multitexture_rectangle (
  MutterClutterPaintNode $node,
  MutterClutterActorBox  $rect,
  CArray[gfloat]         $text_coords,
  gint                   $text_coords_len
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_primitive (
  MutterClutterPaintNode $node,
  MutterCoglPrimitive    $primitive
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_rectangle (
  MutterClutterPaintNode $node,
  MutterClutterActorBox  $rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_rectangles (
  MutterClutterPaintNode $node,
  CArray[gfloat]         $coords,
  gint $n_rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_texture_rectangle (
  MutterClutterPaintNode $node,
  MutterClutterActorBox  $rect,
  gfloat                 $x_1,
  gfloat                 $y_1,
  gfloat                 $x_2,
  gfloat                 $y_2
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_texture_rectangles (
  MutterClutterPaintNode $node,
  CArray[gfloat]         $coords,
  gint                   $n_rects
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_dup_paint_node (GValue $value)
  returns Pointer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_get_paint_node (GValue $value)
  returns Pointer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_set_paint_node (GValue $value, gpointer $node)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_take_paint_node (GValue $value, gpointer $node)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_get_framebuffer (MutterClutterPaintNode $node)
  returns MutterCoglFramebuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_paint (
  MutterClutterPaintNode    $node,
  MutterClutterPaintContext $paint_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_ref (MutterClutterPaintNode $node)
  returns MutterClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_set_name (MutterClutterPaintNode $node, Str $name)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_set_static_name (
  MutterClutterPaintNode $node,
  Str                    $name
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_unref (MutterClutterPaintNode $node)
  is native(mutter-clutter)
  is export
{ * }
