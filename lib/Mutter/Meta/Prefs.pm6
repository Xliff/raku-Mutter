use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Prefs;

use GLib::Roles::StaticClass;

class Mutter::Mutter::Prefs {
  also does GLib::Roles::StaticClass;

  method add_listener (&func, gpointer $user_data = gpointer)
    is also<add-listener>
  {
    meta_prefs_add_listener(&func, $user_data);
  }

  method bell_is_audible is also<bell-is-audible> {
    so meta_prefs_bell_is_audible();
  }

  method change_workspace_name (Int() $i, Str() $name)
    is also<change-workspace-name>
  {
    my gint $i = $ii;

    meta_prefs_change_workspace_name($ii, $name);
  }

  method get_action_double_click_titlebar
    is also<get-action-double-click-titlebar>
  {
    meta_prefs_get_action_double_click_titlebar();
  }

  method get_action_middle_click_titlebar
    is also<get-action-middle-click-titlebar>
  {
    meta_prefs_get_action_middle_click_titlebar();
  }

  method get_action_right_click_titlebar
    is also<get-action-right-click-titlebar>
  {
    meta_prefs_get_action_right_click_titlebar();
  }

  method get_attach_modal_dialogs
    is also<get-attach-modal-dialogs>
  {
    meta_prefs_get_attach_modal_dialogs();
  }

  method get_auto_maximize is also<get-auto-maximize> {
    so meta_prefs_get_auto_maximize();
  }

  method get_auto_raise is also<get-auto-raise> {
    so eta_prefs_get_auto_raise();
  }

  method get_auto_raise_delay is also<get-auto-raise-delay> {
    meta_prefs_get_auto_raise_delay();
  }

  method get_button_layout (Int() $button_layout) is also<get-button-layout> {
    my MetaButtonLayout $b = $button_layout;

    meta_prefs_get_button_layout($b);
  }

  method get_center_new_windows is also<get-center-new-windows> {
    so meta_prefs_get_center_new_windows();
  }

  method get_check_alive_timeout is also<get-check-alive-timeout> {
    meta_prefs_get_check_alive_timeout();
  }

  method get_compositing_manager is also<get-compositing-manager> {
    meta_prefs_get_compositing_manager();
  }

  method get_cursor_size is also<get-cursor-size> {
    meta_prefs_get_cursor_size();
  }

  method get_cursor_theme is also<get-cursor-theme> {
    meta_prefs_get_cursor_theme();
  }

  method get_disable_workarounds is also<get-disable-workarounds> {
    so meta_prefs_get_disable_workarounds();
  }

  method get_drag_threshold is also<get-drag-threshold> {
    meta_prefs_get_drag_threshold();
  }

  method get_draggable_border_width is also<get-draggable-border-width> {
    meta_prefs_get_draggable_border_width();
  }

  method get_dynamic_workspaces is also<get-dynamic-workspaces> {
    meta_prefs_get_dynamic_workspaces();
  }

  method get_edge_tiling is also<get-edge-tiling> {
    meta_prefs_get_edge_tiling();
  }

  method get_focus_change_on_pointer_rest
    is also<get-focus-change-on-pointer-rest>
  {
    meta_prefs_get_focus_change_on_pointer_rest();
  }

  method get_focus_mode is also<get-focus-mode> {
    meta_prefs_get_focus_mode();
  }

  method get_focus_new_windows is also<get-focus-new-windows> {
    meta_prefs_get_focus_new_windows();
  }

  method get_force_fullscreen is also<get-force-fullscreen> {
    so meta_prefs_get_force_fullscreen();
  }

  method get_gnome_accessibility is also<get-gnome-accessibility> {
    meta_prefs_get_gnome_accessibility();
  }

  method get_gnome_animations is also<get-gnome-animations> {
    meta_prefs_get_gnome_animations();
  }

  method get_keybinding_action (Str() $name) is also<get-keybinding-action> {
    meta_prefs_get_keybinding_action($name);
  }

  method get_mouse_button_menu is also<get-mouse-button-menu> {
    meta_prefs_get_mouse_button_menu();
  }

  method get_mouse_button_mods is also<get-mouse-button-mods> {
    meta_prefs_get_mouse_button_mods();
  }

  method get_mouse_button_resize is also<get-mouse-button-resize> {
    meta_prefs_get_mouse_button_resize();
  }

  method get_num_workspaces is also<get-num-workspaces> {
    meta_prefs_get_num_workspaces();
  }

  method get_raise_on_click is also<get-raise-on-click> {
    so meta_prefs_get_raise_on_click();
  }

  method get_show_fallback_app_menu is also<get-show-fallback-app-menu> {
    so meta_prefs_get_show_fallback_app_menu();
  }

  method get_titlebar_font is also<get-titlebar-font> {
    meta_prefs_get_titlebar_font();
  }

  method get_visual_bell is also<get-visual-bell> {
    meta_prefs_get_visual_bell();
  }

  method get_visual_bell_type is also<get-visual-bell-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &meta_prefs_get_visual_bell_type, $n, $t );
  }

  method get_workspace_name (Int() $i) is also<get-workspace-name> {
    my gint $ii = $i;

    meta_prefs_get_workspace_name($i);
  }

  method get_workspaces_only_on_primary
    is also<get-workspaces-only-on-primary>
  {
    so meta_prefs_get_workspaces_only_on_primary();
  }

  method meta_key_binding_get_type is also<meta-key-binding-get-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &meta_key_binding_get_type, $n, $t );
  }

  method to_string (Int() $pref) is also<to-string> {
    my MetaPreference $p = $pref;

    meta_preference_to_string($p);
  }

  method remove_listener (&func, gpointer $user_data) is also<remove-listener> {
    meta_prefs_remove_listener($func, $user_data);
  }

  method set_force_fullscreen (Int() $whether) is also<set-force-fullscreen> {
    my goolean $w = $whether.so.Int;

    meta_prefs_set_force_fullscreen($w);
  }

  method set_num_workspaces (Int() $n_workspaces) is also<set-num-workspaces> {
    my gint $n = $n_workspaces;

    meta_prefs_set_num_workspaces($n);
  }

  method set_show_fallback_app_menu (Int() $whether)
    is also<set-show-fallback-app-menu>
  {
    my goolean $w = $whether.so.Int;

    meta_prefs_set_show_fallback_app_menu($w);
  }

}
