use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::FlowLayout;

use GLib::Value;
use Mutter::Clutter::LayoutManager;

use GLib::Roles::Implementor;

our subset MutterClutterFlowLayoutAncestry is export of Mu
  where MutterClutterFlowLayout | MutterClutterLayoutManagerAncestry;

class Mutter::Clutter::FlowLayout is Mutter::Clutter::LayoutManager {
  has MutterClutterFlowLayout $!mcfl is implementor;

  submethod BUILD ( :$mutter-clutter-flow-layout ) {
    self.setMutterClutterFlowLayout($mutter-clutter-flow-layout)
      if $mutter-clutter-flow-layout;
  }

  method setMutterClutterFlowLayout (MutterClutterFlowLayoutAncestry $_) {
    my $to-parent;

    $!mcfl = do {
      when MutterClutterFlowLayout {
        $to-parent = cast(MutterClutterLayoutManager, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterFlowLayout, $_);
      }
    }
    self.setMutterClutterLayoutManager($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterFlowLayout
    is also<MutterClutterFlowLayout>
  { $!mcfl }

  multi method new (
    MutterClutterFlowLayoutAncestry  $mutter-clutter-flow-layout,
                                    :$ref                          = True
  ) {
    return unless $mutter-clutter-flow-layout;

    my $o = self.bless( :$mutter-clutter-flow-layout );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $orientation) {
    my MutterClutterOrientation $o = $orientation;

    my $mutter-clutter-flow-layout = clutter_flow_layout_new($o);

    $mutter-clutter-flow-layout ?? self.bless( :$mutter-clutter-flow-layout )
                                !! Nil
  }

  # Type: MutterClutterFlowOrientation
  method orientation is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterFlowOrientation)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('orientation', $gv);
        MutterClutterFlowOrientationEnum(
          $gv.valueFromEnum(MutterClutterFlowOrientation)
        );
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterFlowOrientation) = $val;
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

  # Type: float
  method column-spacing is rw  is g-property is also<column_spacing> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('column-spacing', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('column-spacing', $gv);
      }
    );
  }

  # Type: float
  method row-spacing is rw  is g-property is also<row_spacing> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('row-spacing', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('row-spacing', $gv);
      }
    );
  }

  # Type: float
  method min-column-width is rw  is g-property is also<min_column_width> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-column-width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('min-column-width', $gv);
      }
    );
  }

  # Type: float
  method max-column-width is rw  is g-property is also<max_column_width> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('max-column-width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('max-column-width', $gv);
      }
    );
  }

  # Type: float
  method min-row-height is rw  is g-property is also<min_row_height> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-row-height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('min-row-height', $gv);
      }
    );
  }

  # Type: float
  method max-row-height is rw  is g-property is also<max_row_height> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('max-row-height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('max-row-height', $gv);
      }
    );
  }

  # Type: boolean
  method snap-to-grid is rw  is g-property is also<snap_to_grid> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('snap-to-grid', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('snap-to-grid', $gv);
      }
    );
  }

  method get_column_spacing is also<get-column-spacing> {
    clutter_flow_layout_get_column_spacing($!mcfl);
  }

  proto method get_column_width (|)
    is also<get-column-width>
  { * }

  multi method get_column_width {
    samewith($, $);
  }
  multi method get_column_width ($min_width is rw, $max_width is rw) {
    my gfloat ($mnw, $mxw) = 0e0 xx 2;

    clutter_flow_layout_get_column_width($!mcfl, $mnw, $mxw);
    ($min_width, $max_width) = ($mnw, $mxw);
  }

  method get_homogeneous is also<get-homogeneous> {
    so clutter_flow_layout_get_homogeneous($!mcfl);
  }

  method get_orientation is also<get-orientation> {
    MutterClutterOrientationEnum(
      clutter_flow_layout_get_orientation($!mcfl)
    );
  }

  proto method get_row_height (|)
    is also<get-row-height>
  { * }

  multi method get_row_height {
    samewith($, $);
  }
  multi method get_row_height ($min_height is rw, $max_height is rw) {
    my gfloat ($mnh, $mxh) = 0e0 xx 2;

    clutter_flow_layout_get_row_height($!mcfl, $mnh, $mxh);
    ($min_height, $max_height) = ($mnh, $mxh);
  }

  method get_row_spacing is also<get-row-spacing> {
    clutter_flow_layout_get_row_spacing($!mcfl);
  }

  method get_snap_to_grid is also<get-snap-to-grid> {
    so clutter_flow_layout_get_snap_to_grid($!mcfl);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_flow_layout_get_type, $n, $t );
  }

  method set_column_spacing (Num() $spacing) is also<set-column-spacing> {
    my gfloat $s = $spacing;

    clutter_flow_layout_set_column_spacing($!mcfl, $spacing);
  }

  method set_column_width (Num() $min_width, Num() $max_width)
    is also<set-column-width>
  {
    my gfloat ($mnw, $mxw) = ($min_width, $max_width);

    clutter_flow_layout_set_column_width($!mcfl, $mnw, $mxw)
  }

  method set_homogeneous (Int() $homogeneous) is also<set-homogeneous> {
    my gboolean $h = $homogeneous.so.Int;

    clutter_flow_layout_set_homogeneous($!mcfl, $h);
  }

  method set_orientation (Int() $orientation) is also<set-orientation> {
    my MutterClutterFlowOrientation $o = $orientation;

    clutter_flow_layout_set_orientation($!mcfl, $orientation);
  }

  method set_row_height (Num() $min_height, Num() $max_height)
    is also<set-row-height>
  {
    my gfloat ($mnh, $mxh) = ($min_height, $max_height);

    clutter_flow_layout_set_row_height($!mcfl, $mnh, $mxh);
  }

  method set_row_spacing (Num() $spacing) is also<set-row-spacing> {
    my gfloat $s = $spacing;

    clutter_flow_layout_set_row_spacing($!mcfl, $spacing);
  }

  method set_snap_to_grid (Int() $snap_to_grid) is also<set-snap-to-grid> {
    my gboolean $s = $snap_to_grid.so.Int;

    clutter_flow_layout_set_snap_to_grid($!mcfl, $snap_to_grid);
  }
}
