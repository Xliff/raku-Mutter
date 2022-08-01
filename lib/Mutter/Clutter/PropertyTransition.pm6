use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PropertyTransition;

use Mutter::Clutter::Transition;

use GLib::Roles::Implementor;

our subset MutterClutterPropertyTransitionAncestry is export of Mu
  where MutterClutterPropertyTransition | MutterClutterTransitionAncestry;

class Mutter::Clutter::PropertyTransition is Mutter::Clutter::Transition {
  has MutterClutterPropertyTransition $!mcpt is implementor;

  submethod BUILD ( :$mutter-clutter-property-transition ) {
    self.setMutterClutterPropertyTransition(
      $mutter-clutter-property-transition
    ) if $mutter-clutter-property-transition
  }

  method setMutterClutterPropertyTransition (
    MutterClutterPropertyTransitionAncestry $_
  ) {
    my $to-parent;

    $!mcpt = do {
      when MutterClutterPropertyTransition {
        $to-parent = cast(MutterClutterTransition, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterPropertyTransition, $_);
      }
    }
    self.setMutterClutterTransition($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterPropertyTransition
    is also<MutterClutterPropertyTransition>
  { $!mcpt }

  constant MCPTA := MutterClutterPropertyTransitionAncestry;

  multi method new (MCPTA $mutter-clutter-property-transition, :$ref = True) {
    return unless $mutter-clutter-property-transition;

    my $o = self.bless( :$mutter-clutter-property-transition );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $property-name) {
    my $mutter-clutter-property-transition =
      clutter_property_transition_new($property-name);

    $mutter-clutter-property-transition
      ?? self.bless( :$mutter-clutter-property-transition )
      !! Nil;
  }

  method new_for_actor (MutterClutterActor() $actor, Str() $property_name)
    is also<new-for-actor>
  {
    my $mutter-clutter-property-transition =
      clutter_property_transition_new_for_actor($$actor, $property_name);

    $mutter-clutter-property-transition
      ?? self.bless( :$mutter-clutter-property-transition )
      !! Nil;
  }

  method get_property_name is also<get-property-name> {
    clutter_property_transition_get_property_name($!mcpt);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_property_transition_get_type,
      $n,
      $t
    );
  }

  method set_property_name (Str() $property_name) is also<set-property-name> {
    clutter_property_transition_set_property_name($!mcpt, $property_name);
  }

}
