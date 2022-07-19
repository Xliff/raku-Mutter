use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::FrameClock;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

class Mutter::Clutter::FrameClock {
  also does GLib::Roles::Object;

  has MutterClutterFrameClock $!mcfc is implementor;

  method new (
    Int()                             $vblank_duration_us,
    MutterClutterFrameListenerIface() $iface,
    gpointer                          $user_data           = gpointer
  ) {
    my gint64_t $v = $vblank_duration_us;

    my $mutter-clutter-frame-clock = clutter_frame_clock_new(
      $v,
      $iface,
      $user_data
    );

    $mutter-clutter-frame-clock ?? self.bless( :$mutter-clutter-frame-clock )
                                !! Nil;
  }

  method add_timeline (MutterClutterTimeline() $timeline) {
    clutter_frame_clock_add_timeline($!mcfc, $timeline);
  }

  method destroy {
    clutter_frame_clock_destroy($!mcfc);
  }

  method get_max_render_time_debug_info ( :$raw = False ) {
    propReturnObject(
      clutter_frame_clock_get_max_render_time_debug_info($!mcfc),
      $raw,
      |GLib::String.getTypePair
    );
  }

  method get_refresh_rate {
    clutter_frame_clock_get_refresh_rate($!mcfc);
  }

  method inhibit {
    clutter_frame_clock_inhibit($!mcfc);
  }

  method notify_presented (MutterClutterFrameInfo() $frame_info) {
    clutter_frame_clock_notify_presented($!mcfc, $frame_info);
  }

  method notify_ready {
    clutter_frame_clock_notify_ready($!mcfc);
  }

  method record_flip (Int() $flip_time_us, Int() $hints) {
    my gint64_t               $f = $flip_time_us;
    my MutterClutterFrameHint $h = $hints;

    clutter_frame_clock_record_flip($!mcfc, $f, $h);
  }

  method remove_timeline (MutterClutterTimeline() $timeline) {
    clutter_frame_clock_remove_timeline($!mcfc, $timeline);
  }

  method schedule_update {
    clutter_frame_clock_schedule_update($!mcfc);
  }

  method schedule_update_now {
    clutter_frame_clock_schedule_update_now($!mcfc);
  }

  method uninhibit {
    clutter_frame_clock_uninhibit($!mcfc);
  }
}
