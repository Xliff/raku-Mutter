use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::MiscTypes;

### /usr/src/mutter-42.1/clutter/clutter/clutter-types.h

sub clutter_actor_box_alloc ()
  returns ClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_clamp_to_pixel (ClutterActorBox $box)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_contains (ClutterActorBox $box, gfloat $x, gfloat $y)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_copy (ClutterActorBox $box)
  returns ClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_equal (ClutterActorBox $box_a, ClutterActorBox $box_b)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_free (ClutterActorBox $box)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_from_vertices (
  ClutterActorBox    $box,
  graphene_point3d_t $verts
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_area (ClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_height (ClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_origin (
  ClutterActorBox $box,
  gfloat          $x    is rw,
  gfloat          $y    is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_size (
  ClutterActorBox $box,
  gfloat          $width is rw,
  gfloat          $height is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_width (ClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_x (ClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_y (ClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_init (
  ClutterActorBox $box,
  gfloat          $x_1,
  gfloat          $y_1,
  gfloat          $x_2,
  gfloat          $y_2
)
  returns ClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_init_rect (
  ClutterActorBox $box,
  gfloat $x,
  gfloat $y,
  gfloat $width,
  gfloat $height
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_interpolate (
  ClutterActorBox $initial,
  ClutterActorBox $final,
  gdouble         $progress,
  ClutterActorBox $result
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_is_initialized (ClutterActorBox $box)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_new (gfloat $x_1, gfloat $y_1, gfloat $x_2, gfloat $y_2)
  returns ClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_scale (ClutterActorBox $box, gfloat $scale)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_set_origin (ClutterActorBox $box, gfloat $x, gfloat $y)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_set_size (
  ClutterActorBox $box,
  gfloat          $width,
  gfloat          $height
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_union (
  ClutterActorBox $a,
  ClutterActorBox $b,
  ClutterActorBox $result
)
  is native(mutter)
  is export
{ * }

sub clutter_interval_register_progress_func (
  GType               $value_type,
  ClutterProgressFunc $func
)
  is native(mutter)
  is export
{ * }

sub clutter_knot_copy (ClutterKnot $knot)
  returns ClutterKnot
  is native(mutter)
  is export
{ * }

sub clutter_knot_equal (ClutterKnot $knot_a, ClutterKnot $knot_b)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_knot_free (ClutterKnot $knot)
  is native(mutter)
  is export
{ * }

sub clutter_knot_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_margin_copy (ClutterMargin $margin_)
  returns ClutterMargin
  is native(mutter)
  is export
{ * }

sub clutter_margin_free (ClutterMargin $margin_)
  is native(mutter)
  is export
{ * }

sub clutter_margin_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_margin_new ()
  returns ClutterMargin
  is native(mutter)
  is export
{ * }

sub clutter_path_node_copy (ClutterPathNode $node)
  returns ClutterPathNode
  is native(mutter)
  is export
{ * }

sub clutter_path_node_equal (ClutterPathNode $node_a, ClutterPathNode $node_b)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_path_node_free (ClutterPathNode $node)
  is native(mutter)
  is export
{ * }

sub clutter_path_node_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_copy (ClutterPaintVolume $pv)
  returns ClutterPaintVolume
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_free (ClutterPaintVolume $pv)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_depth (ClutterPaintVolume $pv)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_height (ClutterPaintVolume $pv)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_origin (
  ClutterPaintVolume $pv,
  graphene_point3d_t $vertex
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_width (ClutterPaintVolume $pv)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_depth (ClutterPaintVolume $pv, gfloat $depth)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_from_allocation (
  ClutterPaintVolume $pv,
  ClutterActor       $actor
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_height (ClutterPaintVolume $pv, gfloat $height)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_origin (
  ClutterPaintVolume $pv,
  graphene_point3d_t $origin
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_width (ClutterPaintVolume $pv, gfloat $width)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_union (
  ClutterPaintVolume $pv,
  ClutterPaintVolume $another_pv
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_union_box (
  ClutterPaintVolume $pv,
  ClutterActorBox    $box
)
  is native(mutter)
  is export
{ * }
