use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::Actor::Meta;

our subset MutterClutterEffectAncestry of Mu is export
  where MutterClutterEffect | MutterClutterActorMetaAncestry;

class Mutter::Clutter::Effect is Mutter::Clutter::Actor::Meta {
  has MutterClutterEffect $!mce is implementor;

  submethod BUILD ( :$mutter-clutter-effect ) {
    self.setMutterClutterEffect($mutter-clutter-effect)
      if $mutter-clutter-effect
  }

  method Mutter::Raw::Definitions::MutterClutterEffect
    is also<MutterClutterEffect>
  { $!mce }

  method setMutterClutterfEffect(MutterClutterEffectAncestry $_) {
    my $to-parent;
    $!mce = do {
      when MutterClutterEffect {
        $to-parent = cast(MutterClutterActorMeta, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterEffect, $_);
      }
    }
    self.setActorMeta($to-parent);
  }

  method new (
    MutterClutterEffectAncestry  $mutter-clutter-effect,
                                :$ref                    = True
  ) {
    return unless $mutter-clutter-effect;

    my $o = self.bless( :$mutter-clutter-effect );
    $o.ref if $ref;
    $o;
  }

  method queue_repaint is also<queue-repaint> {
    clutter_effect_queue_repaint($!mce);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_effect_get_type, $n, $t );
  }

}

sub clutter_effect_queue_repaint (MutterClutterEffect $effect)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
