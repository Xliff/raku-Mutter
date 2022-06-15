use v6.c;

use Mutter::Raw::Types;
use Mutter::Meta::Raw::Display;

use GLib::GList;
use GLib::GSList;

use GLib::Roles::Object;

our subset MetaDisplayAncestry is export of Mu
  where MetaDisplay | GObject;

class Mutter::Meta::Display {
  also does GLib::Roles::Object;

  has MetaDisplay $!md is implementor;

  method add_ignored_crossing_serial {
    meta_display_add_ignored_crossing_serial($!md);
  }

  method add_keybinding (
    Str()       $name,
    GSettings() $settings,
    Int()       $flags,
                &handler,
    gpointer    $user_data = gpointer,
                &free_data = $DEFAULT-GDESTROYNOTIFY
  ) {
    my MetaKeyBindingFlags $f = $flags;

    meta_display_add_keybinding(
      $!md,
      $name,
      $settings,
      $flags,
      &handler,
      $user_data,
      &free_data
    );
  }

  method begin_grab_op (
    MetaWindow() $win,
    Int() $op,
    Int() $pointer_already_grabbed,
    Int() $frame_action,
    Int() $button,
    Int() $modmask,
    Int() $timestamp,
    Int() $root_x,
    Int() $root_y
  ) {
    my MetaGrabOp $o            = $op;
    my gboolean   $p            = $pointer_already_grabbed.so.Int;
    my gboolean   $f            = $frame_action.so.Int;
    my gulong     $m            = $modmask;
    my guint32    $t            = $timestamp;
    my gint      ($b, $rx, $ry) = ($button, $root_x, $root_y);

    meta_display_begin_grab_op($!md, $win, $o, $p, $f, $b, $m, $t, $rx, $ry);
  }

  method clear_mouse_mode {
    meta_display_clear_mouse_mode($!md);
  }

  method close (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_close($!md, $t);
  }

  method end_grab_op (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_end_grab_op($!md, $t);
  }

  method focus_default_window (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_focus_default_window($!md, $t);
  }

  method freeze_keyboard (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_freeze_keyboard($!md, $t);
  }

  method get_compositor {
    meta_display_get_compositor($!md);
  }

  method get_compositor_modifiers {
    meta_display_get_compositor_modifiers($!md);
  }

  method get_context {
    meta_display_get_context($!md);
  }

  method get_current_monitor {
    meta_display_get_current_monitor($!md);
  }

  method get_current_time {
    meta_display_get_current_time($!md);
  }

  method get_current_time_roundtrip {
    meta_display_get_current_time_roundtrip($!md);
  }

  method get_focus_window {
    meta_display_get_focus_window($!md);
  }

  method get_grab_op {
    meta_display_get_grab_op($!md);
  }

  method get_keybinding_action (Int() $keycode) {
    my gint $k = $keycode;

    meta_display_get_keybinding_action($!md, $k);
  }

  method get_last_user_time {
    meta_display_get_last_user_time($!md);
  }

  method get_monitor_geometry (Int() $monitor, MetaRectangle() $geometry) {
    my gint $m = $monitor;

    meta_display_get_monitor_geometry($!md, $m, $geometry);
  }

  method get_monitor_in_fullscreen (Int() $monitor) {
    my gint $m = $monitor;

    meta_display_get_monitor_in_fullscreen($!md, $monitor);
  }

  method get_monitor_index_for_rect (MetaRectangle() $rect) {
    meta_display_get_monitor_index_for_rect($!md, $rect);
  }

  method get_monitor_neighbor_index (Int() $which_monitor, Int() $dir) {
    my gint                 $w = $which_monitor;
    my MetaDisplayDirection $d = $dir;

    meta_display_get_monitor_neighbor_index($!md, $w, $d);
  }

  method get_monitor_scale (Int() $monitor) {
    my gint $m = $monitor;

    meta_display_get_monitor_scale($!md, $m);
  }

  method get_n_monitors {
    meta_display_get_n_monitors($!md);
  }

  method get_pad_action_label (
    ClutterInputDevice() $pad,
    Int()                $action_type,
    Int()                $action_number
  ) {
    my guint             $a  = $action_number;
    my MetaPadActionType $ac = $action_type;

    meta_display_get_pad_action_label($!md, $pad, $ac, $a);
  }

  method get_primary_monitor {
    meta_display_get_primary_monitor($!md);
  }

  method get_selection {
    meta_display_get_selection($!md);
  }

  proto method get_size (|)

  multi method get_size {
    samewith($, $);
  }
  multi method get_size ($width is rw, $height is rw) {
    my gint ($w, $h) = 0 xx 2;

    meta_display_get_size($!md, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_sound_player {
    meta_display_get_sound_player($!md);
  }

  method get_startup_notification {
    meta_display_get_startup_notification($!md);
  }

  method get_tab_current (MetaTabList() $type, MetaWorkspace() $workspace) {
    meta_display_get_tab_current($!md, $type, $workspace);
  }

  method get_tab_list (
    MetaTabList()    $type,
    MetaWorkspace()  $workspace,
                    :$raw        = False,
                    :$glist      = False
  ) {
    returnGList(
      meta_display_get_tab_list($!md, $type, $workspace),
      $raw,
      $glist,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method get_tab_next (
    MetaTabList()    $type,
    MetaWorkspace()  $workspace,
    MetaWindow()     $window,
    Int()            $backward,
                    :$raw        = False
  ) {
    my gboolean $b = $backward.so.Int;

    propReturnObject(
      meta_display_get_tab_next($!md, $type, $workspace, $window, $b),
      $raw,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_display_get_type, $n, $t );
  }

  method get_workspace_manager {
    meta_display_get_workspace_manager($!md);
  }

  method get_x11_display {
    meta_display_get_x11_display($!md);
  }

  method grab_accelerator (Str() $accelerator, Int() $flags) {
    my MetaKeyBindingFlags $f = $flags;

    meta_display_grab_accelerator($!md, $accelerator, $flags);
  }

  method is_pointer_emulating_sequence (ClutterEventSequence() $sequence) {
    meta_display_is_pointer_emulating_sequence($!md, $sequence);
  }

  method list_all_windows ( :$raw = False, :$glist = False ) {
    returnGList(
      meta_display_list_all_windows($!md),
      $raw,
      $glist,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method remove_keybinding (Str() $name) {
    meta_display_remove_keybinding($!md, $name);
  }

  method request_pad_osd (ClutterInputDevice() $pad, Int() $edition_mode) {
    my gboolean $e = $edition_mode.so.Int;

    meta_display_request_pad_osd($!md, $pad, $e);
  }

  method set_cursor (MetaCursor() $cursor) {
    meta_display_set_cursor($!md, $cursor);
  }

  method set_input_focus (
    MetaWindow() $window,
    Int()        $focus_frame,
    Int()        $timestamp
  ) {
    my gboolean $f = $focus_frame;
    my guint32  $t = $timestamp

    meta_display_set_input_focus($!md, $window, $f, $t);
  }

  method sort_windows_by_stacking (
    GSList()  $windows,
             :$raw       = False,
             :$glist     = False
  ) {
    returnGSList(
      meta_display_sort_windows_by_stacking($!md, $windows),
      $raw,
      $glist,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method supports_extended_barriers {
    so meta_display_supports_extended_barriers($!md);
  }

  method unfreeze_keyboard (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_unfreeze_keyboard($!md, $t);
  }

  method ungrab_accelerator (Int() $action_id) {
    my guint $a = $action_id;

    meta_display_ungrab_accelerator($!md, $action_id);
  }

  method ungrab_keyboard (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_ungrab_keyboard($!md, $t);
  }

  method unset_input_focus (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_display_unset_input_focus($!md, $t);
  }

  method xserver_time_is_before (Int() $time1, Int() $time2) {
    my guint32 ($t1, $t2) = ($time1, $time2);

    meta_display_xserver_time_is_before($!md, $t1, $t2);
  }

}
