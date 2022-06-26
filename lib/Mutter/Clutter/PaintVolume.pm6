use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::MiscTypes;

class Mutter::Clutter::PaintVolume {
  has MutterClutterPaintVolume $!mcpv is implementor;

  method copy {
    propReturnObject(
      clutter_paint_volume_copy($!mcpv),
      $raw,
      |self.getTypePair
    );
  }

  method !free {
    clutter_paint_volume_free($!mcpv);
  }

  method get_depth {
    clutter_paint_volume_get_depth($!mcpv);
  }

  method get_height {
    clutter_paint_volume_get_height($!mcpv);
  }

  proto method get_origin (|)
  { * }

  multi method get_origin {
    samewith( graphene_point3d_t.new );
  }
  multi method get_origin (graphene_point3d_t() $vertex) {
    clutter_paint_volume_get_origin($!mcpv, $vertex);
    $vertex;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_paint_volume_get_type, $n, $t );
  }

  method get_width {
    clutter_paint_volume_get_width($!mcpv);
  }

  method set_depth (Num() $depth) {
    my gfloat $d = $depth;

    clutter_paint_volume_set_depth($!mcpv, $d);
  }

  method set_from_allocation (ClutterActor() $actor) {
    clutter_paint_volume_set_from_allocation($!mcpv, $actor);
  }

  method set_height (Num() $height) {
    my gfloat $h = $height;

    clutter_paint_volume_set_height($!mcpv, $h);
  }

  method set_origin (graphene_point3d_t() $origin) {
    clutter_paint_volume_set_origin($!mcpv, $origin);
  }

  method set_width (Num() $width) {
    my gfloat $w = $width;

    clutter_paint_volume_set_width($!mcpv, $w);
  }

  method union (ClutterPaintVolume() $another_pv) {
    clutter_paint_volume_union($!mcpv, $another_pv);
  }

  method union_box (ClutterActorBox() $box) {
    clutter_paint_volume_union_box($!mcpv, $box);
  }

}

# method clutter_interval_register_progress_func (&func) {
#   clutter_interval_register_progress_func($!mcpv, &func);
# }
#
# method clutter_knot_copy {
#   clutter_knot_copy($!mcpv);
# }
#
# method clutter_knot_equal (ClutterKnot $knot_b) {
#   clutter_knot_equal($!mcpv, $knot_b);
# }
#
# method clutter_knot_free {
#   clutter_knot_free($!mcpv);
# }
#
# method clutter_knot_get_type {
#   clutter_knot_get_type();
# }
#
# method clutter_margin_copy {
#   clutter_margin_copy($!mcpv);
# }
#
# method clutter_margin_free {
#   clutter_margin_free($!mcpv);
# }
#
# method clutter_margin_get_type {
#   clutter_margin_get_type();
# }
#
# method clutter_margin_new {
#   clutter_margin_new();
# }
#
# method clutter_path_node_copy {
#   clutter_path_node_copy($!mcpv);
# }
#
# method clutter_path_node_equal (ClutterPathNode $node_b) {
#   clutter_path_node_equal($!mcpv, $node_b);
# }
#
# method clutter_path_node_free {
#   clutter_path_node_free($!mcpv);
# }
#
# method clutter_path_node_get_type {
#   clutter_path_node_get_type();
# }
