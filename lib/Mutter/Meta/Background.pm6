use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterMetaBackgroundAncestry is export of Mu
  where MutterMetaBackground | GObject;

class Mutter::Meta::Background {
  also does GLib::Roles::Object;

  has MutterMetaBackground $!mmb is implementor;

  submethod BUILD ( :$meta-background ) {
    self.setMutterMetaBackground($meta-background) if $meta-background;
  }

  method setMutterMetaBackground (MutterMetaBackgroundAncestry $_) {
    my $to-parent;

    $!mmb = do {
      when MutterMetaBackground {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaBackground, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaBackground
    is also<MutterMetaBackend>
  { $!mmb }

  multi method new (
    MutterMetaBackgroundAncestry  $meta-background,
                                 :$ref              = True
  ) {
    return unless $meta-background;

    my $o = self.bless( :$meta-background );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterMetaDisplay() $display) {
    my $meta-background = meta_background_new($display);

    $meta-background ?? self.bless( :$meta-background ) !! Nil;
  }

  method refresh_all is static is also<refresh-all> {
    meta_background_refresh_all();
  }

  method set_blend (
    GFile() $file1,
    GFile() $file2,
    Num()   $blend_factor,
    Int()   $style
  )
    is also<set-blend>
  {
    my gdouble                 $b = $blend_factor;
    my GDesktopBackgroundStyle $s = $style;

    meta_background_set_blend($!mmb, $file1, $file2, $b, $s);
  }

  method set_color (MutterClutterColor() $color) is also<set-color> {
    meta_background_set_color($!mmb, $color);
  }

  method set_file (GFile() $file, Int() $style) is also<set-file> {
    my GDesktopBackgroundStyle $s = $style;

    meta_background_set_file($!mmb, $file, $s);
  }

  method set_gradient (
    Int()                $shading_direction,
    MutterClutterColor() $color,
    MutterClutterColor() $second_color
  )
    is also<set-gradient>
  {
    my GDesktopBackgroundShading $s = $shading_direction;

    meta_background_set_gradient($!mmb, $s, $color, $second_color);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-background.h

sub meta_background_new (MutterMetaDisplay $display)
  returns MutterMetaBackground
  is native(mutter)
  is export
{ * }

sub meta_background_refresh_all ()
  is native(mutter)
  is export
{ * }

sub meta_background_set_blend (
  MutterMetaBackground    $self,
  GFile                   $file1,
  GFile                   $file2,
  gdouble                 $blend_factor,
  GDesktopBackgroundStyle $style
)
  is native(mutter)
  is export
{ * }

sub meta_background_set_color (
  MutterMetaBackground $self,
  MutterClutterColor   $color
)
  is native(mutter)
  is export
{ * }

sub meta_background_set_file (
  MutterMetaBackground    $self,
  GFile                   $file,
  GDesktopBackgroundStyle $style
)
  is native(mutter)
  is export
{ * }

sub meta_background_set_gradient (
  MutterMetaBackground      $self,
  GDesktopBackgroundShading $shading_direction,
  MutterClutterColor        $color,
  MutterClutterColor        $second_color
)
  is native(mutter)
  is export
{ * }
