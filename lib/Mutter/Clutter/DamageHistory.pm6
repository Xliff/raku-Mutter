use v6.c;

use Cairo;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::DamageHistory;

# BOXED

use GLib::Roles::Implementor;

class Mutter::Clutter::DamageHistory {
  has MutterClutterDamageHistory $!mcdh is implementor;

  submethod BUILD ( :$mutter-clutter-damage-history ) {
    $!mcdh = $mutter-clutter-damage-history;
  }

  method Mutter::Raw::Structs::MutterClutterDamageHistory
  { $!mcdh }

  multi method new (
    MutterClutterDamageHistory $mutter-clutter-damage-history
  ) {
    $mutter-clutter-damage-history
      ?? self.bless( :$mutter-clutter-damage-history )
      !! Nil
  }
  multi method new {
    my $mutter-clutter-damage-history = clutter_damage_history_new();

    $mutter-clutter-damage-history
      ?? self.bless( :$mutter-clutter-damage-history )
      !! Nil
  }

  method free {
    clutter_damage_history_free($!mcdh);
  }

  method is_age_valid (Int() $age) {
    my gint $a = $age;

    so clutter_damage_history_is_age_valid($!mcdh, $age);
  }

  method lookup (Int() $age, :$raw = False) {
    my gint $a = $age;

    propReturnObject(
      clutter_damage_history_lookup($!mcdh, $age),
      $raw,
      cairo_region_t,
      Cairo::Region
    );
  }

  method record (cairo_region_t() $damage) {
    clutter_damage_history_record($!mcdh, $damage);
  }

  method step {
    clutter_damage_history_step($!mcdh);
  }

}
