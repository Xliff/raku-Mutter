use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::Action;

class Mutter::Clutter::TapAction is Mutter::Clutter::Action {
  has MutterClutterTapAction $!mcsa is implementor;

  method new {
    my $clutter-tap-action = clutter_tap_action_new();

    $clutter-tap-action ?? self.bless( :$clutter-tap-action ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_tap_action_get_type, $n, $t );
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-tap-action.h

sub clutter_tap_action_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_tap_action_new ()
  returns MutterClutterTapAction
  is native(mutter)
  is export
{ * }
