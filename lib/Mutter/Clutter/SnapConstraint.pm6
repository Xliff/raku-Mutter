use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::SnapConstraint;

use Mutter::Clutter::Constraint;

class Mutter::Clutter::SnapConstraint is Mutter::Clutter::Constraint {
  has MutterClutterSnapConstraint $!mcsc is implementor;

  method new (
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

  proto method get_edges (|)
  { * }

  multi method get_edges {
    samewith($, $);
  }
  multi method get_edges ($from_edge is rw, $to_edge is rw) {
    my MutterClutterSnapEdge ($f, $t) = 0 xx 2;

    clutter_snap_constraint_get_edges($!mcsc, $f, $t);
    ($from_edge, $to_edge) = ($f, $t);
  }

  method get_offset {
    clutter_snap_constraint_get_offset($!mcsc);
  }

  method get_source ( :$raw = False ) {
    propReturnObject(
      clutter_snap_constraint_get_source($!mcsc),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_snap_constraint_get_type, $n, $t );
  }

  method set_edges (
    MutterClutterSnapEdge() $from_edge,
    MutterClutterSnapEdge() $to_edge
  ) {
    my MutterClutterSnapEdge ($f, $t) = ($from_edge, $to_edge);

    clutter_snap_constraint_set_edges($!mcsc, $f, $t);
  }

  method set_offset (Num() $offset) {
    my gfloat $o = $offset;

    clutter_snap_constraint_set_offset($!mcsc, $o);
  }

  method set_source (MutterClutterActor() $source) {
    clutter_snap_constraint_set_source($!mcsc, $source);
  }

}
