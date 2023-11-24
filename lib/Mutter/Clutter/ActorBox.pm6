use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::MiscTypes;

use GLib::Roles::Implementor;

# BOXED

class Mutter::Clutter::ActorBox {
  also does GLib::Roles::Implementor;

  has MutterClutterActorBox $!mcab is implementor handles <
    x1
    x2
    y1
    y2
    width
    height
    w
    h
  >;

  submethod BUILD ( :$mutter-actor-box ) {
    $!mcab = $mutter-actor-box if $mutter-actor-box;
  }

  method Mutter::Clutter::Raw::Types::MutterClutterActorBox
    is also<MutterClutterActorBox>
  { $!mcab }

  method new (Num() $x_1, Num() $y_1, Num() $x_2, Num() $y_2) {
    my gfloat ($x1, $y1, $x2, $y2) = ($x_1, $y_1, $x_2, $y_2);

    my $mutter-actor-box = clutter_actor_box_new($x1, $y1, $x2, $y2);

    $mutter-actor-box ?? self.bless( :$mutter-actor-box ) !! Nil;
  }

  method new_from_vertices (graphene_point3d_t() $verts)
    is also<
      new-from-vertices
      from_vertices
      from-vertices
    >
  {
    my $mutter-actor-box = clutter_actor_box_from_vertices($verts);

    $mutter-actor-box ?? self.bless( :$mutter-actor-box ) !! Nil;
  }

  method alloc {
    clutter_actor_box_alloc();
  }

  method clamp_to_pixel is also<clamp-to-pixel> {
    clutter_actor_box_clamp_to_pixel($!mcab);
  }

  method contains (Num() $x, Num() $y) {
    my gfloat ($xx, $yy) = ($x, $y);

    so clutter_actor_box_contains($!mcab, $xx, $yy);
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      clutter_actor_box_copy($!mcab),
      $raw,
      |::?CLASS.getTypePair
    );
  }

  method equal (MutterClutterActorBox() $box_b) {
    so clutter_actor_box_equal($!mcab, $box_b);
  }

  method free {
    clutter_actor_box_free($!mcab);
  }

  method get_area
    is also<
      get-area
      area
    >
  {
    clutter_actor_box_get_area($!mcab);
  }

  method get_height
    is also<
      get-height
      height
      h
    >
  {
    clutter_actor_box_get_height($!mcab);
  }

  proto method get_origin (|)
    is also<get-origin>
  { * }

  multi method get_origin is also<origin> {
    samewith($, $);
  }
  multi method get_origin ($x is rw, $y is rw) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_actor_box_get_origin($!mcab, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  proto method get_size (|)
    is also<get-size>
  { * }

  multi method get_size is also<size> {
    samewith($, $);
  }
  multi method get_size ($width is rw, $height is rw)  {
    my gfloat ($w, $h) = 0e0 xx 2;

    clutter_actor_box_get_size($!mcab, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_actor_box_get_type, $n, $t );
  }

  method get_width
    is also<
      get-width
      width
      w
    >
  {
    clutter_actor_box_get_width($!mcab);
  }

  method get_x
    is also<
      get-x
      x
    >
  {
    clutter_actor_box_get_x($!mcab);
  }

  method get_y
    is also<
      get-y
      y
    >
  {
    clutter_actor_box_get_y($!mcab);
  }

  method init (Num() $x_1, Num() $y_1, Num() $x_2, Num() $y_2) {
    my gfloat ($x1, $y1, $x2, $y2) = ($x_1, $y_1, $x_2, $y_2);

    clutter_actor_box_init($!mcab, $x1, $y1, $x2, $y2);
  }

  method init_rect (Num() $x, Num() $y, Num() $width, Num() $height)
    is also<init-rect>
  {
    my gfloat ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    clutter_actor_box_init_rect($!mcab, $xx, $yy, $w, $h);
  }

  multi method interpolate (
    MutterClutterActorBox() $final,
    Num()                   $progress,
  ) {
    samewith($final, $progress, self.alloc);
  }
  multi method interpolate (
    MutterClutterActorBox()  $final,
    Num()                    $progress,
    MutterClutterActorBox()  $result,
                            :$raw       = False
  ) {
    my gdouble $p = $progress;

    clutter_actor_box_interpolate($!mcab, $final, $p, $result);
    propReturnObject($result, $raw, |::?CLASS.getTypePair);
  }

  method is_initialized is also<is-initialized> {
    so clutter_actor_box_is_initialized($!mcab);
  }

  method scale (Num() $scale) {
    my gfloat $s = $scale;

    clutter_actor_box_scale($!mcab, $s);
  }

  method set_origin (Num() $x, Num() $y) is also<set-origin> {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_actor_box_set_origin($!mcab, $xx, $yy);
  }

  method set_size (Num() $width, Num() $height) is also<set-size> {
    my gfloat ($w, $h) = ($width, $height);

    clutter_actor_box_set_size($!mcab, $w, $h);
  }

  multi method union (MutterClutterActorBox() $b) {
    samewith($b, ::?CLASS.alloc);
  }
  multi method union (
    MutterClutterActorBox()  $b,
    MutterClutterActorBox()  $result,
                            :$raw     = False
  ) {
    clutter_actor_box_union($!mcab, $b, $result);
    propReturnObject($result, $raw, |self.getTypePair)
  }

}
