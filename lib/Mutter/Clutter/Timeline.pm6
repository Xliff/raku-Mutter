se v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Timeline;

use GLib::Roles::Object;

our subset MutterClutterTimelineAncestry is export of Mu
  where MutterClutterTimeline | GObject;

class Mutter::Clutter::Timeline {
  also does GLib::Roles::Object;

  has MutterClutterTimeline $!mct is implementor;

  submethod BUILD ( :$mutter-clutter-timeline ) {
    self.setMutterClutterTimeline($mutter-clutter-timeline)
      if $mutter-clutter-timeline;
  }

  method setMutterClutterTimeline (MutterClutterTimelineAncestry $_) {
    my $to-parent;
    $!ctime = do {
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
  { $!mct }

  multi method new (
    MutterClutterTimelineAncestry  $mutter-clutter-timeline
                                  :$ref                     = True
  ) {
    return unless $mutter-clutter-timeline;

    my $o = self.bless( :$mutter-clutter-timeline );
    $o.ref if $ref;
    $o;
  }

  method new_for_actor (ClutterActor() $actor, Int() $duration_ms) {
    my gint $d = $duration_ms;

    my $mutter-clutter-timeline = clutter_timeline_new_for_actor($actor, $d);

    $mutter-clutter-timeline ?? self.bless( :$mutter-clutter-timeline ) !! Nil;
  }

  method new_for_frame_clock (
    ClutterFrameClock() $frame_clock,
    Int() $duration_ms
  ) {
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

  method auto_reverse is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_auto_reverse    },
      STORE => -> $, \v { self.set_auto_reverse(v) }
  }

  method cubic_bezier_progress is rw is g-property {
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

  method frame_clock is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_frame_clock    },
      STORE => -> $, \v { self.set_frame_clock(v) }
  }

  method progress_mode is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_progress_mode    },
      STORE => -> $, \v { self.set_progress_mode(v) }
  }

  method repeat_count is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_repeat_count    },
      STORE => -> $, \v { self.set_repeat_count(v) }
  }

  method step_progress is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_step_progress    },
      STORE => -> $, \v { self.set_step_progress(v) }
  }

  # Is originally:
  # ClutterTimeline, gpointer --> void
  method completed {
    self.connect($!ctime, 'completed');
  }

  # Is originally:
  # ClutterTimeline, Str, gint, gpointer -> void
  method marker-reached is also<marker_reached> {
    self.connect-strint($!ctime, 'marker-reached');
  }

  # Is originally:
  # ClutterTimeline, gint, gpointer --> void
  method new-frame is also<new_frame> {
    self.connect-int($!ctime, 'new-frame');
  }

  # Is originally:
  # ClutterTimeline, gpointer --> void
  method paused {
    self.connect($!ctime, 'paused');
  }

  # Is originally:
  # ClutterTimeline, gpointer --> void
  method started {
    self.connect($!ctime, 'started');
  }

  # Is originally:
  # ClutterTimeline, gboolean, gpointer --> void
  method stopped {
    self.connect-bool($!ctime, 'stopped');
  }

  method add_marker ((Str() $marker_name, Num() $progress)
    is also<add-marker>
  {
    my gdouble $p = $progress;

    clutter_timeline_add_marker($!mct, $marker_name, $p);
  }

  method add_marker_at_time (Str() $marker_name, Int() $msecs)
    is also<add-marker-at-time>
  {
    my guint $ms = $msecs;

    clutter_timeline_add_marker_at_time($!mct, $marker_name, $ms);
  }

  method advance (Int() $msecs) {
    my guint $ms = $msecs;

    clutter_timeline_advance($!mct, $ms);
  }

  method advance_to_marker (Str() $marker_name) is also<advance-to-marker> {
    clutter_timeline_advance_to_marker($!mct, $marker_name);
  }

  method get_actor ( :$raw = False ) {
    propReturnObject(
      clutter_timeline_get_actor($!mct),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_auto_reverse {
    so clutter_timeline_get_auto_reverse($!mct);
  }

  method get_cubic_bezier_progress (
    graphene_point_t() $c_1,
    graphene_point_t() $c_2
  ) {
    clutter_timeline_get_cubic_bezier_progress($!mct, $c_1, $c_2);
  }

  method get_current_repeat {
    clutter_timeline_get_current_repeat($!mct);
  }

  method get_delay {
    clutter_timeline_get_delay($!mct);
  }

  method get_delta {
    clutter_timeline_get_delta($!mct);
  }

  method get_direction {
    clutter_timeline_get_direction($!mct);
  }

  method get_duration {
    clutter_timeline_get_duration($!mct);
  }

  method get_duration_hint {
    clutter_timeline_get_duration_hint($!mct);
  }

  method get_elapsed_time {
    clutter_timeline_get_elapsed_time($!mct);
  }

  method get_frame_clock {
    clutter_timeline_get_frame_clock($!mct);
  }

  method get_progress {
    clutter_timeline_get_progress($!mct);
  }

  method get_progress_mode {
    clutter_timeline_get_progress_mode($!mct);
  }

  method get_repeat_count {
    clutter_timeline_get_repeat_count($!mct);
  }

  proto method get_step_progress (|) {
  { * }

  method get_step_progress {
    samewith($, $);
  }
  method get_step_progress ($n_steps is rw, $step_mode is rw) {
    my gint            $n = 0;
    my ClutterStepMode $s = 0;

    clutter_timeline_get_step_progress($!mct, $n, $s);
    ($n_steps, $step_mode) = ($n, $s);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &clutter_timeline_get_type, $n, $t );
  }

  method has_marker (Str() $marker_name) {
    so clutter_timeline_has_marker($!mct, $marker_name);
  }

  method is_playing {
    so clutter_timeline_is_playing($!mct);
  }

  method list_markers (Int() $msecs, Int() $n_markers) is also<list-markers> {
    my guint $ms = $msecs;
    my gsize $nm = $n_markers;

    CStringArrayToArray( clutter_timeline_list_markers($!ctime, $ms, $nm) );
  }

  method pause {
    clutter_timeline_pause($!mct);
  }

  method remove_marker (Str() $marker_name) is also<remove-marker> {
    clutter_timeline_remove_marker($!mct, $marker_name);
  }

  method rewind {
    clutter_timeline_rewind($!mct);
  }

  method set_actor (ClutterActor() $actor) {
    clutter_timeline_set_actor($!mct, $actor);
  }

  method set_auto_reverse (Inta() $reverse) {
    my gboolean $r = $reverse.so.Int;

    clutter_timeline_set_auto_reverse($!mct, $r);
  }

  method set_cubic_bezier_progress (
    graphene_point_t() $c_1,
    graphene_point_t() $c_2
  ) {
    clutter_timeline_set_cubic_bezier_progress($!mct, $c_1, $c_2);
  }

  method set_delay (Int() $msecs) {
    my guint $m = $msecs;

    clutter_timeline_set_delay($!mct, $m);
  }

  method set_direction (ClutterTimelineDirection $direction) {
    clutter_timeline_set_direction($!mct, $direction);
  }

  method set_duration (Int() $msecs) {
    my guint $m = $msecs;

    clutter_timeline_set_duration($!mct, $m);
  }

  method set_frame_clock (ClutterFrameClock() $frame_clock) {
    clutter_timeline_set_frame_clock($!mct, $frame_clock);
  }

  method set_progress_func (
             &func,
    gpointer $data   = gpointer,
             &notify = $DEFAULT-GDESTROY-NOTIFY
  ) {
    clutter_timeline_set_progress_func($!mct, &func, $data, &notify);
  }

  method set_progress_mode (Int() $mode) {
    my ClutterAnimationMode $m = $mode;

    clutter_timeline_set_progress_mode($!mct, $m);
  }

  method set_repeat_count (Int() $count) {
    my gint $c = $count;

    clutter_timeline_set_repeat_count($!mct, $c);
  }

  method set_step_progress (Int() $n_steps, Int() $step_mode)
    is also<set-step-progress>
  {
    my gint  $n = $n_steps;
    my guint $s = $step_mode;

    clutter_timeline_set_step_progress($!mct, $n, $s);
  }

  method skip (Int() $msecs) {
    my guint $m = $m;

    clutter_timeline_skip($!mct, $m);
  }

  method start {
    clutter_timeline_start($!mct);
  }

  method stop {
    clutter_timeline_stop($!mct);
  }

}
