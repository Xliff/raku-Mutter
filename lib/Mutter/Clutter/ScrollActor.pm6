use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::ScrollActor;

#use Mutter::Clutter::Actor;

class Mutter::Clutter::ScrollActor { #is Mutter::Clutter::Actor {
  has MutterClutterScrollActor $mcsa is implementor;

  method new {
    my $mutter-clutter-scroll-actor = clutter_scroll_actor_new();

    $mutter-clutter-scroll-actor ?? self.bless( :$mutter-clutter-scroll-actor )
                                 !! Nil;
  }

  method get_scroll_mode {
    MutterClutterScrollModeEnum( clutter_scroll_actor_get_scroll_mode($!mcsa) )
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &clutter_scroll_actor_get_type, $n, $t );
  }

  method scroll_to_point (graphene_point_t() $point) {
    clutter_scroll_actor_scroll_to_point($!mcsa, $point);
  }

  method scroll_to_rect (graphene_rect_t() $rect) {
    clutter_scroll_actor_scroll_to_rect($!mcsa, $rect);
  }

  method set_scroll_mode (Int() $mode) {
    my MutterClutterScrollMode $m = $mode;

    clutter_scroll_actor_set_scroll_mode($!mcsa, $m);
  }

}
