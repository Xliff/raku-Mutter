use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::COGL::Color;

use GLib::Roles::Implementor;

# STRUCT

class Mutter::COGL::Color {
  also does GLib::Roles::Implementor;

  has MutterCoglColor $!mcc is implementor;

  submethod BUILD ( :$mutter-cogl-color ) {
    $!mcc = $mutter-cogl-color if $mutter-cogl-color;
  }

  method Mutter::Raw::Definitions::MutterCoglColor
  { $!mcc }

  multi method new (MutterCoglColor $mutter-cogl-color) {
    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }
  multi method new {
    my $mutter-cogl-color = cogl_color_new();

    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }

  multi method new (
    Num() $red,
    Num() $green,
    Num() $blue,
    Num() $alpha,

    :from_4f(:$from-floats) is required
  ) {
    my $mutter-cogl-color = self.init_from_4f($red, $green, $blue, $alpha);

    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }
  method init_from_4f (Num() $red, Num() $green, Num() $blue, Num() $alpha) is also<init-from-4f> {
    my gfloat ($r, $g, $b, $a) = ($red, $green, $blue, $alpha);

    cogl_color_init_from_4f($!mcc, $r, $g, $b, $a)
  }

  proto method init_from_4fv (|)
    is also<init-from-4fv>
  { * }

  multi method new ( @array, :from_4fv(:$from-float-vector) is required ) {
    my $mutter-cogl-color = self.init_from_4fv(@array);

    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }
  multi method new (
    CArray[gfloat] $array,

    :from_4fv(:$from-float-vector) is required
  ) {
    my $mutter-cogl-color = self.init_from_4fv($array);

    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }
  multi method init_from_4fv (@array) {
    die 'Must have 4 floating-point values in array!' unless @array.elems == 4;
    samewith( ArrayToCArray(gfloat, @array) );
  }
  multi method init_from_4fv (CArray[gfloat] $color_array) {
    cogl_color_init_from_4fv($!mcc, $color_array);
  }

  multi method new (
    Int() $red,
    Int() $green,
    Int() $blue,
    Int() $alpha,

    :from_4ub(:$from-bytes) is required
  ) {
    my $mutter-cogl-color = self.init_from_4ub($$red, $green, $blue, $alpha);

    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }
  method init_from_4ub (Int() $red, Int() $green, Int() $blue, Int() $alpha)
    is also<init-from-4ub>
  {
    my uint8_t ($r, $g, $b, $a) = ($red, $green, $blue, $alpha);

    cogl_color_init_from_4ub($!mcc, $r, $g, $b, $a);
  }

  multi method new (
    Num() $hue,
    Num() $saturation,
    Num() $luminance,

    :hsl( :from_hsl( :$from-hsl ) ) is required
  ) {
    my $mutter-cogl-color = self.init_from_hsl($hue, $saturation, $luminance);

    $mutter-cogl-color ?? self.bless( :$mutter-cogl-color ) !! Nil;
  }
  method init_from_hsl (Num() $hue, Num() $saturation, Num() $luminance)
    is also<init-from-hsl>
  {
    my gfloat ($h, $s, $l) = ($hue, $saturation, $luminance);

    cogl_color_init_from_hsl($!mcc, $h, $s, $l);
  }

  method alpha is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_alpha    },
      STORE => -> $, \v { self.set_alpha(v) }
  }

  method alpha_byte is rw is a-property is also<alpha-byte> {
    Proxy.new:
      FETCH => -> $     { self.get_alpha_byte    },
      STORE => -> $, \v { self.set_alpha_byte(v) }
  }

  method alpha_float is rw is a-property is also<alpha-float> {
    Proxy.new:
      FETCH => -> $     { self.get_alpha_float    },
      STORE => -> $, \v { self.set_alpha_float(v) }
  }

  method blue is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_blue    },
      STORE => -> $, \v { self.set_blue(v) }
  }

  method blue_byte is rw is a-property is also<blue-byte> {
    Proxy.new:
      FETCH => -> $     { self.get_blue_byte    },
      STORE => -> $, \v { self.set_blue_byte(v) }
  }

  method blue_float is rw is a-property is also<blue-float> {
    Proxy.new:
      FETCH => -> $     { self.get_blue_float    },
      STORE => -> $, \v { self.set_blue_float(v) }
  }

  method green is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_green    },
      STORE => -> $, \v { self.set_green(v) }
  }

  method green_byte is rw is a-property is also<green-byte> {
    Proxy.new:
      FETCH => -> $     { self.get_green_byte    },
      STORE => -> $, \v { self.set_green_byte(v) }
  }

  method green_float is rw is a-property is also<green-float> {
    Proxy.new:
      FETCH => -> $     { self.get_green_float    },
      STORE => -> $, \v { self.set_green_float(v) }
  }

  method red is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_red    },
      STORE => -> $, \v { self.set_red(v) }
  }

  method red_byte is rw is a-property is also<red-byte> {
    Proxy.new:
      FETCH => -> $     { self.get_red_byte    },
      STORE => -> $, \v { self.set_red_byte(v) }
  }

  method red_float is rw is a-property is also<red-float> {
    Proxy.new:
      FETCH => -> $     { self.get_red_float    },
      STORE => -> $, \v { self.set_red_float(v) }
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      cogl_color_copy($!mcc),
      $raw,
      |self.getTypePair
    );
  }

  method equal (MutterCoglColor() $v2) {
    so cogl_color_equal($!mcc, $v2);
  }

  method free {
    cogl_color_free($!mcc);
  }

  method get_alpha is also<get-alpha> {
    cogl_color_get_alpha($!mcc);
  }

  method get_alpha_byte is also<get-alpha-byte> {
    cogl_color_get_alpha_byte($!mcc);
  }

  method get_alpha_float is also<get-alpha-float> {
    cogl_color_get_alpha_float($!mcc);
  }

  method get_blue is also<get-blue> {
    cogl_color_get_blue($!mcc);
  }

  method get_blue_byte is also<get-blue-byte> {
    cogl_color_get_blue_byte($!mcc);
  }

  method get_blue_float is also<get-blue-float> {
    cogl_color_get_blue_float($!mcc);
  }

  method get_green is also<get-green> {
    cogl_color_get_green($!mcc);
  }

  method get_green_byte is also<get-green-byte> {
    cogl_color_get_green_byte($!mcc);
  }

  method get_green_float is also<get-green-float> {
    cogl_color_get_green_float($!mcc);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_color_get_gtype, $n, $t )
  }

  method get_red is also<get-red> {
    cogl_color_get_red($!mcc);
  }

  method get_red_byte is also<get-red-byte> {
    cogl_color_get_red_byte($!mcc);
  }

  method get_red_float is also<get-red-float> {
    cogl_color_get_red_float($!mcc);
  }

  method premultiply {
    cogl_color_premultiply($!mcc);
  }

  method set_alpha (Num() $alpha) is also<set-alpha> {
    my gfloat $a = $alpha;

    cogl_color_set_alpha($!mcc, $a);
  }

  method set_alpha_byte (Int() $alpha) is also<set-alpha-byte> {
    my uint8 $a = $alpha;

    cogl_color_set_alpha_byte($!mcc, $a);
  }

  method set_alpha_float (Num() $alpha) is also<set-alpha-float> {
    my gfloat $a = $alpha;

    cogl_color_set_alpha_float($!mcc, $a);
  }

  method set_blue (Num() $blue) is also<set-blue> {
    my gfloat $b = $blue;

    cogl_color_set_blue($!mcc, $b);
  }

  method set_blue_byte (Int() $blue) is also<set-blue-byte> {
    my uint8 $b = $blue;

    cogl_color_set_blue_byte($!mcc, $b);
  }

  method set_blue_float (Num() $blue) is also<set-blue-float> {
    my gfloat $b = $blue;

    cogl_color_set_blue_float($!mcc, $b);
  }

  method set_green (Num() $green) is also<set-green> {
    my gfloat $g = $green;

    cogl_color_set_green($!mcc, $g);
  }

  method set_green_byte (Int() $green) is also<set-green-byte> {
    my uint8 $g = $green;

    cogl_color_set_green_byte($!mcc, $g);
  }

  method set_green_float (Num() $green) is also<set-green-float> {
    my gfloat $g = $green;

    cogl_color_set_green_float($!mcc, $g);
  }

  method set_red (Num() $red) is also<set-red> {
    my gfloat $r = $red;

    cogl_color_set_red($!mcc, $r);
  }

  method set_red_byte (Int() $red) is also<set-red-byte> {
    my uint8 $r = $red;

    cogl_color_set_red_byte($!mcc, $r);
  }

  method set_red_float (Num() $red) is also<set-red-float> {
    my gfloat $r = $red;

    cogl_color_set_red_float($!mcc, $r);
  }

  proto method to_hsl (|)
    is also<to-hsl>
  { * }

  multi method to_hsl {
    samewith($, $, $);
  }
  multi method to_hsl (
    $hue        is rw,
    $saturation is rw,
    $luminance  is rw
  ) {
    my gfloat ($h, $s, $l) = 0e0;

    cogl_color_to_hsl($!mcc, $h, $s, $l);
    ($hue, $saturation, $luminance) = ($h, $s, $l);
  }

  method unpremultiply {
    cogl_color_unpremultiply($!mcc);
  }

}
