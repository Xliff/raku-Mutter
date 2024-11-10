use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

### /usr/src/mutter/src/../mtk/mtk/mtk-rectangle.h

sub mtk_rectangle_area (MtkRectangle $rect)
  returns gint
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_contains_rect (
  MtkRectangle $outer_rect,
  MtkRectangle $inner_rect
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_copy (MtkRectangle $rect)
  returns MtkRectangle
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_could_fit_rect (
  MtkRectangle $outer_rect,
  MtkRectangle $inner_rect
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_equal (
  MtkRectangle $src1,
  MtkRectangle $src2
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_free (MtkRectangle $rect)
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_from_graphene_rect (
  graphene_rect_t           $rect,
  MutterMtkRoundingStrategy $rounding_strategy,
  MtkRectangle              $dest
)
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_get_type
  returns GType
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_horiz_overlap (
  MtkRectangle $rect1,
  MtkRectangle $rect2
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_intersect (
  MtkRectangle $src1,
  MtkRectangle $src2,
  MtkRectangle $dest
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_new (
  gint $x,
  gint $y,
  gint $width,
  gint $height
)
  returns MtkRectangle
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_overlap (
  MtkRectangle $rect1,
  MtkRectangle $rect2
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_to_graphene_rect (MtkRectangle $rect)
  returns graphene_rect_t
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_union (
  MtkRectangle $rect1,
  MtkRectangle $rect2,
  MtkRectangle $dest
)
  is      native(mutter-mtk)
  is      export
{ * }

sub mtk_rectangle_vert_overlap (
  MtkRectangle $rect1,
  MtkRectangle $rect2
)
  returns uint32
  is      native(mutter-mtk)
  is      export
{ * }
