use v6.c;

use Mutter::Clutter::BindConstraint;

class Mutter::Clutter::Constraint::Bind {
  has Mutter::Clutter::BindConstraint $!bc handles(*) is built;

  method ACCEPTS (\k) {
    for ::?CLASS, |self.^attributes[0].type.^mro {
      return True if $_ === k;
    }
    False
  }

  method new ( *@a ) {
    self.bless(
      bc => Mutter::Clutter::BindConstraint.new( |@a )
    )
  }

}
