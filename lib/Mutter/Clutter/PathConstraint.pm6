use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PathConstraint;

class Mutter::Clutter::PathConstraint {
  has MutterClutterPathConstraint $!mcpc is implementor;

  method new (MutterClutterPath() $path, Num() $offset) {
    my gfloat $o = $offset;

    my $mutter-clutter-path-constraint = clutter_path_constraint_new(
      $path,
      $offset
    );

    $mutter-clutter-path-constraint
      ?? self.bless( :$mutter-clutter-path-constraint )
      !! Nil
  }

  method get_offset {
    clutter_path_constraint_get_offset($!mcpc);
  }

  method get_path ( :$raw = False) {
    propReturnObject(
      clutter_path_constraint_get_path($!mcpc),
      $raw,
      |Mutter::Clutter::Path.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_path_constraint_get_type, $n, $t );
  }

  method set_offset (Num() $offset) {
    my gfloat $o = $offset;

    clutter_path_constraint_set_offset($!mcpc, $o);
  }

  method set_path (MutterClutterPath() $path) {
    clutter_path_constraint_set_path($!mcpc, $path);
  }

}
