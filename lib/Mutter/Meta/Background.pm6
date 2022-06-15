use v6.c;

use NativeCall;

use Mutter::Raw::Types;

class Mutter::Meta::Background {

  method new {
    my $meta-background = meta_background_new();

    $meta-background ?? self.bless( :$meta-background ) !! Nil;
  }

  method refresh_all {
    meta_background_refresh_all($!mb);
  }

  method set_blend (
    GFile() $file1,
    GFile() $file2,
    Num()   s$blend_factor,
    Int()   s$style
  ) {
    my gdouble                 $b = $blend_factor;
    my GDesktopBackgroundStyle $s = $style;

    meta_background_set_blend($!mb, $file1, $file2, $b, $s);
  }

  method set_color (ClutterColor() $color) {
    meta_background_set_color($!mb, $color);
  }

  method set_file (GFile() $file, Int() $style) {
    my GDesktopBackgroundStyle $s = $style;

    meta_background_set_file($!mb, $file, $s);
  }

  method set_gradient (
    Int()          $shading_direction,
    ClutterColor() $color,
    ClutterColor() $second_color
  ) {
    my GDesktopBackgroundShading $s = $shading_direction;

    meta_background_set_gradient($!mb, $s, $color, $second_color);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-background.h

sub meta_background_new (MetaDisplay $display)
  returns MetaBackground
  is native(mutter)
  is export
{ * }

sub meta_background_refresh_all ()
  is native(mutter)
  is export
{ * }

sub meta_background_set_blend (
  MetaBackground          $self,
  GFile                   $file1,
  GFile                   $file2,
  gdouble                 $blend_factor,
  GDesktopBackgroundStyle $style
)
  is native(mutter)
  is export
{ * }

sub meta_background_set_color (MetaBackground $self, ClutterColor $color)
  is native(mutter)
  is export
{ * }

sub meta_background_set_file (
  MetaBackground          $self,
  GFile                   $file,
  GDesktopBackgroundStyle $style
)
  is native(mutter)
  is export
{ * }

sub meta_background_set_gradient (
  MetaBackground            $self,
  GDesktopBackgroundShading $shading_direction,
  ClutterColor              $color,
  ClutterColor              $second_color
)
  is native(mutter)
  is export
{ * }
