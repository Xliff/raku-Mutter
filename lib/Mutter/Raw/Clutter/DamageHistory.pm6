use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::DamageHistory;

### /usr/src/mutter-42.1/clutter/clutter/clutter-damage-history.h

sub clutter_damage_history_free (MutterClutterDamageHistory $history)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_damage_history_is_age_valid (
  MutterClutterDamageHistory $history,
  gint                       $age
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_damage_history_lookup (
  MutterClutterDamageHistory $history,
  gint                       $age
)
  returns cairo_region_t
  is native(mutter-clutter)
  is export
{ * }

sub clutter_damage_history_new ()
  returns MutterClutterDamageHistory
  is native(mutter-clutter)
  is export
{ * }

sub clutter_damage_history_record (
  MutterClutterDamageHistory $history,
  cairo_region_t       $damage
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_damage_history_step (MutterClutterDamageHistory $history)
  is native(mutter-clutter)
  is export
{ * }
