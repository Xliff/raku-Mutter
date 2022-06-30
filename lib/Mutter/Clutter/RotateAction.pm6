use v6.c;

use NativeCall;

use Mutter::Raw::Types;

class Mutter::Clutter::RotateAction {
  has MutterClutterRotateAction $!mcra is implementor;

  method new {
    my $mutter-clutter-rotate-action = clutter_rotate_action_new();

    $mutter-clutter-rotate-action
      ?? self.bless( :$mutter-clutter-rotate-action )
      !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_rotate_action_get_type, $n, $t );
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-rotate-action.h

sub clutter_rotate_action_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_rotate_action_new ()
  returns MutterClutterRotateAction
  is native(mutter)
  is export
{ * }
