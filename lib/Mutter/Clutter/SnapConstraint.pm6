use v6.c;

use Method::Also;

use GLib::Raw::Traits;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::SnapConstraint;

use Mutter::Clutter::Constraint;

use GLib::Roles::Implementor;

our subset MutterClutterSnapConstraintAncestry is export of Mu
  where MutterClutterSnapConstraint | MutterClutterConstraintAncestry;

class Mutter::Clutter::SnapConstraint is Mutter::Clutter::Constraint {
  has MutterClutterSnapConstraint $!mcsc is implementor;

  submethod BUILD ( :$mutter-clutter-snap-constraint ) {
    self.setMutterClutterSnapConstraint($mutter-clutter-snap-constraint)
      if $mutter-clutter-snap-constraint;
  }

  method Mutter::Raw::Definitions::MutterClutterSnapConstraint
    is also<MutterClutterSnapConstraint>
  { $!mcsc }

  method setMutterClutterSnapConstraint (
    MutterClutterSnapConstraintAncestry $_
  ) {
    my $to-parent;
    $!mcsc = do {
      when MutterClutterSnapConstraint {
        $to-parent = cast(MutterClutterConstraint, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterSnapConstraint, $_);
      }
    }
    self.setMutterClutterConstraint($to-parent);
  }

  # cw: Yes, the type names have become obnoxious...
  constant CTA := MutterClutterSnapConstraintAncestry;

  multi method new (CTA $mutter-clutter-snap-constraint, :$ref = True) {
    return unless $mutter-clutter-snap-constraint;

    my $o = self.bless( :$mutter-clutter-snap-constraint );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterClutterActor() $actor,
    Int()                $from_edge,
    Int()                $to_edge,
    Num()                $offset
  ) {
    my MutterClutterSnapEdge ($f, $t) = ($from_edge, $to_edge);
    my gfloat                 $o      = $offset;

    my $mutter-clutter-snap-constraint =
      clutter_snap_constraint_new($actor, $f, $t, $o);

    $mutter-clutter-snap-constraint
      ?? self.bless( :$mutter-clutter-snap-constraint )
      !! Nil;
  }

  # Type: MutterClutterActor
  method source ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Actor.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Actor.getTypePair
        )
      },
      STORE => -> $, MutterClutterActor() $val is copy {
        $gv.object = $val;
        self.prop_set('source', $gv);
      }
    );
  }

  # Type: MutterClutterSnapEdge
  method from-edge is rw  is g-property is also<from_edge> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterSnapEdge)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('from-edge', $gv);
        MutterClutterSnapEdgeEnum(
          $gv.valueFromEnum(MutterClutterSnapEdge)
        )
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterSnapEdge) = $val;
        self.prop_set('from-edge', $gv);
      }
    );
  }

  # Type: MutterClutterSnapEdge
  method to-edge is rw  is g-property is also<to_edge> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterSnapEdge)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('to-edge', $gv);
        MutterClutterSnapEdgeEnum(
          $gv.valueFromEnum(MutterClutterSnapEdge)
        )
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterSnapEdge) = $val;
        self.prop_set('to-edge', $gv);
      }
    );
  }

  # Type: float
  method offset is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('offset', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('offset', $gv);
      }
    );
  }

  proto method get_edges (|)
    is also<get-edges>
  { * }

  multi method get_edges {
    samewith($, $);
  }
  multi method get_edges ($from_edge is rw, $to_edge is rw) {
    my MutterClutterSnapEdge ($f, $t) = 0 xx 2;

    clutter_snap_constraint_get_edges($!mcsc, $f, $t);
    ($from_edge, $to_edge) = ($f, $t);
  }

  method get_offset is also<get-offset> {
    clutter_snap_constraint_get_offset($!mcsc);
  }

  method get_source ( :$raw = False ) is also<get-source> {
    propReturnObject(
      clutter_snap_constraint_get_source($!mcsc),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_snap_constraint_get_type, $n, $t );
  }

  method set_edges (
    MutterClutterSnapEdge() $from_edge,
    MutterClutterSnapEdge() $to_edge
  )
    is also<set-edges>
  {
    my MutterClutterSnapEdge ($f, $t) = ($from_edge, $to_edge);

    clutter_snap_constraint_set_edges($!mcsc, $f, $t);
  }

  method set_offset (Num() $offset) is also<set-offset> {
    my gfloat $o = $offset;

    clutter_snap_constraint_set_offset($!mcsc, $o);
  }

  method set_source (MutterClutterActor() $source) is also<set-source> {
    clutter_snap_constraint_set_source($!mcsc, $source);
  }

}
