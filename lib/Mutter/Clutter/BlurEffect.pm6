use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::OffscreenEffect;

use GLib::Roles::Implementor;

class Mutter::Clutter::BlurEffect is Mutter::Clutter::OffscreenEffect {
  has MutterClutterBlurEffect $!mcbe is implementor;

  method new {
    my $mutter-clutter-blur-effect = clutter_blur_effect_new();

    $mutter-clutter-blur-effect ?? self.bless( :$mutter-clutter-blur-effect )
                                !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_blur_effect_get_type, $n, $t );
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-blur-effect.h

sub clutter_blur_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_blur_effect_new ()
  returns MutterClutterEffect
  is native(mutter-clutter)
  is export
{ * }
