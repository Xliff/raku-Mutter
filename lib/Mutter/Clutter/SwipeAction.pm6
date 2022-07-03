use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::Action;

class Mutter::Clutter::SwipeAction is Mutter::Clutter::Action {
  has MutterClutterSwipeAction $!mcsa is implementor;

  method new {
    my $clutter-swipe-action = clutter_swipe_action_new();

    $clutter-swipe-action ?? self.bless( :$clutter-swipe-action ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_swipe_action_get_type, $n, $t );
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-swipe-action.h

sub clutter_swipe_action_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_swipe_action_new ()
  returns MutterClutterSwipeAction
  is native(mutter)
  is export
{ * }
