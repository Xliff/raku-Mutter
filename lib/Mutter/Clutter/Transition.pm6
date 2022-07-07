use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Transition;

use Mutter::Clutter::Timeline;

use GLib::Roles::Implementor;

our subset MutterClutterTransitionAncestry is export of Mu
  where MutterClutterTransition | MutterClutterTimelineAncestry;

class Mutter::Clutter::Transition is Mutter::Clutter::Timeline {
  has MutterClutterTransition $!mct is implementor;

  submethod BUILD ( :$mutter-clutter-transition ) {
    self.setTransition($mutter-clutter-transition)
      if $mutter-clutter-transition;
  }

  method setMutterClutterTransition (MutterClutterTransitionAncestry $_) {
    my $to-parent;
    $!mct = do {
      when MutterClutterTransition {
        $to-parent = cast(MutterClutterTimeline, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTransition, $_);
      }
    }
    self.setMutterClutterTimeline($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterTransition
    is also<MutterClutterTransition>
  { $!mct }

  method new (
    MutterClutterTransitionAncestry  $mutter-clutter-transition,
                                    :$ref                        = True
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

  method remove_on_complete is rw is g-property is also<remove-on-complete> {
    Proxy.new:
      FETCH => -> $     { self.get_remove_on_complete    },
      STORE => -> $, \v { self.set_remove_on_complete(v) }
  }

  method get_animatable ( :$raw = False ) is also<get-animatable> {
    propReturnObject(
      clutter_transition_get_animatable($!mct),
      $raw,
      |Mutter::Clutter::Animation.getTypePair
    );
  }

  method get_interval ( :$raw = False ) is also<get-interval> {
    propReturnObject(
      clutter_transition_get_interval($!mct),
      $raw,
      |Mutter::Clutter::Interval.getTypePair
    );
  }

  method get_remove_on_complete is also<get-remove-on-complete> {
    so clutter_transition_get_remove_on_complete($!mct);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_transition_get_type, $n, $t );
  }

  method set_animatable (MutterClutterAnimatable() $animatable)
    is also<set-animatable>
  {
    clutter_transition_set_animatable($!mct, $animatable);
  }

  method set_from (Int() $value_type) is also<set-from> {
    my GType $v = $value_type;

    clutter_transition_set_from($!mct, $v);
  }

  method set_from_value (GValue() $value) is also<set-from-value> {
    clutter_transition_set_from_value($!mct, $value);
  }

  method set_interval (MutterClutterInterval() $interval)
    is also<set-interval>
  {
    clutter_transition_set_interval($!mct, $interval);
  }

  method set_remove_on_complete (Int() $remove_complete)
    is also<set-remove-on-complete>
  {
    my gboolean $r = $remove_complete.so.Int;

    clutter_transition_set_remove_on_complete($!mct, $r);
  }

  method set_to (Int() $value_type) is also<set-to> {
    my GType $v = $value_type;

    clutter_transition_set_to($!mct, $value_type);
  }

  method set_to_value (GValue() $value) is also<set-to-value> {
    clutter_transition_set_to_value($!mct, $value);
  }

}
