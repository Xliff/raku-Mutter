use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Meta::Raw::Definitions;

unit package Mutter::Meta::Raw::Rectangle;

### /usr/include/mutter-10/meta/boxes.h

sub meta_rectangle_area (MetaRectangle $rect)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_rectangle_contains_rect (
  MetaRectangle $outer_rect,
  MetaRectangle $inner_rect
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rectangle_copy (MetaRectangle $rect)
  returns MetaRectangle
  is native(mutter)
  is export
{ * }

sub meta_rectangle_could_fit_rect (
  MetaRectangle $outer_rect,
  MetaRectangle $inner_rect
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rectangle_equal (MetaRectangle $src1, MetaRectangle $src2)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rectangle_free (MetaRectangle $rect)
  is native(mutter)
  is export
{ * }

sub meta_rectangle_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_rectangle_horiz_overlap (MetaRectangle $rect1, MetaRectangle $rect2)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rectangle_intersect (
  MetaRectangle $src1,
  MetaRectangle $src2,
  MetaRectangle $dest
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rectangle_overlap (MetaRectangle $rect1, MetaRectangle $rect2)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rectangle_union (
  MetaRectangle $rect1,
  MetaRectangle $rect2,
  MetaRectangle $dest
)
  is native(mutter)
  is export
{ * }

sub meta_rectangle_vert_overlap (MetaRectangle $rect1, MetaRectangle $rect2)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_rect (gint $x, gint $y, gint $width, gint $height)
  returns MetaRectangle
  is native(mutter)
  is export
{ * }
