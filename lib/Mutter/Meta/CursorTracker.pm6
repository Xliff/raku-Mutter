use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Raw::Object;

class Mutter::Meta::CursorTracker {
  also does GLib::Roles::Object;

  has MetaCursorTracker $!mct is implementor;

  method new (
    my $meta-cursor-tracker = self.get_for_display( :raw );

    $meta-cursor-tracker ?? self.bless( :$meta-cursor-tracker ) !! Nil;
  }

  method get_for_display ( :$raw = False ) {
    propReturnObject(
      meta_cursor_tracker_get_for_display($!mct),
      $raw,
      |self.getTypePair
    );s
  }

  method get_hot ($x is rw, $y is rw) {
    my gint ($xx, $yy) = 0 xx 2;

    meta_cursor_tracker_get_hot($!mct, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_pointer (graphene_point_t $coords, Int() $mods) {
    my ClutterModifierType $m = $mods
    meta_cursor_tracker_get_pointer($!mct, $coords, $m);
  }

  method get_pointer_visible {
    so meta_cursor_tracker_get_pointer_visible($!mct);
  }

  method get_scale {
    meta_cursor_tracker_get_scale($!mct);
  }

  method get_sprite ( :$raw = False ) {
    propReturnObject(
      meta_cursor_tracker_get_sprite($!mct),
      $raw,
      |Mutter::COGL::Texture.getTypePair
    );
  }

  method set_pointer_visible (Int() $visible) {
    my gboolean $v = $visible.so.Int;

    meta_cursor_tracker_set_pointer_visible($!mct, $v);
  }

}
