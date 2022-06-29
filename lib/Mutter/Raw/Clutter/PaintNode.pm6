use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Clutter::Raw::PaintNode;

### /usr/src/mutter-clutter-42.1/clutter/clutter/clutter-paint-node.h

sub clutter_paint_node_add_child (
  ClutterPaintNode $node,
  ClutterPaintNode $child
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_multitexture_rectangle (
  ClutterPaintNode $node,
  ClutterActorBox  $rect,
  CArray[gfloat]   $text_coords,
  gint             $text_coords_len
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_primitive (
  ClutterPaintNode $node,
  CoglPrimitive    $primitive
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_rectangle (
  ClutterPaintNode $node,
  ClutterActorBox  $rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_rectangles (
  ClutterPaintNode $node,
  CArray[gfloat]   $coords,
  gint $n_rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_texture_rectangle (
  ClutterPaintNode $node,
  ClutterActorBox  $rect,
  gfloat           $x_1,
  gfloat           $y_1,
  gfloat           $x_2,
  gfloat           $y_2
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_add_texture_rectangles (
  ClutterPaintNode $node,
  CArray[gfloat]   $coords,
  gint             $n_rects
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

sub clutter_paint_node_get_framebuffer (ClutterPaintNode $node)
  returns CoglFramebuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_paint (
  ClutterPaintNode    $node,
  ClutterPaintContext $paint_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_ref (ClutterPaintNode $node)
  returns ClutterPaintNode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_set_name (ClutterPaintNode $node, Str $name)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_set_static_name (ClutterPaintNode $node, Str $name)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_paint_node_unref (ClutterPaintNode $node)
  is native(mutter-clutter)
  is export
{ * }
