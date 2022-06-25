use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::MiscTypes;

class Mutter::Clutter::ActorBox {
  method alloc {
    clutter_actor_box_alloc($!mcpv);
  }

  method clamp_to_pixel {
    clutter_actor_box_clamp_to_pixel($!mcpv);
  }

  method contains (gfloat $x, gfloat $y) {
    clutter_actor_box_contains($!mcpv, $x, $y);
  }

  method copy {
    clutter_actor_box_copy($!mcpv);
  }

  method equal (ClutterActorBox $box_b) {
    clutter_actor_box_equal($!mcpv, $box_b);
  }

  method free {
    clutter_actor_box_free($!mcpv);
  }

  method from_vertices (graphene_point3d_t $verts) {
    clutter_actor_box_from_vertices($!mcpv, $verts);
  }

  method get_area {
    clutter_actor_box_get_area($!mcpv);
  }

  method get_height {
    clutter_actor_box_get_height($!mcpv);
  }

  method get_origin (gfloat $x is rw, gfloat $y is rw) {
    clutter_actor_box_get_origin($!mcpv, $x is rw, $y is rw);
  }

  method get_size (gfloat $width is rw, gfloat $height is rw) {
    clutter_actor_box_get_size($!mcpv, $width is rw, $height is rw);
  }

  method get_type {
    clutter_actor_box_get_type();
  }

  method get_width {
    clutter_actor_box_get_width($!mcpv);
  }

  method get_x {
    clutter_actor_box_get_x($!mcpv);
  }

  method get_y {
    clutter_actor_box_get_y($!mcpv);
  }

  method init (gfloat $x_1, gfloat $y_1, gfloat $x_2, gfloat $y_2) {
    clutter_actor_box_init($!mcpv, $x_1, $y_1, $x_2, $y_2);
  }

  method init_rect (gfloat $x, gfloat $y, gfloat $width, gfloat $height) {
    clutter_actor_box_init_rect($!mcpv, $x, $y, $width, $height);
  }

  method interpolate (
    ClutterActorBox $final,
    gdouble         $progress, 
    ClutterActorBox $result
  ) {
    clutter_actor_box_interpolate($!mcpv, $final, $progress, $result);
  }

  method is_initialized {
    clutter_actor_box_is_initialized($!mcpv);
  }

  method new (gfloat $y_1, gfloat $x_2, gfloat $y_2) {
    clutter_actor_box_new($!mcpv, $y_1, $x_2, $y_2);
  }

  method scale (gfloat $scale) {
    clutter_actor_box_scale($!mcpv, $scale);
  }

  method set_origin (gfloat $x, gfloat $y) {
    clutter_actor_box_set_origin($!mcpv, $x, $y);
  }

  method set_size (gfloat $width, gfloat $height) {
    clutter_actor_box_set_size($!mcpv, $width, $height);
  }

  method union (ClutterActorBox $b, ClutterActorBox $result) {
    clutter_actor_box_union($!mcpv, $b, $result);
  }
}
