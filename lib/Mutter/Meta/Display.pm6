use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Display;

use GLib::GList;
use GLib::GSList;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use Mutter::Meta::Roles::Signals::Display;

# NEEDS REFRESH GOING TO MUTTER-14!

our subset MutterMetaDisplayAncestry is export of Mu
  where MutterMetaDisplay | GObject;

class Mutter::Meta::Display {
  also does GLib::Roles::Object;
  also does Mutter::Meta::Roles::Signals::Display;

  has MutterMetaDisplay $!md is implementor;

  method accelerator-activated {
    $.connect-accelerator-activated($!md);
  }

  method metawindow {
    $.connect-metawindow($!md);
  }

  method closing {
    $.connect($!md, 'closing');
  }

  method cursor-updated {
    $.connect($!md, 'cursor-updated');
  }

  method gl-video-memory-purged {
    $.connect($!md, 'gl-video-memory-purged');
  }

  method grab-op-begin {
    $.connect-grab-op($!md, 'grab-op-begin');
  }

  method grab-op-end {
    $.connect-grab-op($!md, 'grab-op-end');
  }

  method init-xserver {
    $.connect-init-xserver($!md);
  }

  method in-fullscreen-changed {
    $.connect($!md, 'in-fullscreen-changed');
  }

  method modifiers-accelerator-activated {
    $.connect-rbool($!md, 'modifiers-accelerator-activated');
  }

  method overlay-key {
    $.connect($!md, 'overlay-key');
  }

  method pad-mode-switch {
    $.connect-pad-mode-switch($!md);
  }

  method restacked {
    $.connect($!md, 'restacked');
  }

  method restart {
    $.connect-rbool($!md, 'restart');
  }

  method show-osd {
    $.connect-show-osd($!md);
  }

  method show-osd-pad {
    $.connect-show-osd-pad($!md);
  }

  method show-resize-popup {
    $.connect-show-resize-popup($!md);
  }

  method showing-desktop-changed {
    $.connect($!md, 'showing-desktop-changed');
  }

  method window-demands-attention {
    $.connect-metawindow($!md, 'window-demands-attention')
  }

  method window-entered-monitor {
    $.connect-metawindow-event($!md, 'window-entered-monitor');
  }

  method window-left-monitor {
    $.connect-metawindow-event($!md, 'window-left-monitor');
  }

  method window-marked-urgent {
    $.connect-metawindow($!md, 'window-marked-urgent')
  }

  method window-visibility-updated {
    $.connect-window-visibility-updated($!md);
  }

  method workareas-changed {
    $.connect($!md, 'workareas-changed');
  }

  method x11-display-closing {
    $.connect($!md, 'x11-display-closing');
  }

  method x11-display-opened {
    $.connect($!md, 'x11-display-opened');
  }

  method x11-display-setup {
    $.connect($!md, 'x11-display-setup');
  }

  method add_ignored_crossing_serial {
    meta_display_add_ignored_crossing_serial($!md);
  }

  method add_keybinding (
    Str()       $name,
    GSettings() $settings,
    Int()       $flags,
                &handler,
    gpointer    $user_data = gpointer,
                &free_data = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    my MutterMetaKeyBindingFlags $f = $flags;

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
    MutterMetaWindow() $win,
    Int()              $op,
    Int()              $pointer_already_grabbed,
    Int()              $frame_action,
    Int()              $button,
    Int()              $modmask,
    Int()              $timestamp,
    Int()              $root_x,
    Int()              $root_y
  ) {
    my MutterMetaGrabOp $o = $op;
    my gboolean         $p = $pointer_already_grabbed.so.Int;
    my gboolean         $f = $frame_action.so.Int;
    my gulong           $m = $modmask;
    my guint32          $t = $timestamp;

    my gint ($b, $rx, $ry) = ($button, $root_x, $root_y);

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

  method get_monitor_geometry (
    Int()          $monitor,
    MtkRectangle() $geometry
  ) {
    my gint $m = $monitor;

    meta_display_get_monitor_geometry($!md, $m, $geometry);
  }

  method get_monitor_in_fullscreen (Int() $monitor) {
    my gint $m = $monitor;

    meta_display_get_monitor_in_fullscreen($!md, $monitor);
  }

  method get_monitor_index_for_rect (MtkRectangle() $rect) {
    meta_display_get_monitor_index_for_rect($!md, $rect);
  }

  method get_monitor_neighbor_index (Int() $which_monitor, Int() $dir) {
    my gint                       $w = $which_monitor;
    my MutterMetaDisplayDirection $d = $dir;

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
    MutterClutterInputDevice() $pad,
    Int()                      $action_type,
    Int()                      $action_number
  ) {
    my guint                   $a  = $action_number;
    my MutterMetaPadActionType $ac = $action_type;

    meta_display_get_pad_action_label($!md, $pad, $ac, $a);
  }

  method get_primary_monitor {
    meta_display_get_primary_monitor($!md);
  }

  method get_selection {
    meta_display_get_selection($!md);
  }

  proto method get_size (|)
  { * }

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

  method get_tab_current (
    MutterMetaTabList()   $type,
    MutterMetaWorkspace() $workspace
  ) {
    meta_display_get_tab_current($!md, $type, $workspace);
  }

  method get_tab_list (
    MutterMetaTabList()    $type,
    MutterMetaWorkspace()  $workspace,
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
    MutterMetaTabList()    $type,
    MutterMetaWorkspace()  $workspace,
    MutterMetaWindow()     $window,
    Int()                  $backward,
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
    my MutterMetaKeyBindingFlags $f = $flags;

    meta_display_grab_accelerator($!md, $accelerator, $flags);
  }

  method is_pointer_emulating_sequence (MutterClutterEventSequence() $sequence) {
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

  method request_pad_osd (MutterClutterInputDevice() $pad, Int() $edition_mode) {
    my gboolean $e = $edition_mode.so.Int;

    meta_display_request_pad_osd($!md, $pad, $e);
  }

  method set_cursor (MutterMetaCursor() $cursor) {
    meta_display_set_cursor($!md, $cursor);
  }

  method set_input_focus (
    MutterMetaWindow() $window,
    Int()              $focus_frame,
    Int()              $timestamp
  ) {
    my gboolean $f = $focus_frame;
    my guint32  $t = $timestamp;

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

  # Compositor Mutter

  method disable_unredirect_for_display {
    meta_disable_unredirect_for_display($!md);
  }

  method enable_unredirect_for_display {
    meta_enable_unredirect_for_display($!md);
  }

  method focus_stage_window (guint32 $timestamp) {
    meta_focus_stage_window($!md, $timestamp);
  }

  method get_feedback_group_for_display ( :$raw = False ) {
    propReturnObject(
      meta_get_feedback_group_for_display($!md),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    )
  }

  method get_stage_for_display ( :$raw = False ) {
    propReturnObject(
      meta_get_stage_for_display($!md),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_top_window_group_for_display ( :$raw = False ) {
    propReturnObject(
      meta_get_top_window_group_for_display($!md),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_window_actors ( :$raw = False, :$glist = False ) {
    returnGList(
      meta_get_window_actors($!md),
      $raw,
      $glist,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_window_group_for_display ( :$raw = False ) {
    propReturnObject(
      meta_get_window_group_for_display($!md),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method stage_is_focused {
    so meta_stage_is_focused($!md);
  }

}
