use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Timeline;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterClutterTimelineAncestry is export of Mu
  where MutterClutterTimeline | GObject;

class Mutter::Clutter::Timeline {
  also does GLib::Roles::Object;

  has MutterClutterTimeline $!mctime is implementor;

  submethod BUILD ( :$mutter-clutter-timeline ) {
    self.setMutterClutterTimeline($mutter-clutter-timeline)
      if $mutter-clutter-timeline;
  }

  method setMutterClutterTimeline (MutterClutterTimelineAncestry $_) {
    my $to-parent;

    $!mctime = do {
      when MutterClutterTimeline {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTimeline, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterTimeline
    is also<MutterClutterTimeline>
  { $!mctime }

  multi method new (
    MutterClutterTimelineAncestry  $mutter-clutter-timeline
                                  :$ref                     = True
  ) {
    return unless $mutter-clutter-timeline;

    my $o = self.bless( :$mutter-clutter-timeline );
    $o.ref if $ref;
    $o;
  }

  method new_for_actor (MutterClutterActor() $actor, Int() $duration_ms)
    is also<new-for-actor>
  {
    my gint $d = $duration_ms;

    my $mutter-clutter-timeline = clutter_timeline_new_for_actor($actor, $d);

    $mutter-clutter-timeline ?? self.bless( :$mutter-clutter-timeline ) !! Nil;
  }

  method new_for_frame_clock (
    MutterClutterFrameClock() $frame_clock,
    Int()                     $duration_ms
  )
    is also<new-for-frame-clock>
  {
    my gint $d = $duration_ms;

    my $mutter-clutter-timeline = clutter_timeline_new_for_frame_clock(
      $frame_clock,
      $d
    );

    $mutter-clutter-timeline ?? self.bless( :$mutter-clutter-timeline ) !! Nil;
  }

  method actor is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_actor    },
      STORE => -> $, \v { self.set_actor(v) }
  }

  method auto_reverse is rw is g-property is also<auto-reverse> {
    Proxy.new:
      FETCH => -> $     { self.get_auto_reverse    },
      STORE => -> $, \v { self.set_auto_reverse(v) }
  }

  method cubic_bezier_progress is rw is g-property
    is also<cubic-bezier-progress>
  {
    Proxy.new:
      FETCH => -> $     { self.get_cubic_bezier_progress    },
      STORE => -> $, \v { self.set_cubic_bezier_progress(v) }
  }

  method delay is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_delay    },
      STORE => -> $, \v { self.set_delay(v) }
  }

  method direction is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_direction    },
      STORE => -> $, \v { self.set_direction(v) }
  }

  method duration is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_duration    },
      STORE => -> $, \v { self.set_duration(v) }
  }

  method frame_clock is rw is g-property is also<frame-clock> {
    Proxy.new:
      FETCH => -> $     { self.get_frame_clock    },
      STORE => -> $, \v { self.set_frame_clock(v) }
  }

  method progress_mode is rw is g-property is also<progress-mode> {
    Proxy.new:
      FETCH => -> $     { self.get_progress_mode    },
      STORE => -> $, \v { self.set_progress_mode(v) }
  }

  method repeat_count is rw is g-property is also<repeat-count> {
    Proxy.new:
      FETCH => -> $     { self.get_repeat_count    },
      STORE => -> $, \v { self.set_repeat_count(v) }
  }

  method step_progress is rw is g-property is also<step-progress> {
    Proxy.new:
      FETCH => -> $     { self.get_step_progress    },
      STORE => -> $, \v { self.set_step_progress(v) }
  }

  # Is originally:
  # ClutterTimeline, gpointer --> void
  method completed {
    self.connect($!mctime, 'completed');
  }

  # Is originally:
  # ClutterTimeline, Str, gint, gpointer -> void
  method marker-reached is also<marker_reached> {
    self.connect-strint($!mctime, 'marker-reached');
  }

  # Is originally:
  # ClutterTimeline, gint, gpointer --> void
  method new-frame is also<new_frame> {
    self.connect-int($!mctime, 'new-frame');
  }

  # Is originally:
  # ClutterTimeline, gpointer --> void
  method paused {
    self.connect($!mctime, 'paused');
  }

  # Is originally:
  # ClutterTimeline, gpointer --> void
  method started {
    self.connect($!mctime, 'started');
  }

  # Is originally:
  # ClutterTimeline, gboolean, gpointer --> void
  method stopped {
    self.connect-bool($!mctime, 'stopped');
  }

  method add_marker (Str() $marker_name, Num() $progress)
    is also<add-marker>
  {
    my gdouble $p = $progress;

    clutter_timeline_add_marker($!mctime, $marker_name, $p);
  }

  method add_marker_at_time (Str() $marker_name, Int() $msecs)
    is also<add-marker-at-time>
  {
    my guint $ms = $msecs;

    clutter_timeline_add_marker_at_time($!mctime, $marker_name, $ms);
  }

  method advance (Int() $msecs) {
    my guint $ms = $msecs;

    clutter_timeline_advance($!mctime, $ms);
  }

  method advance_to_marker (Str() $marker_name) is also<advance-to-marker> {
    clutter_timeline_advance_to_marker($!mctime, $marker_name);
  }

  method get_actor ( :$raw = False ) is also<get-actor> {
    propReturnObject(
      clutter_timeline_get_actor($!mctime),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_auto_reverse is also<get-auto-reverse> {
    so clutter_timeline_get_auto_reverse($!mctime);
  }

  method get_cubic_bezier_progress (
    graphene_point_t() $c_1,
    graphene_point_t() $c_2
  )
    is also<get-cubic-bezier-progress>
  {
    clutter_timeline_get_cubic_bezier_progress($!mctime, $c_1, $c_2);
  }

  method get_current_repeat is also<get-current-repeat> {
    clutter_timeline_get_current_repeat($!mctime);
  }

  method get_delay is also<get-delay> {
    clutter_timeline_get_delay($!mctime);
  }

  method get_delta is also<get-delta> {
    clutter_timeline_get_delta($!mctime);
  }

  method get_direction is also<get-direction> {
    clutter_timeline_get_direction($!mctime);
  }

  method get_duration is also<get-duration> {
    clutter_timeline_get_duration($!mctime);
  }

  method get_duration_hint is also<get-duration-hint> {
    clutter_timeline_get_duration_hint($!mctime);
  }

  method get_elapsed_time is also<get-elapsed-time> {
    clutter_timeline_get_elapsed_time($!mctime);
  }

  method get_frame_clock is also<get-frame-clock> {
    clutter_timeline_get_frame_clock($!mctime);
  }

  method get_progress is also<get-progress> {
    clutter_timeline_get_progress($!mctime);
  }

  method get_progress_mode is also<get-progress-mode> {
    clutter_timeline_get_progress_mode($!mctime);
  }

  method get_repeat_count is also<get-repeat-count> {
    clutter_timeline_get_repeat_count($!mctime);
  }

  proto method get_step_progress (|)
    is also<get-step-progress>
  { * }

  multi method get_step_progress {
    samewith($, $);
  }
  multi method get_step_progress ($n_steps is rw, $step_mode is rw) {
    my gint                  $n = 0;
    my MutterClutterStepMode $s = 0;

    clutter_timeline_get_step_progress($!mctime, $n, $s);
    ($n_steps, $step_mode) = ($n, $s);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &clutter_timeline_get_type, $n, $t );
  }

  method has_marker (Str() $marker_name) is also<has-marker> {
    so clutter_timeline_has_marker($!mctime, $marker_name);
  }

  method is_playing is also<is-playing> {
    so clutter_timeline_is_playing($!mctime);
  }

  method list_markers (Int() $msecs, Int() $n_markers) is also<list-markers> {
    my gint  $ms = $msecs;
    my gsize $nm = $n_markers;

    CStringArrayToArray( clutter_timeline_list_markers($!mctime, $ms, $nm) );
  }

  method pause {
    clutter_timeline_pause($!mctime);
  }

  method remove_marker (Str() $marker_name) is also<remove-marker> {
    clutter_timeline_remove_marker($!mctime, $marker_name);
  }

  method rewind {
    clutter_timeline_rewind($!mctime);
  }

  method set_actor (MutterClutterActor() $actor) is also<set-actor> {
    clutter_timeline_set_actor($!mctime, $actor);
  }

  method set_auto_reverse (Int() $reverse) is also<set-auto-reverse> {
    my gboolean $r = $reverse.so.Int;

    clutter_timeline_set_auto_reverse($!mctime, $r);
  }

  method set_cubic_bezier_progress (
    graphene_point_t() $c_1,
    graphene_point_t() $c_2
  )
    is also<set-cubic-bezier-progress>
  {
    clutter_timeline_set_cubic_bezier_progress($!mctime, $c_1, $c_2);
  }

  method set_delay (Int() $msecs) is also<set-delay> {
    my guint $m = $msecs;

    clutter_timeline_set_delay($!mctime, $m);
  }

  method set_direction (Int() $direction)
    is also<set-direction>
  {
    my MutterClutterTimelineDirection $d = $direction;

    clutter_timeline_set_direction($!mctime, Mutter);
  }

  method set_duration (Int() $msecs) is also<set-duration> {
    my guint $m = $msecs;

    clutter_timeline_set_duration($!mctime, $m);
  }

  method set_frame_clock (MutterClutterFrameClock() $frame_clock)
    is also<set-frame-clock>
  {
    clutter_timeline_set_frame_clock($!mctime, $frame_clock);
  }

  method set_progress_func (
             &func,
    gpointer $data   = gpointer,
             &notify = $DEFAULT-GDESTROY-NOTIFY
  )
    is also<set-progress-func>
  {
    clutter_timeline_set_progress_func($!mctime, &func, $data, &notify);
  }

  method set_progress_mode (Int() $mode) is also<set-progress-mode> {
    my MutterClutterAnimationMode $m = $mode;

    clutter_timeline_set_progress_mode($!mctime, $m);
  }

  method set_repeat_count (Int() $count) is also<set-repeat-count> {
    my gint $c = $count;

    clutter_timeline_set_repeat_count($!mctime, $c);
  }

  method set_step_progress (Int() $n_steps, Int() $step_mode)
    is also<set-step-progress>
  {
    my gint  $n = $n_steps;
    my guint $s = $step_mode;

    clutter_timeline_set_step_progress($!mctime, $n, $s);
  }

  method skip (Int() $msecs) {
    my guint $m = $msecs;

    clutter_timeline_skip($!mctime, $m);
  }

  method start {
    clutter_timeline_start($!mctime);
  }

  method stop {
    clutter_timeline_stop($!mctime);
  }

}
