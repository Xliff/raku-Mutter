use v6.c;

use NativeCall;
use Method::Also;

use Mutter::Raw::Types;

# Boxed

class Mutter::Clutter::Rect {
  has MutterClutterRect $!cr handles <origin size>;

  my $zero = clutter_rect_zero();

  submethod BUILD (:$rect) {
    $!cr = $rect;
  }

  method Mutter::Raw::Structs::MutterClutterRect
    is also<MutterClutterRect>
  { $!cr }

  multi method new (MutterClutterRect $rect) {
    $rect ?? self.bless(:$rect) !! Nil;
  }
  multi method new (
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height
  ) {
    self.init($x, $y, $width, $height);
  }

  multi method init (
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height
  ) {
    my $rect = Clutter::Rect.alloc;

    return unless $rect;

    Clutter::Rect.init($rect, $x, $y, $width, $height);

    self.bless(:$rect);
  }
  multi method init (
    MutterClutterRect $r,
    Num()             $x,
    Num()             $y,
    Num()             $width,
    Num()             $height
  )
    is static
  {
    my gfloat ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    clutter_rect_init($r, $xx, $yy, $w, $h);
    $r;
  }

  method alloc is static {
    clutter_rect_alloc();
  }

  method clamp_to_pixel is also<clamp-to-pixel> {
    clutter_rect_clamp_to_pixel($!cr);
  }

  # method contains_point (ClutterPoint() $point) is also<contains-point> {
  #   clutter_rect_contains_point($!cr, $point);
  # }

  method contains_rect (MutterClutterRect() $b) is also<contains-rect> {
    clutter_rect_contains_rect($!cr, $b);
  }

  method copy ( :$raw = False ) {
    propReturnObject(clutter_rect_copy($!cr), $raw, |self.getTypePair);

  }

  method equals (MutterClutterRect() $b) {
    so clutter_rect_equals($!cr, $b);
  }

  method !free {
    clutter_rect_free($!cr);
  }

  proto method get_center (|)
    is also<get-center>
  { * }

  # multi method get_center ($raw = False) is also<center> {
  #   my $c = ClutterPoint.new;
  #
  #   die 'Could not allocate ClutterPoint!' unless $c;
  #
  #   Clutter::Rect.get_center($!cr, $c);
  #
  #   $raw ?? $c !! Clutter::Point.new($c);
  # }
  # multi method get_center (ClutterPoint() $center) {
  #   clutter_rect_get_center($!cr, $center);
  # }

  method get_height
    is also<
      get-height
      height
    >
  {
    clutter_rect_get_height($!cr);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_rect_get_type, $n, $t );
  }

  method get_width
    is also<
      get-width
      width
    >
  {
    clutter_rect_get_width($!cr);
  }

  method get_x
    is also<
      get-x
      x
    >
  {
    clutter_rect_get_x($!cr);
  }

  method get_y
    is also<
      get-y
      y
    >
  {
    clutter_rect_get_y($!cr);
  }

  method inset (Num() $d_x, Num() $d_y) {
    my gfloat ($dx, $dy) = ($d_x, $d_y);

    clutter_rect_inset($!cr, $d_x, $d_y);
  }

  multi method intersection (MutterClutterRect() $b, :$raw = False) {
    my $r = MutterClutterRect.new;

    return Nil unless $r;

    ::?CLASS.intersection($!cr, $b, $r);

    $raw ?? $r !! Clutter::Rect.new($r);
  }
  multi method intersection (
    MutterClutterRect() $a,
    MutterClutterRect() $b,
    MutterClutterRect() $res
  )
    is static
  {
    clutter_rect_intersection($!cr, $b, $res);
    $res;
  }

  method normalize {
    clutter_rect_normalize($!cr);
  }

  method offset (Num() $d_x, Num() $d_y) {
    my gfloat ($dx, $dy) = ($d_x, $d_y);

    clutter_rect_offset($!cr, $d_x, $d_y);
  }

  multi method union (MutterClutterRect() $b, :$raw = False) {
    my $r = MutterClutterRect.new;

    return Nil unless $r;

    ::?CLASS.union($!cr, $b, $r);

    $raw ?? $r !! Clutter::Rect.new($r);
  }
  multi method union (
    MutterClutterRect() $a,
    MutterClutterRect() $b,
    MutterClutterRect() $res
  )
    is static
  {
    clutter_rect_union($a, $b, $res);
    $res;
  }

  method zero is static {
    $zero
  }

}
