use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::OffscreenEffect;

use GLib::Roles::Implementor;

our subset MutterClutterBlurEffectAncestry is export of Mu
  where MutterClutterBlurEffect | MutterClutterOffscreenEffectAncestry;

class Mutter::Clutter::BlurEffect is Mutter::Clutter::OffscreenEffect {
  has MutterClutterBlurEffect $!mcbe is implementor;

  submethod BUILD ( :$mutter-clutter-blur-effect ) {
    self.setMutterClutterBlurEffect($mutter-clutter-blur-effect)
      if $mutter-clutter-blur-effect
  }

  method setMutterClutterBlurEffect (MutterClutterBlurEffectAncestry $_) {
    my $to-parent;

    $!mcbe = do {
      when MutterClutterBlurEffect {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBlurEffect, $_);
      }
    }
    self.setMutterClutterOffscreenEffect($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterBlurEffect
  { $!mcbe }

  multi method new (
    MutterClutterBlurEffectAncestry  $mutter-clutter-blur-effect,
                                    :$ref                         = True
  ) {
    return unless $mutter-clutter-blur-effect;

    my $o = self.bless( :$mutter-clutter-blur-effect );
    $o.ref if $ref;
    $o;
  }
  multi method new {
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
