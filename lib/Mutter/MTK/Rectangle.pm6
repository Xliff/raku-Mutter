use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::MTK::Rectangle;

use Graphene::Rect;

# BOXED

use GLib::Roles::Implementor;

class Mutter::MTK::Rectangle {
  also does GLib::Roles::Implementor;

  has MtkRectangle $!mtk-r is implementor;

  submethod BUILD ( :$mtk-rectangle ) {
    $!mtk-r = $mtk-rectangle if $mtk-rectangle;
  }

  method Mutter::Raw::Structs::MtkRectangle
    is also<MtkRectangle>
  { $!mtk-r }

  method new (
    Int() $x,
    Int() $y,
    Int() $width,
    Int() $height
  ) {
    my $mtk-rectangle = mtk_rectangle_new($x, $y, $width, $height);

    $mtk-rectangle ?? self.bless( :$mtk-rectangle ) !! Nil;
  }

  method area {
    mtk_rectangle_area($!mtk-r);
  }

  method contains_rect (MtkRectangle() $inner_rect)
    is also<contains-rect>
  {
    so mtk_rectangle_contains_rect($!mtk-r, $inner_rect);
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      mtk_rectangle_copy($!mtk-r),
      $raw,
      |self.getTypePair
    );
  }

  method could_fit_rect (MtkRectangle() $inner_rect)
    is also<could-fit-rect>
  {
    so mtk_rectangle_could_fit_rect($!mtk-r, $inner_rect);
  }

  method equal (MtkRectangle() $src2) {
    so mtk_rectangle_equal($!mtk-r, $src2);
  }

  method free {
    mtk_rectangle_free($!mtk-r);
  }

  method from_graphene_rect (
    graphene_rect_t()  $src,
    Int()              $rounding_strategy,
    MtkRectangle()     $dest,
                      :$raw                = False
  )
    is static
    is also<from-graphene-rect>
  {
    my MutterMtkRoundingStrategy $r = $rounding_strategy;

    mtk_rectangle_from_graphene_rect($src, $r, $dest);
    propReturnObject($dest, $raw, |self.getTypePair)
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &mtk_rectangle_get_type, $n, $t );
  }

  method horiz_overlap (MtkRectangle() $rect2) is also<horiz-overlap> {
    mtk_rectangle_horiz_overlap($!mtk-r, $rect2);
  }

  multi method intersect (MtkRectangle() $src2, :$raw) {
    samewith($src2, MtkRectangle.new, :$raw);
  }
  multi method intersect (
    MtkRectangle()  $src2,
    MtkRectangle()  $dest,
                   :$raw    = False
  ) {
    mtk_rectangle_intersect($!mtk-r, $src2, $dest);
    propReturnObject($dest, $raw, |self.getTypePair)
  }

  method overlap (MtkRectangle() $rect2) {
    mtk_rectangle_overlap($!mtk-r, $rect2);
  }

  method to_graphene_rect ( :$raw = False ) is also<to-graphene-rect> {
    propReturnObject(
      mtk_rectangle_to_graphene_rect($!mtk-r),
      $raw,
      |Graphene::Rect.getTypePair
    );
  }

  multi method union (MtkRectangle() $src2, :$raw) {
    samewith($src2, MtkRectangle.new, :$raw);
  }
  multi method union (
    MtkRectangle()  $src2,
    MtkRectangle()  $dest,
                   :$raw    = False
  ) {
    mtk_rectangle_union($!mtk-r, $src2, $dest);
    propReturnObject($dest, $raw, |self.getTypePair);
  }

  method vert_overlap (MtkRectangle() $rect2) is also<vert-overlap> {
    mtk_rectangle_vert_overlap($!mtk-r, $rect2);
  }

}
