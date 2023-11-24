use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Main;

use GLib::Roles::StaticClass;

class Mutter::Clutter::Main {
  also does GLib::Roles::StaticClass;

  method add_debug_flags (MutterClutterDebugFlag $debug_flags, MutterClutterDrawDebugFlag $draw_flags, MutterClutterPickDebugFlag $pick_flags) {
    clutter_add_debug_flags($debug_flags, $draw_flags, $pick_flags);
  }

  method debug_set_max_render_time_constant (gint $max_render_time_constant_us) {
    clutter_debug_set_max_render_time_constant($max_render_time_constant_us);
  }

  method disable_accessibility {
    clutter_disable_accessibility();
  }

  method do_event (MutterClutterEvent $event) {
    clutter_do_event($event);
  }

  method get_accessibility_enabled {
    clutter_get_accessibility_enabled();
  }

  method get_default_text_direction {
    clutter_get_default_text_direction();
  }

  method get_font_map ( :$raw = False ) {
    propReturnObject(
      clutter_get_font_map(),
      $raw,
      |Pango::FontMap.getTypePair
    );
  }

  method is-rtl {
    ::?CLASS.get-default-text-direction === CLUTTER_TEXT_DIRECTION_RTL
  }

  method remove_debug_flags (
    Int() $debug_flags,
    Int() $draw_flags,
    Int() $pick_flags
  ) {
    my MutterClutterDebugFlag     $db = $debug_flags;
    my MutterClutterDrawDebugFlag $dr = $draw_flags;
    my MutterClutterPickDebugFlag $pf = $pick_flags;

    clutter_remove_debug_flags($db, $dr, $pf);
  }

}
