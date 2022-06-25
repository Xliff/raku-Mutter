use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Meta::Prefs;

### /usr/include/mutter-10/meta/prefs.h

sub meta_prefs_add_listener (
           &func (MetaPreference, gpointer),
  gpointer $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_prefs_bell_is_audible ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_change_workspace_name (gint $i, Str $name)
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_action_double_click_titlebar ()
  returns GDesktopTitlebarAction
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_action_middle_click_titlebar ()
  returns GDesktopTitlebarAction
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_action_right_click_titlebar ()
  returns GDesktopTitlebarAction
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_attach_modal_dialogs ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_auto_maximize ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_auto_raise ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_auto_raise_delay ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_button_layout (MetaButtonLayout $button_layout)
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_center_new_windows ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_check_alive_timeout ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_compositing_manager ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_cursor_size ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_cursor_theme ()
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_disable_workarounds ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_drag_threshold ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_draggable_border_width ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_dynamic_workspaces ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_edge_tiling ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_focus_change_on_pointer_rest ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_focus_mode ()
  returns GDesktopFocusMode
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_focus_new_windows ()
  returns GDesktopFocusNewWindows
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_force_fullscreen ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_gnome_accessibility ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_gnome_animations ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_keybinding_action (Str $name)
  returns MetaKeyBindingAction
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_mouse_button_menu ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_mouse_button_mods ()
  returns MetaVirtualModifier
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_mouse_button_resize ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_num_workspaces ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_raise_on_click ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_show_fallback_app_menu ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_titlebar_font ()
  returns PangoFontDescription
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_visual_bell ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_visual_bell_type ()
  returns GDesktopVisualBellType
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_workspace_name (gint $i)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_prefs_get_workspaces_only_on_primary ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_key_binding_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_preference_to_string (MetaPreference $pref)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_prefs_remove_listener (
           &func (MetaPreference, gpointer),
  gpointer $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_prefs_set_force_fullscreen (gboolean $whether)
  is native(mutter)
  is export
{ * }

sub meta_prefs_set_num_workspaces (gint $n_workspaces)
  is native(mutter)
  is export
{ * }

sub meta_prefs_set_show_fallback_app_menu (gboolean $whether)
  is native(mutter)
  is export
{ * }
