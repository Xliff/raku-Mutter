use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;

# BOXED

class Mutter::Clutter::Grab {
  has MutterClutterGrab $!mcg is implementor;

  submethod BUILD ( :$muter-clutter-grab ) {
    $!mcg = $muter-clutter-grab;
  }

  method Mutter::Raw::Definitions::MutterClutterGrab
    is also<MutterClutterGrab>
  { $!mcg }

  method dismiss {
    clutter_grab_dismiss($!mcg);
  }

  method get_seat_state is also<get-seat-state> {
    MutterClutterGrabStateEnum( clutter_grab_get_seat_state($!mcg) );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_grab_get_type, $n, $t );
  }

  method ref {
    clutter_grab_ref($!mcg);
    self;
  }

  method unref {
    clutter_grab_unref($!mcg);
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-grab.h

sub clutter_grab_dismiss (MutterClutterGrab $grab)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_grab_get_seat_state (MutterClutterGrab $grab)
  returns MutterClutterGrabState
  is native(mutter-clutter)
  is export
{ * }

sub clutter_grab_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_grab_ref (MutterClutterGrab $grab)
  returns MutterClutterGrab
  is native(mutter-clutter)
  is export
{ * }

sub clutter_grab_unref (MutterClutterGrab $grab)
  is native(mutter-clutter)
  is export
{ * }
