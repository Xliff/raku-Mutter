use v6.c;

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
  method init_from_4f (Num() $red, Num() $green, Num() $blue, Num() $alpha) {
    my gfloat ($r, $g, $b, $a) = ($red, $green, $blue, $alpha);

    cogl_color_init_from_4f($!mcc, $r, $g, $b, $a)
  }

  proto method init_from_4fv (|)
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
  method init_from_4ub (Int() $red, Int() $green, Int() $blue, Int() $alpha) {
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
  method init_from_hsl (Num() $hue, Num() $saturation, Num() $luminance) {
    my gfloat ($h, $s, $l) = ($hue, $saturation, $luminance);

    cogl_color_init_from_hsl($!mcc, $h, $s, $l);
  }

  method alpha is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_alpha    },
      STORE => -> $, \v { self.set_alpha(v) }
  }

  method alpha_byte is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_alpha_byte    },
      STORE => -> $, \v { self.set_alpha_byte(v) }
  }

  method alpha_float is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_alpha_float    },
      STORE => -> $, \v { self.set_alpha_float(v) }
  }

  method blue is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_blue    },
      STORE => -> $, \v { self.set_blue(v) }
  }

  method blue_byte is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_blue_byte    },
      STORE => -> $, \v { self.set_blue_byte(v) }
  }

  method blue_float is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_blue_float    },
      STORE => -> $, \v { self.set_blue_float(v) }
  }

  method green is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_green    },
      STORE => -> $, \v { self.set_green(v) }
  }

  method green_byte is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_green_byte    },
      STORE => -> $, \v { self.set_green_byte(v) }
  }

  method green_float is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_green_float    },
      STORE => -> $, \v { self.set_green_float(v) }
  }

  method red is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_red    },
      STORE => -> $, \v { self.set_red(v) }
  }

  method red_byte is rw is a-property {
    Proxy.new:
      FETCH => -> $     { self.get_red_byte    },
      STORE => -> $, \v { self.set_red_byte(v) }
  }

  method red_float is rw is a-property {
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

  method get_alpha {
    cogl_color_get_alpha($!mcc);
  }

  method get_alpha_byte {
    cogl_color_get_alpha_byte($!mcc);
  }

  method get_alpha_float {
    cogl_color_get_alpha_float($!mcc);
  }

  method get_blue {
    cogl_color_get_blue($!mcc);
  }

  method get_blue_byte {
    cogl_color_get_blue_byte($!mcc);
  }

  method get_blue_float {
    cogl_color_get_blue_float($!mcc);
  }

  method get_green {
    cogl_color_get_green($!mcc);
  }

  method get_green_byte {
    cogl_color_get_green_byte($!mcc);
  }

  method get_green_float {
    cogl_color_get_green_float($!mcc);
  }

  method get_gtype {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_color_get_gtype, $n, $t )
  }

  method get_red {
    cogl_color_get_red($!mcc);
  }

  method get_red_byte {
    cogl_color_get_red_byte($!mcc);
  }

  method get_red_float {
    cogl_color_get_red_float($!mcc);
  }

  method premultiply {
    cogl_color_premultiply($!mcc);
  }

  method set_alpha (Num() $alpha) {
    my gfloat $a = $alpha;

    cogl_color_set_alpha($!mcc, $a);
  }

  method set_alpha_byte (Int() $alpha) {
    my uint8 $a = $alpha;

    cogl_color_set_alpha_byte($!mcc, $a);
  }

  method set_alpha_float (Num() $alpha) {
    my gfloat $a = $alpha;

    cogl_color_set_alpha_float($!mcc, $a);
  }

  method set_blue (Num() $blue) {
    my gfloat $b = $blue;

    cogl_color_set_blue($!mcc, $b);
  }

  method set_blue_byte (Int() $blue) {
    my uint8 $b = $blue;

    cogl_color_set_blue_byte($!mcc, $b);
  }

  method set_blue_float (Num() $blue) {
    my gfloat $b = $blue;

    cogl_color_set_blue_float($!mcc, $b);
  }

  method set_green (Num() $green) {
    my gfloat $g = $green;

    cogl_color_set_green($!mcc, $g);
  }

  method set_green_byte (Int() $green) {
    my uint8 $g = $green;

    cogl_color_set_green_byte($!mcc, $g);
  }

  method set_green_float (Num() $green) {
    my gfloat $g = $green;

    cogl_color_set_green_float($!mcc, $g);
  }

  method set_red (Num() $red) {
    my gfloat $r = $red;

    cogl_color_set_red($!mcc, $r);
  }

  method set_red_byte (Int() $red) {
    my uint8 $r = $red;

    cogl_color_set_red_byte($!mcc, $r);
  }

  method set_red_float (Num() $red) {
    my gfloat $r = $red;

    cogl_color_set_red_float($!mcc, $r);
  }

  proto method to_hsl (|)
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
