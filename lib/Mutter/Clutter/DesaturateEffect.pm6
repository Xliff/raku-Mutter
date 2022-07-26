use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use Mutter::Clutter::OffscreenEffect;

use GLib::Roles::Implementor;

our subset MutterClutterDesaturateEffectAncestry is export of Mu
  where MutterClutterDesaturateEffect | MutterClutterOffscreenEffectAncestry;

class Mutter::Clutter::DesaturateEffect {
  has MutterClutterDesaturateEffect $!mcde is implementor;

  submethod BUILD ( :$mutter-clutter-desaturate ) {
    self.setMutterClutterDesaturateEffect($mutter-clutter-desaturate)
      if $mutter-clutter-desaturate
  }

  method setMutterClutterDesaturateEffect (
    MutterClutterDesaturateEffectAncestry $_
  ) {
    my $to-parent;

    $!mcde = do {
      when MutterClutterDesaturateEffect {
        $to-parent = cast(MutterClutterOffscreenEffect, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterDesaturateEffect, $_);
      }
    }
    self.setMutterClutterOffscreenEffect($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterDesaturateEffect
  { $!mcde }

  multi method new (
    MutterClutterDesaturateEffectAncestry  $mutter-clutter-desaturate,
                                          :$ref                        = True
  ) {
    return unless $mutter-clutter-desaturate;

    my $o = self.bless( :$mutter-clutter-desaturate );
    $o.ref if $ref;
    $o;
  }
  multi method new (Num() $factor) {
    my gdouble $f = $factor;

    my $mutter-clutter-desaturate = clutter_desaturate_effect_new($f);

    $mutter-clutter-desaturate ?? self.bless( :$mutter-clutter-desaturate )
                               !! Nil;
  }

  # Type: double
  method factor is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('factor', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('factor', $gv);
      }
    );
  }

  method get_factor is also<get-factor> {
    clutter_desaturate_effect_get_factor($!mcde);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_desaturate_effect_get_type,
      $n,
      $t
    );
  }

  method set_factor (Num() $factor) is also<set-factor> {
    my gdouble $f = $factor;

    clutter_desaturate_effect_set_factor($!mcde, $f);
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-desaturate-effect.h

sub clutter_desaturate_effect_get_factor (
  MutterClutterDesaturateEffect $effect
)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_desaturate_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_desaturate_effect_new (gdouble $factor)
  returns MutterClutterEffect
  is native(mutter-clutter)
  is export
{ * }

sub clutter_desaturate_effect_set_factor (
  MutterClutterDesaturateEffect $effect,
  gdouble                       $factor
)
  is native(mutter-clutter)
  is export
{ * }
