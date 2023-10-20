use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::BrightnessContrastEffect;

use Mutter::Clutter::Effect;

use GLib::Roles::Implementor;

class Mutter::Clutter::BrightnessContrastEffect is Mutter::Clutter::Effect {
  has MutterClutterBrightnessContrastEffect $!mcbce is implementor;

  method new ( *%a ) {
    my $mutter-clutter-brightness-contrast-effect =
      clutter_brightness_contrast_effect_new();

    my $o = $mutter-clutter-brightness-contrast-effect
      ?? self.bless( :$mutter-clutter-brightness-contrast-effect )
      !! Nil
    $o.setAttributes( |%a ) if $o && +%a;
    $o;
  }

  # Type: MutterClutterColor
  method brightness ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Color.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('brightness', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Color.getTypePair
        );
      },
      STORE => -> $, MutterClutterColor() $val is copy {
        $gv.object = $val;
        self.prop_set('brightness', $gv);
      }
    );
  }

  # Type: MutterClutterColor
  method contrast ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Color.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('contrast', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Color.getTypePair
        );
      },
      STORE => -> $, MutterClutterColor() $val is copy {
        $gv.object = $val;
        self.prop_set('contrast', $gv);
      }
    );
  }

  proto method get_brightness (|)
    is also<get-brightness>
  { * }

  multi method get_brightness {
    samewith($, $, $);
  }
  multi method get_brightness ($red is rw, $green is rw, $blue is rw) {
    my gfloat ($r, $g, $b) = 0e0 xx 3;

    clutter_brightness_contrast_effect_get_brightness($!mcbce, $r, $g, $b);
    ($red, $green, $blue) = ($r, $g, $b);
  }

  proto method get_contrast (|)
    is also<get-contrast>
  { * }

  multi method get_contrast {
    samewith($, $, $);
  }
  multi method get_contrast ($red is rw, $green is rw, $blue is rw) {
    my gfloat ($r, $g, $b) = 0e0 xx 3;

    clutter_brightness_contrast_effect_get_contrast($!mcbce, $r, $g, $b);
    ($red, $green, $blue) = ($r, $g, $b);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_brightness_contrast_effect_get_type;
      $n,
      $t
    );
  }

  method set_brightness (Num() $brightness) is also<set-brightness> {
    my gfloat $b = $brightness;

    clutter_brightness_contrast_effect_set_brightness($!mcbce, $b);
  }

  method set_brightness_full (Num() $red, Num() $green, Num() $blue)
    is also<set-brightness-full>
  {
    my gfloat ($r, $g, $b) = ($red, $green, $blue);

    clutter_brightness_contrast_effect_set_brightness_full(
      $!mcbce,
      $r,
      $g,
      $b
    );
  }

  method set_contrast (Num() $contrast) is also<set-contrast> {
    my gfloat $c = $contrast;

    clutter_brightness_contrast_effect_set_contrast($!mcbce, $c);
  }

  method set_contrast_full (Num() $red, Num() $green, Num() $blue)
    is also<set-contrast-full>
  {
    my gfloat ($r, $g, $b) = ($red, $green, $blue);

    clutter_brightness_contrast_effect_set_contrast_full($!mcbce, $r, $g, $b)
  }

}
