use v6.c;

use NativeCall;

use Mutter::Raw::Types;

class Meta::Border {
  also does GLib::Roles::Implementor;

  has MutterMetaBorder $!mmb is implementor;

  method get_allows_directions {
    so meta_border_get_allows_directions($!mmb);
  }

  method is_blocking_directions (Int() $directions) {
    my MetaBorderMotionDirection $d = $directions
    meta_border_is_blocking_directions($!mmb, $directions); }

  method is_horizontal {
    meta_border_is_horizontal($!mmb);
  }

  method set_allows_directions (Int() $directions) {
    my gint $d = $directions.so.Int;

    meta_border_set_allows_directions($!mmb, $d);
  }

}

### /usr/src/mutter/src/core/meta-border.h

sub meta_border_get_allows_directions (MetaBorder $border)
  returns gint
  is      native(mutter-clutter)
  is      export
{ * }

sub meta_border_is_blocking_directions (
  MetaBorder                $border,
  MetaBorderMotionDirection $directions
)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub meta_border_is_horizontal (MetaBorder $border)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub meta_border_set_allows_directions (
  MetaBorder $border,
  gint       $directions
)
  is      native(mutter-clutter)
  is      export
{ * }
