use v6.c;

use Mutter::Meta::Raw::Types;
use Mutter::Meta::Raw::Window::Shape;

class Mutter::Window::Shape {
  has MetaWindowShape $!mws is implementor;

  method new {
    my $meta-window-shape = meta_window_shape_new();

    $meta-window-shape ?? self.bless( :$meta-window-shape ) !! Nil;
  }

  method equal (MetaWindowShape() $shape_b) {
    meta_window_shape_equal($!mws, $shape_b);
  }

  proto method get_borders (|)
  { * }

  multi method get_borders {
    samewith($, $, $, $);
  }
  multi method get_borders (
    $b_top    is rw,
    $b_right  is rw,
    $b_bottom is rw,
    $b_left   is rw
  ) {
    my gint ($t, $b, $l, $r) = 0 xx 4;

    meta_window_shape_get_borders($!mws, $t, $r, $b, $l);

    ($b_top, $b_right, $b_bottom, $b_left) = ($t, $r, $b, $l);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_window_shape_get_type, $n, $t );
  }

  method hash {
    meta_window_shape_hash($!mws);
  }

  method ref {
    meta_window_shape_ref($!mws);
    self;
  }

  method to_region (Int() $center_width, Int() $center_height) {
    my ($w, $h) = ($center_width, $center_height);

    meta_window_shape_to_region($!mws, $w, $h);
  }

  method unref {
    meta_window_shape_unref($!mws);
  }

}
