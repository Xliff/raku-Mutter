use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::Clutter::Units;

### /usr/src/mutter-42.1/clutter/clutter/clutter-units.h

sub clutter_param_spec_units (
  Str                   $name,
  Str                   $nick,
  Str                   $blurb,
  MutterClutterUnitType $default_type,
  gfloat                $minimum,
  gfloat                $maximum,
  gfloat                $default_value,
  GParamFlags           $flags
)
  returns GParamSpec
  is native(mutter-clutter)
  is export
{ * }

sub clutter_param_units_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_get_units (GValue $value)
  returns MutterClutterUnits
  is native(mutter-clutter)
  is export
{ * }

sub clutter_value_set_units (GValue $value, MutterClutterUnits $units)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_copy (MutterClutterUnits $units)
  returns MutterClutterUnits
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_free (MutterClutterUnits $units)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_cm (MutterClutterUnits $units, gfloat $cm)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_em (MutterClutterUnits $units, gfloat $em)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_em_for_font (
  MutterClutterUnits $units,
  Str          $font_name,
  gfloat       $em
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_mm (MutterClutterUnits $units, gfloat $mm)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_pixels (MutterClutterUnits $units, gint $px)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_pt (MutterClutterUnits $units, gfloat $pt)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_from_string (MutterClutterUnits $units, Str $str)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_get_unit_type (MutterClutterUnits $units)
  returns MutterClutterUnitType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_get_unit_value (MutterClutterUnits $units)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_to_pixels (MutterClutterUnits $units)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_units_to_string (MutterClutterUnits $units)
  returns Str
  is native(mutter-clutter)
  is export
{ * }
