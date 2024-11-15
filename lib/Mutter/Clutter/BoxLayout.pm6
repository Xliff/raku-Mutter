use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::BoxLayout;

use Mutter::Clutter::LayoutManager;

use GLib::Roles::Implementor;

our subset MutterClutterBoxLayoutAncestry is export of Mu
  where MutterClutterBoxLayout | MutterClutterLayoutManagerAncestry;

class Mutter::Clutter::BoxLayout is Mutter::Clutter::LayoutManager {
  has MutterClutterBoxLayout $!mcbl is implementor;

  submethod BUILD ( :$mutter-clutter-box-layout ) {
    self.setMutterClutterBoxLayout($mutter-clutter-box-layout)
      if $mutter-clutter-box-layout;
  }

  method setMutterClutterBoxLayout(MutterClutterBoxLayoutAncestry $_) {
    my $to-parent;

    $!mcbl = do {
      when MutterClutterBoxLayout {
        $to-parent = cast(MutterClutterLayoutManager, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBoxLayout, $_);
      }
    }
    self.setMutterClutterLayoutManager($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterBoxLayout
    is also<MutterClutterBoxLayout>
  { $!mcbl }

  multi method new (
    MutterClutterBoxLayoutAncestry  $mutter-clutter-box-layout,
                                    :$ref                       = True
  ) {
    return unless $mutter-clutter-box-layout;

    my $o = self.bless( :$mutter-clutter-box-layout );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-box-layout = clutter_box_layout_new();

    $mutter-clutter-box-layout ?? self.bless( :$mutter-clutter-box-layout )
                               !! Nil;
  }

  # Type: MutterOrientation
  method orientation is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.valueFromEnum(MutterClutterOrientation)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('orientation', $gv);
        MutterClutterOrientationEnum(
          $gv.valueFromEnum(MutterClutterOrientation)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterOrientation) = $val;
        self.prop_set('orientation', $gv);
      }
    );
  }

  # Type: boolean
  method homogeneous is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('homogeneous', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('homogeneous', $gv);
      }
    );
  }

  # Type: boolean
  method pack-start is rw  is g-property is also<pack_start> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pack-start', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('pack-start', $gv);
      }
    );
  }

  # Type: uint
  method spacing is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('spacing', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('spacing', $gv);
      }
    );
  }

  # cw: QoL improvement
  method add (
    :$expand,
    :x_fill( :$x-fill),
    :y_fill( :$y-fill),
    :x_align(:$x-align),
    :y_align(:$y-align)
  ) {
    die 'NYI!'
  }

  method get_homogeneous is also<get-homogeneous> {
    so clutter_box_layout_get_homogeneous($!mcbl);
  }

  method get_orientation is also<get-orientation> {
    MutterClutterOrientationEnum(
      clutter_box_layout_get_orientation($!mcbl)
    );
  }

  method get_spacing is also<get-spacing> {
    clutter_box_layout_get_spacing($!mcbl);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_box_layout_get_type, $n, $t );
  }

  method set_homogeneous (Int() $homogeneous) is also<set-homogeneous> {
    my gboolean $h = $homogeneous.so.Int;

    clutter_box_layout_set_homogeneous($!mcbl, $h);
  }

  method set_orientation (Int() $orientation) is also<set-orientation> {
    my MutterClutterOrientation $o = $orientation;

    clutter_box_layout_set_orientation($!mcbl, $orientation);
  }

  method set_spacing (Int() $spacing) is also<set-spacing> {
    my guint $s = $spacing;

    clutter_box_layout_set_spacing($!mcbl, $spacing);
  }

}
