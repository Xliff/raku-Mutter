use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Window;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

class Mutter::Meta::Window {
  also does GLib::Roles::Object;

  has MutterMetaWindow $!mw is implementor;

  method activate (Int() $current_time) {
    my guint32 $c = $current_time;

    meta_window_activate($!mw, $current_time);
  }

  method activate_with_workspace (
    Int()                 $current_time,
    MutterMetaWorkspace() $workspace
  ) {
    my guint32 $c = $current_time;

    meta_window_activate_with_workspace($!mw, $c, $workspace);
  }

  method allows_move {
    meta_window_allows_move($!mw);
  }

  method allows_resize {
    meta_window_allows_resize($!mw);
  }

  method appears_focused {
    meta_window_appears_focused($!mw);
  }

  method begin_grab_op (Int() $op, Int() $frame_action, Int() $timestamp) {
    my MutterMetaGrabOp $o = $op;
    my gboolean         $f = $frame_action.so.Int;
    my guint32          $t = $timestamp;

    meta_window_begin_grab_op($!mw, $o, $f, $t);
  }

  method can_close {
    meta_window_can_close($!mw);
  }

  method can_maximize {
    meta_window_can_maximize($!mw);
  }

  method can_minimize {
    meta_window_can_minimize($!mw);
  }

  method can_shade {
    meta_window_can_shade($!mw);
  }

  method change_workspace (MutterMetaWorkspace() $workspace) {
    meta_window_change_workspace($!mw, $workspace);
  }

  method change_workspace_by_index (Int() $space_index, Int() $append) {
    my gint     $s = $space_index;
    my gboolean $a = $append.so.Int;

    meta_window_change_workspace_by_index($!mw, $space_index, $append);
  }

  method check_alive (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_check_alive($!mw, $t);
  }

  method client_rect_to_frame_rect (
    MutterMetaRectangle() $client_rect,
    MutterMetaRectangle() $frame_rect
  ) {
    meta_window_client_rect_to_frame_rect($!mw, $client_rect, $frame_rect);
  }

  method delete (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_delete($!mw, $t);
  }

  method find_root_ancestor {
    meta_window_find_root_ancestor($!mw);
  }

  method focus (guint32 $timestamp) {
    meta_window_focus($!mw, $timestamp);
  }

  method foreach_ancestor (&func, gpointer $user_data) {
    meta_window_foreach_ancestor($!mw, &func, $user_data);
  }

  method foreach_transient (&func, gpointer $user_data) {
    meta_window_foreach_transient($!mw, &func, $user_data);
  }

  method frame_rect_to_client_rect (
    MutterMetaRectangle() $frame_rect,
    MutterMetaRectangle() $client_rect
  ) {
    meta_window_frame_rect_to_client_rect($!mw, $frame_rect, $client_rect);
  }

  method get_buffer_rect (MutterMetaRectangle() $rect) {
    meta_window_get_buffer_rect($!mw, $rect);
  }

  method get_client_machine {
    meta_window_get_client_machine($!mw);
  }

  method get_client_type {
    meta_window_get_client_type($!mw);
  }

  method get_compositor_private {
    meta_window_get_compositor_private($!mw);
  }

  method get_description {
    meta_window_get_description($!mw);
  }

  method get_display {
    meta_window_get_display($!mw);
  }

  method get_frame {
    meta_window_get_frame($!mw);
  }

  method get_frame_bounds {
    meta_window_get_frame_bounds($!mw);
  }

  method get_frame_rect (MutterMetaRectangle() $rect) {
    meta_window_get_frame_rect($!mw, $rect);
  }

  method get_frame_type {
    meta_window_get_frame_type($!mw);
  }

  method get_gtk_app_menu_object_path {
    meta_window_get_gtk_app_menu_object_path($!mw);
  }

  method get_gtk_application_id {
    meta_window_get_gtk_application_id($!mw);
  }

  method get_gtk_application_object_path {
    meta_window_get_gtk_application_object_path($!mw);
  }

  method get_gtk_menubar_object_path {
    meta_window_get_gtk_menubar_object_path($!mw);
  }

  method get_gtk_theme_variant {
    meta_window_get_gtk_theme_variant($!mw);
  }

  method get_gtk_unique_bus_name {
    meta_window_get_gtk_unique_bus_name($!mw);
  }

  method get_gtk_window_object_path {
    meta_window_get_gtk_window_object_path($!mw);
  }

  method get_icon_geometry (MutterMetaRectangle() $rect) {
    meta_window_get_icon_geometry($!mw, $rect);
  }

  method get_id {
    meta_window_get_id($!mw);
  }

  method get_layer {
    meta_window_get_layer($!mw);
  }

  method get_maximized {
    meta_window_get_maximized($!mw);
  }

  method get_monitor {
    meta_window_get_monitor($!mw);
  }

  method get_mutter_hints {
    meta_window_get_mutter_hints($!mw);
  }

  method get_pid {
    meta_window_get_pid($!mw);
  }

  method get_role {
    meta_window_get_role($!mw);
  }

  method get_sandboxed_app_id {
    meta_window_get_sandboxed_app_id($!mw);
  }

  method get_stable_sequence {
    meta_window_get_stable_sequence($!mw);
  }

  method get_startup_id {
    meta_window_get_startup_id($!mw);
  }

  method get_tile_match {
    meta_window_get_tile_match($!mw);
  }

  method get_title {
    meta_window_get_title($!mw);
  }

  method get_transient_for {
    meta_window_get_transient_for($!mw);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_window_get_type, $n, $t );
  }

  method get_user_time {
    meta_window_get_user_time($!mw);
  }

  method get_window_type {
    meta_window_get_window_type($!mw);
  }

  method get_wm_class {
    meta_window_get_wm_class($!mw);
  }

  method get_wm_class_instance {
    meta_window_get_wm_class_instance($!mw);
  }

  method get_work_area_all_monitors (MutterMetaRectangle() $area) {
    meta_window_get_work_area_all_monitors($!mw, $area);
  }

  method get_work_area_current_monitor (MutterMetaRectangle() $area) {
    meta_window_get_work_area_current_monitor($!mw, $area);
  }

  method get_work_area_for_monitor (
    Int()           $which_monitor,
    MutterMetaRectangle() $area
  ) {
    my gint $w = $which_monitor;

    meta_window_get_work_area_for_monitor($!mw, $w, $area);
  }

  method get_workspace {
    meta_window_get_workspace($!mw);
  }

  method get_xwindow {
    meta_window_get_xwindow($!mw);
  }

  method has_attached_dialogs {
    so meta_window_has_attached_dialogs($!mw);
  }

  method has_focus {
    so meta_window_has_focus($!mw);
  }

  method is_above {
    so meta_window_is_above($!mw);
  }

  method is_always_on_all_workspaces {
    so meta_window_is_always_on_all_workspaces($!mw);
  }

  method is_ancestor_of_transient (MutterMetaWindow() $transient) {
    so meta_window_is_ancestor_of_transient($!mw, $transient);
  }

  method is_attached_dialog {
    so meta_window_is_attached_dialog($!mw);
  }

  method is_client_decorated {
    so meta_window_is_client_decorated($!mw);
  }

  method is_fullscreen {
    so meta_window_is_fullscreen($!mw);
  }

  method is_hidden {
    so meta_window_is_hidden($!mw);
  }

  method is_monitor_sized {
    so meta_window_is_monitor_sized($!mw);
  }

  method is_on_all_workspaces {
    so meta_window_is_on_all_workspaces($!mw);
  }

  method is_on_primary_monitor {
    so meta_window_is_on_primary_monitor($!mw);
  }

  method is_override_redirect {
    so meta_window_is_override_redirect($!mw);
  }

  method is_remote {
    so meta_window_is_remote($!mw);
  }

  method is_screen_sized {
    so meta_window_is_screen_sized($!mw);
  }

  method is_shaded {
    so meta_window_is_shaded($!mw);
  }

  method is_skip_taskbar {
    so meta_window_is_skip_taskbar($!mw);
  }

  method kill {
    meta_window_kill($!mw);
  }

  method located_on_workspace (MutterMetaWorkspace() $workspace) {
    meta_window_located_on_workspace($!mw, $workspace);
  }

  method lower {
    meta_window_lower($!mw);
  }

  method lower_with_transients (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_lower_with_transients($!mw, $t);
  }

  method make_above {
    meta_window_make_above($!mw);
  }

  method make_fullscreen {
    meta_window_make_fullscreen($!mw);
  }

  method maximize (Int() $directions) {
    my MutterMetaMaximizeFlags $d = $directions;

    meta_window_maximize($!mw, $d);
  }

  method minimize {
    meta_window_minimize($!mw);
  }

  method move_frame (Int() $user_op, Int() $root_x_nw, Int() $root_y_nw) {
    my gboolean  $u        =  $user_op.so.Int;
    my gint     ($rx, $ry) = ($root_x_nw, $root_y_nw);

    meta_window_move_frame($!mw, $u, $rx, $ry);
  }

  method move_resize_frame (
    Int() $user_op,
    Int() $root_x_nw,
    Int() $root_y_nw,
    Int() $w,
    Int() $h
  ) {
    my gboolean  $u                  = $user_op.so.Int;
    my gint     ($rx, $ry, $ww, $hh) = ($root_x_nw, $root_y_nw, $w, $h);

    meta_window_move_resize_frame($!mw, $user_op, $rx, $ry, $ww, $hh);
  }

  method move_to_monitor (Int() $monitor) {
    my gint $m = $monitor;

    meta_window_move_to_monitor($!mw, $m);
  }

  method raise {
    meta_window_raise($!mw);
  }

  method set_compositor_private (GObject() $priv) {
    meta_window_set_compositor_private($!mw, $priv);
  }

  method set_demands_attention {
    meta_window_set_demands_attention($!mw);
  }

  method set_icon_geometry (MutterMetaRectangle() $rect) {
    meta_window_set_icon_geometry($!mw, $rect);
  }

  method shade (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_shade($!mw, $t);
  }

  method shove_titlebar_onscreen {
    meta_window_shove_titlebar_onscreen($!mw);
  }

  method showing_on_its_workspace {
    meta_window_showing_on_its_workspace($!mw);
  }

  method stick {
    meta_window_stick($!mw);
  }

  method titlebar_is_onscreen {
    meta_window_titlebar_is_onscreen($!mw);
  }

  method unmake_above {
    meta_window_unmake_above($!mw);
  }

  method unmake_fullscreen {
    meta_window_unmake_fullscreen($!mw);
  }

  method unmaximize (Int() $directions) {
    my MutterMetaMaximizeFlags $d = $directions;

    meta_window_unmaximize($!mw, $d);
  }

  method unminimize {
    meta_window_unminimize($!mw);
  }

  method unset_demands_attention {
    meta_window_unset_demands_attention($!mw);
  }

  method unshade (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_unshade($!mw, $timestamp);
  }

  method unstick {
    meta_window_unstick($!mw);
  }

}
