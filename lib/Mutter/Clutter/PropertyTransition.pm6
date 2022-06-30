use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PropertyTransition;

class Mutter::Clutter::PropertyTransition {
  has MutterClutterPropertyTransition $!mcpt is implementor;

  method new (Str() $property-name) {
    my $mutter-clutter-property-transition =
      clutter_property_transition_new($property-name);

    $mutter-clutter-property-transition
      ?? self.bless( :$mutter-clutter-property-transition )
      !! Nil;
  }

  method new_for_actor (MutterClutterActor() $actor, Str() $property_name) {
    my $mutter-clutter-property-transition =
      clutter_property_transition_new_for_actor($$actor, $property_name);

    $mutter-clutter-property-transition
      ?? self.bless( :$mutter-clutter-property-transition )
      !! Nil;
  }

  method get_property_name {
    clutter_property_transition_get_property_name($!mcpt);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_property_transition_get_type,
      $n,
      $t
    );
  }

  method set_property_name (Str() $property_name) {
    clutter_property_transition_set_property_name($!mcpt, $property_name);
  }

}
