use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Value;
use Mutter::Clutter::LayoutManager;

use GLib::Roles::Implementor;

our subset MutterClutterBinLayoutAncestry is export of Mu
  where MutterClutterBinLayout | MutterClutterLayoutManagerAncestry;

class Mutter::Clutter::BinLayout is Mutter::Clutter::LayoutManager {
  has MutterClutterBinLayout $!mcbl is implementor;

  submethod BUILD ( :$mutter-clutter-bin-layout ) {
    self.setMutterClutterBinLayout($mutter-clutter-bin-layout)
      if $mutter-clutter-bin-layout;
  }

  method setMutterClutterBinLayout(MutterClutterBinLayoutAncestry $_) {
    my $to-parent;

    $!mcbl = do {
      when MutterClutterBinLayout {
        $to-parent = cast(MutterClutterLayoutManager, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBinLayout, $_);
      }
    }
    self.setMutterClutterLayoutManager($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterBinLayout
    is also<MutterClutterBinLayout>
  { $!mcbl }

  multi method new (
    MutterClutterBinLayoutAncestry  $mutter-clutter-bin-layout,
                                   :$ref                        = True
  ) {
    return unless $mutter-clutter-bin-layout;

    my $o = self.bless( :$mutter-clutter-bin-layout );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $x_align, Int() $y_align) {
    my MutterClutterBinLayout ($x, $y) = ($x_align, $y_align);

    my $mutter-clutter-bin-layout = clutter_bin_layout_new($x, $y);

    $mutter-clutter-bin-layout ?? self.bless( :$mutter-clutter-bin-layout )
                               !! Nil
  }

  # Type: MutterBinAlignment
  method x-align is rw  is g-property is also<x_align> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterBinAlignment)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x-align', $gv);
        MutterClutterBinAlignmentEnum(
          $gv.valueFromEnum(MutterClutterBinAlignment)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterBinAlignment) = $val;
        self.prop_set('x-align', $gv);
      }
    );
  }

  # Type: MutterBinAlignment
  method y-align is rw  is g-property is also<y_align> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterBinAlignment)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y-align', $gv);
        MutterClutterBinAlignmentEnum(
          $gv.valueFromEnum(MutterClutterBinAlignment)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterBinAlignment) = $val;
        self.prop_set('y-align', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_bin_layout_get_type, $n, $t );
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-bin-layout.h

sub clutter_bin_layout_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bin_layout_new (
  MutterClutterBinAlignment $x_align,
  MutterClutterBinAlignment $y_align
)
  returns MutterClutterLayoutManager
  is native(mutter-clutter)
  is export
{ * }
