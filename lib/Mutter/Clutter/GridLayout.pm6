use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::GridLayout;

use Mutter::Clutter::LayoutManager;

use GLib::Roles::Implementor;

our subset MutterClutterGridLayoutAncestry is export of Mu
  where MutterClutterGridLayout | MutterClutterLayoutManagerAncestry;

class Mutter::Clutter::GridLayout is Mutter::Clutter::LayoutManager {
  has MutterClutterGridLayout $!mcgl is implementor;

  submethod BUILD ( :$mutter-clutter-grid-layout ) {
    self.setMutterClutterGridLayout($mutter-clutter-grid-layout)
      if $mutter-clutter-grid-layout;
  }

  method setMutterClutterGridLayout(MutterClutterGridLayoutAncestry $_) {
    my $to-parent;

    $!mcgl = do {
      when MutterClutterGridLayout {
        $to-parent = cast(MutterClutterLayoutManager, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterGridLayout, $_);
      }
    }
    self.setMutterClutterLayoutManager($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterGridLayout
    is also<MutterClutterGridLayout>
  { $!mcgl }

  multi method new (
    MutterClutterGridLayoutAncestry  $mutter-clutter-grid-layout,
                                    :$ref                         = True
  ) {
    return unless $mutter-clutter-grid-layout;

    my $o = self.bless( :$mutter-clutter-grid-layout );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-grid-layout = clutter_grid_layout_new();

    $mutter-clutter-grid-layout ?? self.bless( :$mutter-clutter-grid-layout )
                                !! Nil;
  }

  # Type: MutterOrientation
  method orientation is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterOrientation)
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

  # Type: uint
  method row-spacing is rw  is g-property is also<row_spacing> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('row-spacing', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('row-spacing', $gv);
      }
    );
  }

  # Type: uint
  method column-spacing is rw  is g-property is also<column_spacing> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('column-spacing', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('column-spacing', $gv);
      }
    );
  }

  # Type: boolean
  method row-homogeneous is rw  is g-property is also<row_homogeneous> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('row-homogeneous', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('row-homogeneous', $gv);
      }
    );
  }

  # Type: boolean
  method column-homogeneous is rw  is g-property is also<column_homogeneous> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('column-homogeneous', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('column-homogeneous', $gv);
      }
    );
  }

  method attach (
    MutterClutterActor() $child,
    Int()                $left,
    Int()                $top,
    Int()                $width,
    Int()                $height
  ) {
    my gint ($l, $t, $w, $h) = ($left, $top, $width, $height);

    clutter_grid_layout_attach($!mcgl, $child, $l, $t, $w, $h);
  }

  method attach_next_to (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling,
    Int()                $side,
    Int()                $width,
    Int() $height
  )
    is also<attach-next-to>
  {
    my MutterClutterGridPosition  $s      = $side;
    my gint                      ($w, $h) = ($width, $height);

    clutter_grid_layout_attach_next_to(
      $!mcgl,
      $child,
      $sibling,
      $side,
      $w,
      $h
    );
  }

  method get_child_at (Int() $left, Int() $top, :$raw = False)
    is also<get-child-at>
  {
    my gint ($l, $t) = ($left, $top);

    propReturnObject(
      clutter_grid_layout_get_child_at($!mcgl, $left, $top),
      $raw,
      |Clutter::Actor.getTypePair
    );
  }

  method get_column_homogeneous is also<get-column-homogeneous> {
    so clutter_grid_layout_get_column_homogeneous($!mcgl);
  }

  method get_column_spacing is also<get-column-spacing> {
    clutter_grid_layout_get_column_spacing($!mcgl);
  }

  method get_orientation is also<get-orientation> {
    MutterClutterOrientationEnum(
      clutter_grid_layout_get_orientation($!mcgl)
    );
  }

  method get_row_homogeneous is also<get-row-homogeneous> {
    so clutter_grid_layout_get_row_homogeneous($!mcgl);
  }

  method get_row_spacing is also<get-row-spacing> {
    clutter_grid_layout_get_row_spacing($!mcgl);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_grid_layout_get_type, $n, $t );
  }

  method insert_column (Int() $position) is also<insert-column> {
    my gint $p = $position;

    clutter_grid_layout_insert_column($!mcgl, $p);
  }

  method insert_next_to (
    MutterClutterActor() $sibling,
    Int()                $side
  )
    is also<insert-next-to>
  {
    my MutterClutterGridPosition $s = $side;

    clutter_grid_layout_insert_next_to($!mcgl, $sibling, $s);
  }

  method insert_row (Int() $position) is also<insert-row> {
    my gint $p = $position;

    clutter_grid_layout_insert_row($!mcgl, $p);
  }

  method set_column_homogeneous (Int() $homogeneous)
    is also<set-column-homogeneous>
  {
    my gboolean $h = $homogeneous.so.Int;

    clutter_grid_layout_set_column_homogeneous($!mcgl, $h);
  }

  method set_column_spacing (Int() $spacing) is also<set-column-spacing> {
    my guint $s = $spacing;

    clutter_grid_layout_set_column_spacing($!mcgl, $s);
  }

  method set_orientation (Int() $orientation) is also<set-orientation> {
    my MutterClutterOrientation$o = $orientation;

    clutter_grid_layout_set_orientation($!mcgl, $o);
  }

  method set_row_homogeneous (Int() $homogeneous)
    is also<set-row-homogeneous>
  {
    my gboolean $h = $homogeneous.so.Int;

    clutter_grid_layout_set_row_homogeneous($!mcgl, $h);
  }

  method set_row_spacing (Int() $spacing) is also<set-row-spacing> {
    my guint $s = $spacing;

    clutter_grid_layout_set_row_spacing($!mcgl, $s);
  }

}
