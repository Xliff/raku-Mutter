use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Prefs;

use GLib::Roles::StaticClass;

class Mutter::Mutter::Prefs {
  also does GLib::Roles::StaticClass;

  method add_listener (&func, gpointer $user_data = gpointer) {
    meta_prefs_add_listener(&func, $user_data);
  }

  method bell_is_audible {
    so meta_prefs_bell_is_audible();
  }

  method change_workspace_name (Int() $i, Str() $name) {
    my gint $i = $ii;

    meta_prefs_change_workspace_name($ii, $name);
  }

  method get_action_double_click_titlebar {
    meta_prefs_get_action_double_click_titlebar();
  }

  method get_action_middle_click_titlebar {
    meta_prefs_get_action_middle_click_titlebar();
  }

  method get_action_right_click_titlebar {
    meta_prefs_get_action_right_click_titlebar();
  }

  method get_attach_modal_dialogs {
    meta_prefs_get_attach_modal_dialogs();
  }

  method get_auto_maximize {
    so meta_prefs_get_auto_maximize();
  }

  method get_auto_raise {
    so eta_prefs_get_auto_raise();
  }

  method get_auto_raise_delay {
    meta_prefs_get_auto_raise_delay();
  }

  method get_button_layout (Int() $button_layout) {
    my MetaButtonLayout $b = $button_layout;

    meta_prefs_get_button_layout($b);
  }

  method get_center_new_windows {
    so meta_prefs_get_center_new_windows();
  }

  method get_check_alive_timeout {
    meta_prefs_get_check_alive_timeout();
  }

  method get_compositing_manager {
    meta_prefs_get_compositing_manager();
  }

  method get_cursor_size {
    meta_prefs_get_cursor_size();
  }

  method get_cursor_theme {
    meta_prefs_get_cursor_theme();
  }

  method get_disable_workarounds {
    so meta_prefs_get_disable_workarounds();
  }

  method get_drag_threshold {
    meta_prefs_get_drag_threshold();
  }

  method get_draggable_border_width {
    meta_prefs_get_draggable_border_width();
  }

  method get_dynamic_workspaces {
    meta_prefs_get_dynamic_workspaces();
  }

  method get_edge_tiling {
    meta_prefs_get_edge_tiling();
  }

  method get_focus_change_on_pointer_rest {
    meta_prefs_get_focus_change_on_pointer_rest();
  }

  method get_focus_mode {
    meta_prefs_get_focus_mode();
  }

  method get_focus_new_windows {
    meta_prefs_get_focus_new_windows();
  }

  method get_force_fullscreen {
    so meta_prefs_get_force_fullscreen();
  }

  method get_gnome_accessibility {
    meta_prefs_get_gnome_accessibility();
  }

  method get_gnome_animations {
    meta_prefs_get_gnome_animations();
  }

  method get_keybinding_action (Str() $name) {
    meta_prefs_get_keybinding_action($name);
  }

  method get_mouse_button_menu {
    meta_prefs_get_mouse_button_menu();
  }

  method get_mouse_button_mods {
    meta_prefs_get_mouse_button_mods();
  }

  method get_mouse_button_resize {
    meta_prefs_get_mouse_button_resize();
  }

  method get_num_workspaces {
    meta_prefs_get_num_workspaces();
  }

  method get_raise_on_click {
    so meta_prefs_get_raise_on_click();
  }

  method get_show_fallback_app_menu {
    so meta_prefs_get_show_fallback_app_menu();
  }

  method get_titlebar_font {
    meta_prefs_get_titlebar_font();
  }

  method get_visual_bell {
    meta_prefs_get_visual_bell();
  }

  method get_visual_bell_type {
    state ($n, $t);

    unstable_get_type(self.^name, &meta_prefs_get_visual_bell_type, $n, $t );
  }

  method get_workspace_name (Int() $i) {
    my gint $ii = $i;

    meta_prefs_get_workspace_name($i);
  }

  method get_workspaces_only_on_primary {
    so meta_prefs_get_workspaces_only_on_primary();
  }

  method meta_key_binding_get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &meta_key_binding_get_type, $n, $t );
  }

  method to_string (Int() $pref) {
    my MetaPreference $p = $pref;

    meta_preference_to_string($p);
  }

  method remove_listener (&func, gpointer $user_data) {
    meta_prefs_remove_listener($func, $user_data);
  }

  method set_force_fullscreen (Int() $whether) {
    my goolean $w = $whether.so.Int;

    meta_prefs_set_force_fullscreen($w);
  }

  method set_num_workspaces (Int() $n_workspaces) {
    my gint $n = $n_workspaces;

    meta_prefs_set_num_workspaces($n);
  }

  method set_show_fallback_app_menu (Int() $whether) {
    my goolean $w = $whether.so.Int;

    meta_prefs_set_show_fallback_app_menu($w);
  }

}
