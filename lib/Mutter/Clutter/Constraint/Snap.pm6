use v6.c;

use Mutter::Clutter::SnapConstraint;

class Mutter::Clutter::Constraint::Snap {
  has Mutter::Clutter::SnapConstraint $!sc handles(*) is built;

  method ACCEPTS (\k) {
    for ::?CLASS, |self.^attributes[0].type.^mro {
      return True if $_ === k;
    }
    False
  }

  method new ( *@a ) {
    self.bless(
      sc => Mutter::Clutter::SnapConstraint.new( |@a )
    )
  }

}
