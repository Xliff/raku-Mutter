use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Units;

use GLib::Roles::Implementor;

class Mutter::Clutter::Units {
  also does GLib::Roles::Implementor;

  has MutterClutterUnits $!mcu is implementor;

  submethod BUILD ( :$mutter-clutter-units ) {
    $!mcu = $mutter-clutter-units if $mutter-clutter-units;
  }

  method Mutter::Raw::Structs::MutterClutterUnits
    is also<MutterClutterUnits>
  { $!mcu }

  method new (MutterClutterUnits $mutter-clutter-units) {
    $mutter-clutter-units ?? self.bless( :$mutter-clutter-units ) !! Nil
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      clutter_units_copy($!mcu),
      $raw,
      |self.getTypePair
    );
  }

  method free {
    clutter_units_free($!mcu);
  }

  method from_cm (Num() $cm) is also<from-cm> {
    my gfloat $c = $cm;

    clutter_units_from_cm($!mcu, $c);
  }

  method from_em (Num() $em) is also<from-em> {
    my gfloat $e = $em;

    clutter_units_from_em($!mcu, $e);
  }

  method from_em_for_font (Str() $font_name, Num() $em)
    is also<from-em-for-font>
  {
    my gfloat $e = $em;

    clutter_units_from_em_for_font($!mcu, $font_name, $e);
  }

  method from_mm (Num() $mm) is also<from-mm> {
    my gfloat $m = $mm;

    clutter_units_from_mm($!mcu, $m);
  }

  method from_pixels (Int() $px) is also<from-pixels> {
    my gint $p = $px;

    clutter_units_from_pixels($!mcu, $p);
  }

  method from_pt (Num() $pt) is also<from-pt> {
    my gfloat $p = $pt;

    clutter_units_from_pt($!mcu, $p);
  }

  method from_string (Str() $str) is also<from-string> {
    clutter_units_from_string($!mcu, $str);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_units_get_type, $n, $t );
  }

  method get_unit_type is also<get-unit-type> {
    MutterClutterUnitTypeEnum( clutter_units_get_unit_type($!mcu) );
  }

  method get_unit_value is also<get-unit-value> {
    clutter_units_get_unit_value($!mcu);
  }

  method to_pixels is also<to-pixels> {
    clutter_units_to_pixels($!mcu);
  }

  method to_string is also<to-string> {
    clutter_units_to_string($!mcu);
  }

}

# method clutter_param_spec_units (Str $nick, Str $blurb, ClutterUnitType $default_type, gfloat $minimum, gfloat $maximum, gfloat $default_value, GParamFlags $flags) {
#   clutter_param_spec_units($!mcu, $nick, $blurb, $default_type, $minimum, $maximum, $default_value, $flags);
# }
#
# method clutter_param_units_get_type {
#   clutter_param_units_get_type();
# }
#
# method clutter_value_get_units {
#   clutter_value_get_units($!mcu);
# }
#
# method clutter_value_set_units (MutterClutterUnits $units) {
#   clutter_value_set_units($!mcu, $units);
# }
