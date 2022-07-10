use v6.c;

use Mutter::Clutter::PathConstraint;

class Mutter::Clutter::Constraint::Path {
  has Mutter::Clutter::PathConstraint $!pc handles(*) is built;

  method ACCEPTS (\k) {
    for ::?CLASS, |self.^attributes[0].type.^mro {
      return True if $_ === k;
    }
    False
  }

  method new ( *@a ) {
    self.bless(
      pc => Mutter::Clutter::PathConstraint.new( |@a )
    )
  }

}
