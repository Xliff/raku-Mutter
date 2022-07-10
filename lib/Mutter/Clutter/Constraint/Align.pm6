use v6.c;

use Mutter::Clutter::AlignConstraint;

class Mutter::Clutter::Constraint::Align {
  has Mutter::Clutter::AlignConstraint $!ac handles(*) is built;

  method ACCEPTS (\k) {
    for ::?CLASS, |self.^attributes[0].type.^mro {
      return True if $_ === k;
    }
    False
  }

  method new ( *@a ) {
    self.bless(
      ac => Mutter::Clutter::AlignConstraint.new( |@a )
    )
  }

}
