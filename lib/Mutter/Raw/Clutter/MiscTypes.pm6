use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::MiscTypes;

### /usr/src/mutter-42.1/clutter/clutter/clutter-types.h

#: ClutterProgressFunc (GValue, GValue, gdouble, GValue --> gboolean);

sub clutter_actor_box_alloc ()
  returns MutterClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_clamp_to_pixel (MutterClutterActorBox $box)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_contains (
  MutterClutterActorBox $box,
  gfloat                $x,
  gfloat                $y
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_copy (MutterClutterActorBox $box)
  returns MutterClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_equal (
  MutterClutterActorBox $box_a,
  MutterClutterActorBox $box_b
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_free (MutterClutterActorBox $box)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_from_vertices (
  MutterClutterActorBox    $box,
  graphene_point3d_t       $verts
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_area (MutterClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_height (MutterClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_origin (
  MutterClutterActorBox $box,
  gfloat                $x    is rw,
  gfloat                $y    is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_size (
  MutterClutterActorBox $box,
  gfloat                $width  is rw,
  gfloat                $height is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_width (MutterClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_x (MutterClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_get_y (MutterClutterActorBox $box)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_init (
  MutterClutterActorBox $box,
  gfloat                $x_1,
  gfloat                $y_1,
  gfloat                $x_2,
  gfloat                $y_2
)
  returns MutterClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_init_rect (
  MutterClutterActorBox $box,
  gfloat                $x,
  gfloat                $y,
  gfloat                $width,
  gfloat                $height
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_interpolate (
  MutterClutterActorBox $initial,
  MutterClutterActorBox $final,
  gdouble               $progress,
  MutterClutterActorBox $result
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_is_initialized (MutterClutterActorBox $box)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_new (gfloat $x_1, gfloat $y_1, gfloat $x_2, gfloat $y_2)
  returns MutterClutterActorBox
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_scale (MutterClutterActorBox $box, gfloat $scale)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_set_origin (
  MutterClutterActorBox $box,
  gfloat                $x,
  gfloat                $y
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_set_size (
  MutterClutterActorBox $box,
  gfloat                $width,
  gfloat                $height
)
  is native(mutter)
  is export
{ * }

sub clutter_actor_box_union (
  MutterClutterActorBox $a,
  MutterClutterActorBox $b,
  MutterClutterActorBox $result
)
  is native(mutter)
  is export
{ * }

sub clutter_interval_register_progress_func (
  GType                     $value_type,
                            &func (
                              GValue,
                              GValue,
                              gdouble,
                              GValue
                              --> gboolean
                            )
)
  is native(mutter)
  is export
{ * }

sub clutter_knot_copy (MutterClutterKnot $knot)
  returns MutterClutterKnot
  is native(mutter)
  is export
{ * }

sub clutter_knot_equal (MutterClutterKnot $knot_a, MutterClutterKnot $knot_b)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_knot_free (MutterClutterKnot $knot)
  is native(mutter)
  is export
{ * }

sub clutter_knot_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_margin_copy (MutterClutterMargin $margin_)
  returns MutterClutterMargin
  is native(mutter)
  is export
{ * }

sub clutter_margin_free (MutterClutterMargin $margin_)
  is native(mutter)
  is export
{ * }

sub clutter_margin_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_margin_new ()
  returns MutterClutterMargin
  is native(mutter)
  is export
{ * }

sub clutter_path_node_copy (MutterClutterPathNode $node)
  returns MutterClutterPathNode
  is native(mutter)
  is export
{ * }

sub clutter_path_node_equal (
  MutterClutterPathNode $node_a,
  MutterClutterPathNode $node_b
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_path_node_free (MutterClutterPathNode $node)
  is native(mutter)
  is export
{ * }

sub clutter_path_node_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_copy (MutterClutterPaintVolume $pv)
  returns MutterClutterPaintVolume
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_free (MutterClutterPaintVolume $pv)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_depth (MutterClutterPaintVolume $pv)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_height (MutterClutterPaintVolume $pv)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_origin (
  MutterClutterPaintVolume $pv,
  graphene_point3d_t       $vertex
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_get_width (MutterClutterPaintVolume $pv)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_depth (
  MutterClutterPaintVolume $pv,
  gfloat                   $depth
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_from_allocation (
  MutterClutterPaintVolume $pv,
  MutterClutterActor       $actor
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_height (
  MutterClutterPaintVolume $pv,
  gfloat                   $height
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_origin (
  MutterClutterPaintVolume $pv,
  graphene_point3d_t       $origin
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_set_width (
  MutterClutterPaintVolume $pv,
  gfloat                   $width
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_union (
  MutterClutterPaintVolume $pv,
  MutterClutterPaintVolume $another_pv
)
  is native(mutter)
  is export
{ * }

sub clutter_paint_volume_union_box (
  MutterClutterPaintVolume $pv,
  MutterClutterActorBox    $box
)
  is native(mutter)
  is export
{ * }
