use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PageTurnEffect;

class Mutter::Clutter::PageTurnEffect {
  has MutterClutterPageTurnEffect $!mcpte is implementor;

  method new (Num() $angle, Num() $radius) {
    my gdouble ($a, $r) = ($angle, $radius);

    my $mutter-clutter-page-turn-effect = clutter_page_turn_effect_new(
      $!mcpte,
      $a,
      $r
    );

    $mutter-clutter-page-turn-effect
      ?? self.bless( :$mutter-clutter-page-turn-effect )
      !! Nil;
  }

  method get_angle {
    clutter_page_turn_effect_get_angle($!mcpte);
  }

  method get_period {
    clutter_page_turn_effect_get_period($!mcpte);
  }

  method get_radius {
    clutter_page_turn_effect_get_radius($!mcpte);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_page_turn_effect_get_type,
      $n,
      $t
    );
  }

  method set_angle (Num() $angle) {
    my gdouble $a = $angle;
    clutter_page_turn_effect_set_angle($!mcpte, $angle);
  }

  method set_period (Num() $period) {
    my gdouble $p = $period;

    clutter_page_turn_effect_set_period($!mcpte, $period);
  }

  method set_radius (Num() $radius) {
    my gfloat $r = $radius;

    clutter_page_turn_effect_set_radius($!mcpte, $radius);
  }
}
