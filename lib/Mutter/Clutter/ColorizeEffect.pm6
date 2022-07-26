use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use Mutter::Clutter::OffscreenEffect;

use GLib::Roles::Implementor;

our subset MutterClutterColorizeEffectAncestry is export of Mu
  where MutterClutterColorizeEffect | MutterClutterOffscreenEffectAncestry;

class Mutter::Clutter::ColorizeEffect is Mutter::Clutter::OffscreenEffect {
  has MutterClutterColorizeEffect $!mcce is implementor;

  submethod BUILD ( :$mutter-clutter-colorize ) {
    self.setMutterClutterColorizeEffect($mutter-clutter-colorize)
      if $mutter-clutter-colorize
  }

  method setMutterClutterColorizeEffect (
    MutterClutterColorizeEffectAncestry $_
  ) {
    my $to-parent;

    $!mcce = do {
      when MutterClutterColorizeEffect {
        $to-parent = cast(MutterClutterOffscreenEffect, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterColorizeEffect, $_);
      }
    }
    self.setMutterClutterOffscreenEffect($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterColorizeEffect
    is also<MutterClutterColorizeEffect>
  { $!mcce }

  multi method new (
    MutterClutterColorizeEffectAncestry  $mutter-clutter-colorize,
                                        :$ref                      = True
  ) {
    return unless $mutter-clutter-colorize;

    my $o = self.bless( :$mutter-clutter-colorize );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterClutterColor() $tint) {
    my $mutter-clutter-colorize = clutter_colorize_effect_new($tint);

    $mutter-clutter-colorize ?? self.bless( :$mutter-clutter-colorize )
                             !! Nil;
  }

  # Type: MutterClutterColor
  method tint ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Color.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('tint', $gv);
        propReturnObject(
         $gv.object,
         $raw,
         |Mutter::Clutter::Color.getTypePair
       );
      },
      STORE => -> $, MutterClutterColor() $val is copy {
        $gv.object = $val;
        self.prop_set('tint', $gv);
      }
    );
  }

  proto method get_tint (|)
    is also<get-tint>
  { * }

  multi method get_tint ( :$raw = False ) {
    samewith(Mutter::Clutter::Color.alloc, :$raw);
  }
  multi method get_tint (MutterClutterColor() $tint, :$raw = False) {
    propReturnObject(
      clutter_colorize_effect_get_tint($!mcce, $tint);
      $raw,
      |Mutter::Clutter::Color.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_colorize_effect_get_type, $n, $t );
  }

  method set_tint (MutterClutterColor() $tint) is also<set-tint> {
    clutter_colorize_effect_set_tint($!mcce, $tint);
  }
}

### /usr/src/mutter-42.1/clutter/clutter/clutter-colorize-effect.h

sub clutter_colorize_effect_get_tint (
  MutterClutterColorizeEffect $effect,
  MutterClutterColor          $tint
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_colorize_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_colorize_effect_new (MutterClutterColor $tint)
  returns MutterClutterEffect
  is native(mutter-clutter)
  is export
{ * }

sub clutter_colorize_effect_set_tint (
  MutterClutterColorizeEffect $effect,
  MutterClutterColor          $tint
)
  is native(mutter-clutter)
  is export
{ * }
