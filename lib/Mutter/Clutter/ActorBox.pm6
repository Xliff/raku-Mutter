use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::MiscTypes;

use GLib::Roles::Implementor;

class Mutter::Clutter::ActorBox {
  has MutterClutterActorBox $!mcab is implementor;

  method alloc {
    clutter_actor_box_alloc();
  }

  method clamp_to_pixel {
    clutter_actor_box_clamp_to_pixel($!mcab);
  }

  method contains (Num() $x, Num() $y) {
    my gfloat ($xx, $yy) = ($x, $y);

    so clutter_actor_box_contains($!mcab, $xx, $yy);
  }

  method copy {
    clutter_actor_box_copy($!mcab);
  }

  method equal (MutterClutterActorBox() $box_b) {
    clutter_actor_box_equal($!mcab, $box_b);
  }

  method free {
    clutter_actor_box_free($!mcab);
  }

  method from_vertices (graphene_point3d_t() $verts) {
    clutter_actor_box_from_vertices($!mcab, $verts);
  }

  method get_area {
    clutter_actor_box_get_area($!mcab);
  }

  method get_height {
    clutter_actor_box_get_height($!mcab);
  }

  method get_origin (gfloat $x is rw, gfloat $y is rw) {
    clutter_actor_box_get_origin($!mcab, $x, $y);
  }

  method get_size (gfloat $width is rw, gfloat $height is rw) {
    clutter_actor_box_get_size($!mcab, $width, $height);
  }

  method get_type {
    clutter_actor_box_get_type();
  }

  method get_width {
    clutter_actor_box_get_width($!mcab);
  }

  method get_x {
    clutter_actor_box_get_x($!mcab);
  }

  method get_y {
    clutter_actor_box_get_y($!mcab);
  }

  method init (gfloat $x_1, gfloat $y_1, gfloat $x_2, gfloat $y_2) {
    clutter_actor_box_init($!mcab, $x_1, $y_1, $x_2, $y_2);
  }

  method init_rect (gfloat $x, gfloat $y, gfloat $width, gfloat $height) {
    clutter_actor_box_init_rect($!mcab, $x, $y, $width, $height);
  }

  method interpolate (
    MutterClutterActorBox $final,
    gdouble         $progress,
    MutterClutterActorBox $result
  ) {
    clutter_actor_box_interpolate($!mcab, $final, $progress, $result);
  }

  method is_initialized {
    clutter_actor_box_is_initialized($!mcab);
  }

  method new (gfloat $y_1, gfloat $x_2, gfloat $y_2) {
    clutter_actor_box_new($!mcab, $y_1, $x_2, $y_2);
  }

  method scale (gfloat $scale) {
    clutter_actor_box_scale($!mcab, $scale);
  }

  method set_origin (gfloat $x, gfloat $y) {
    clutter_actor_box_set_origin($!mcab, $x, $y);
  }

  method set_size (gfloat $width, gfloat $height) {
    clutter_actor_box_set_size($!mcab, $width, $height);
  }

  method union (
    MutterClutterActorBox $b,
    MutterClutterActorBox $result
  ) {
    clutter_actor_box_union($!mcab, $b, $result);
  }
}
