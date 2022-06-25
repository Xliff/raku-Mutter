use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Transition;

use Mutter::Clutter::Timeline;

our subset MutterClutterTransitionAncestry is export of Mu
  where MutterClutterTransition | MutterClutterTimelineAncestry;

class Mutter::Clutter::Transition is Clutter::Timeline {
  has MutterClutterTransition $!mct is implementor;

  submethod BUILD ( :$mutter-clutter-transition ) {
    self.setTransition($mutter-clutter-transition)
      if $mutter-clutter-transition;
  }

  method setMutterClutterTransition (MutterClutterTransitionAncestry $_) {
    my $to-parent;
    $!mct = do {
      when MutterClutterTransition {
        $to-parent = cast(ClutterTimeline, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTimeline, $_);
      }
    }
    self.setMutterClutterTimeline($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterTransition
    is also<MutterClutterTransition>
  { $!mct }

  method new (
    MutterClutterTransitionAncestry  $transition,
                                    :$ref         = True
  ) {
    return unless $mutter-clutter-transition;

    my $o = self.bless( :$mutter-clutter-transition );
    $o.ref if $ref;
    $o;
  }

  method animatable ( :$raw = False ) is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_animatable( :$raw ) },
      STORE => -> $, \v { self.set_animatable(v)       }
  }

  method interval ( :$raw = False ) is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_interval( :$raw ) },
      STORE => -> $, \v { self.set_interval(v)       }
  }

  method remove_on_complete is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_remove_on_complete    },
      STORE => -> $, \v { self.set_remove_on_complete(v) }
  }

  method get_animatable ( :$raw = False ) {
    propReturnObject(
      clutter_transition_get_animatable($!mct),
      $raw,
      |Mutter::Clutter::Animation.getTypePair
    );
  }

  method get_interval ( :$raw = False ) {
    propReturnObject(
      clutter_transition_get_interval($!mct),
      $raw,
      |Mutter::Clutter::Interval.getTypePair
    );
  }

  method get_remove_on_complete {
    so clutter_transition_get_remove_on_complete($!mct);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_transition_get_type, $n, $t );
  }

  method set_animatable (ClutterAnimatable)_ $animatable) {
    clutter_transition_set_animatable($!mct, $animatable);
  }

  method set_from (Int() $value_type) {
    my GType $v = $value_type;

    clutter_transition_set_from($!mct, $v);
  }

  method set_from_value (GValue() $value) {
    clutter_transition_set_from_value($!mct, $value);
  }

  method set_interval (ClutterInterval)_ $interval) {
    clutter_transition_set_interval($!mct, $interval);
  }

  method set_remove_on_complete (Int() $remove_complete) {
    my gboolean $r = $remove_complete.so.Int;

    clutter_transition_set_remove_on_complete($!mct, $r);
  }

  method set_to (Int() $value_type) {
    my GType $v = $value_type;

    clutter_transition_set_to($!mct, $value_type);
  }

  method set_to_value (GValue() $value) {
    clutter_transition_set_to_value($!mct, $value);
  }

}
