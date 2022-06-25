use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Rectangle;

class Mutter::Meta::Rectangle {
  has MetaRectangle $!mr is implementor;

  submethod BUILD ( :$meta-rectangle ) {
    $!mr = $meta-rectangle;
  }

  method meta_rect (Int() $x, Int() $y, Int() $width, Int() $height)
    is static
    is also<
      meta-rect
      new
    >
  {
    my gint ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    my $meta-rectangle = meta_rect($xx, $yy, $w, $h);

    $meta-rectangle ?? self.bless( :$meta-rectangle ) !! Nil;
  }

  method area {
    meta_rectangle_area($!mr);
  }

  method contains_rect (MetaRectangle() $inner_rect) is also<contains-rect> {
    so meta_rectangle_contains_rect($!mr, $inner_rect);
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      meta_rectangle_copy($!mr),
      $raw,
      |self.getTypePair
    );
  }

  method could_fit_rect (MetaRectangle() $inner_rect) is also<could-fit-rect> {
    so meta_rectangle_could_fit_rect($!mr, $inner_rect);
  }

  method equal (MetaRectangle() $src2) {
    so meta_rectangle_equal($!mr, $src2);
  }

  method !free {
    meta_rectangle_free($!mr);
  }

  method get_type is also<get-type> {
    unstable_get_type(self.^name, &meta_rectangle_get_type, $n, $t);
  }

  method horiz_overlap (MetaRectangle() $rect2) is also<horiz-overlap> {
    so meta_rectangle_horiz_overlap($!mr, $rect2);
  }

  multi method intersect (MetaRectangle() $src2, :$raw = False) {
    my $s = MetaRectangle.new;

    samewith($src2, $s, :$raw);
  }
  multi method intersect (
    MetaRectangle()  $src2,
    MetaRectangle()  $dest,
                    :$raw = False
  ) {
    propReturnObject(
      meta_rectangle_intersect($!mr, $src2, $dest);
      $raw,
      |self.getTypePair
    );
  }

  method overlap (MetaRectangle() $rect2) {
    so meta_rectangle_overlap($!mr, $rect2);
  }

  multi method union (MetaRectangle() $rect2, :$raw = False) {
    my $r = MetaRectangle.new;

    samewith($rect2, $r, :$raw);
  }
  multi method union (
    MetaRectangle()  $rect2,
    MetaRectangle()  $dest,
                    :$raw    = False
  ) {
    propReturnObject(
      meta_rectangle_union($!mr, $rect2, $dest),
      $raw,
      |self.getTypePair
    );
  }

  method vert_overlap (MetaRectangle $rect2) is also<vert-overlap> {
    so meta_rectangle_vert_overlap($!mr, $rect2);
  }

}
