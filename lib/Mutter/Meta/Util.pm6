use v6.c;

use Mutter::Raw::Types;
use Mutter::Meta::Raw::Util;

use GLib::Roles::StaticClass;

class Mutter::Meta::Util {
  also does GLib::Roles::StaticClass;

  method add_clutter_debug_flags (
    Int() $debug_flags,
    Int() $draw_flags,
    Int() $pick_flags
  ) {
    my ClutterDebugFlag     $de = $debug_flags;
    my ClutterDrawDebugFlag $dr = $draw_flags;
    my ClutterPickDebugFlag $pi = $pick_flags;

    meta_add_clutter_debug_flags($de, $dr, $pi);
  }

  method add_debug_paint_flag (Int() $flag) {
    my MetaDebugPaintFlag $f = $flag;

    meta_add_debug_paint_flag($f);
  }

  method add_verbose_topic (Int() $topic) {
    my MetaDebugTopic $t = $topic;

    meta_add_verbose_topic($t);
  }

  method bug (Str() $format) {
    meta_bug($format);
  }

  method external_binding_name_for_action (Int() $keybinding_action) {
    my guint $k = $keybinding_action;

    meta_external_binding_name_for_action($k);
  }

  method fatal (Str() $format) {
    meta_fatal($format);
  }

  method frame_type_to_string (Int() $type) {
    my MetaFrameType $t = $type;

    meta_frame_type_to_string($t);
  }

  method g_utf8_strndup (Str() $src, Int() $n) {
    my gsize $nn = $n;

    meta_g_utf8_strndup($src, $nn);
  }

  method get_clutter_debug_flags (
    Int() $debug_flags,
    Int() $draw_flags,
    Int() $pick_flags
  ) {
    my ClutterDebugFlag     $de = $debug_flags;
    my ClutterDrawDebugFlag $dr = $draw_flags;
    my ClutterPickDebugFlag $pi = $pick_flags;

    meta_get_clutter_debug_flags($de, $dr, $pi);
  }

  method get_debug_paint_flags {
    meta_get_debug_paint_flags();
  }

  method get_locale_direction {
    meta_get_locale_direction();
  }

  method gravity_to_string (Int() $gravity) {
    my MetaGravity $g = $gravity;

    meta_gravity_to_string($g);
  }

  method is_syncing {
    so meta_is_syncing();
  }

  method is_topic_enabled (Int() $topic) {
    my MetaDebugTopic $t = $topic;

    so meta_is_topic_enabled($t);
  }

  method is_verbose {
    so meta_is_verbose();
  }

  method is_wayland_compositor {
    meta_is_wayland_compositor();
  }

  method pop_no_msg_prefix {
    so meta_pop_no_msg_prefix();
  }

  method push_no_msg_prefix {
    meta_push_no_msg_prefix();
  }

  method remove_clutter_debug_flags (
    Int() $debug_flags,
    Int() $draw_flags,
    Int() $pick_flags
  ) {
    my ClutterDebugFlag     $de = $debug_flags;
    my ClutterDrawDebugFlag $dr = $draw_flags;
    my ClutterPickDebugFlag $pi = $pick_flags;

    meta_remove_clutter_debug_flags($de, $dr, $pi);
  }

  method remove_debug_paint_flag (Int() $flag) {
    my MetaDebugPaintFlag $f = $flag;

    meta_remove_debug_paint_flag($f);
  }

  method remove_verbose_topic (Int() $topic) {
    my MetaDebugTopic $t = $topic;

    meta_remove_verbose_topic($t);
  }

  method show_dialog (
    Str()    $type,
    Str()    $message,
    Str()    $timeout,
    Str()    $display,
    Str()    $ok_text,
    Str()    $cancel_text,
    Str()    $icon_name,
    Int()    $transient_for,
    GSList() $columns,
    GSList() $entries
  ) {
    my gint $t = $transient_for;

    meta_show_dialog(
      $type,
      $message,
      $timeout,
      $display,
      $ok_text,
      $cancel_text,
      $icon_name,
      $t,
      $columns,
      $entries
    );
  }

  method topic_to_string (Int() $topic) {
    my MetaDebugTopic $t = $topic;

    meta_topic_to_string($t);
  }

  proto method unsigned_long_equal (|)
  { * }

  multi method unsigned_long_equal (Int $v1, Int $v2) {
    my ($vv1, $vv2) = CArray[gulong].new xx 2;
    ($vv1, $vv2)».[0] = ($v1, $v2);
    samewith($vv1, $vv2);
  }
  multi method unsigned_long_equal (CArray[gulong] $v1, CArray[gulong] $v2) {
    meta_unsigned_long_equal($v1, $v2);
  }

  proto method unsigned_long_hash (|)

  multi method unsigned_long_hash (Int $v) {
    (my $vv = CArray[gulong].new)[0] = $v;
    samewith($vv);
  }
  multi method unsigned_long_hash (CArray[glong] $v) {
    meta_unsigned_long_hash($v);
  }

  method warning (Str() $format) {
    meta_warning($format);
  }
  
}
