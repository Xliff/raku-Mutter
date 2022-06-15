use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Window;

### /usr/include/mutter-10/meta/window.h

sub meta_window_activate (MetaWindow $window, guint32 $current_time)
  is native(mutter)
  is export
{ * }

sub meta_window_activate_with_workspace (
  MetaWindow    $window,
  guint32       $current_time,
  MetaWorkspace $workspace
)
  is native(mutter)
  is export
{ * }

sub meta_window_allows_move (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_allows_resize (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_appears_focused (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_begin_grab_op (
  MetaWindow $window,
  MetaGrabOp $op,
  gboolean   $frame_action,
  guint32    $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_window_can_close (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_can_maximize (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_can_minimize (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_can_shade (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_change_workspace (MetaWindow $window, MetaWorkspace $workspace)
  is native(mutter)
  is export
{ * }

sub meta_window_change_workspace_by_index (
  MetaWindow $window,
  gint       $space_index,
  gboolean   $append
)
  is native(mutter)
  is export
{ * }

sub meta_window_check_alive (MetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_client_rect_to_frame_rect (
  MetaWindow    $window,
  MetaRectangle $client_rect,
  MetaRectangle $frame_rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_delete (MetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_find_root_ancestor (MetaWindow $window)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_focus (MetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_foreach_ancestor (
  MetaWindow $window,
             &func (MetaWindow, gpointer --> gboolean),
  Pointer    $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_window_foreach_transient (
  MetaWindow $window,
             &func (MetaWindow, gpointer --> gboolean),
  Pointer    $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_window_frame_rect_to_client_rect (
  MetaWindow    $window,
  MetaRectangle $frame_rect,
  MetaRectangle $client_rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_buffer_rect (MetaWindow $window, MetaRectangle $rect)
  is native(mutter)
  is export
{ * }

sub meta_window_get_client_machine (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_client_type (MetaWindow $window)
  returns MetaWindowClientType
  is native(mutter)
  is export
{ * }

sub meta_window_get_compositor_private (MetaWindow $window)
  returns GObject
  is native(mutter)
  is export
{ * }

sub meta_window_get_description (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_display (MetaWindow $window)
  returns MetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame (MetaWindow $window)
  returns MetaFrame
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame_bounds (MetaWindow $window)
  returns cairo_region_t
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame_rect (MetaWindow $window, MetaRectangle $rect)
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame_type (MetaWindow $window)
  returns MetaFrameType
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_app_menu_object_path (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_application_id (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_application_object_path (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_menubar_object_path (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_theme_variant (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_unique_bus_name (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_window_object_path (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_icon_geometry (MetaWindow $window, MetaRectangle $rect)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_get_id (MetaWindow $window)
  returns uint64_t
  is native(mutter)
  is export
{ * }

sub meta_window_get_layer (MetaWindow $window)
  returns MetaStackLayer
  is native(mutter)
  is export
{ * }

sub meta_window_get_maximized (MetaWindow $window)
  returns MetaMaximizeFlags
  is native(mutter)
  is export
{ * }

sub meta_window_get_monitor (MetaWindow $window)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_window_get_mutter_hints (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_pid (MetaWindow $window)
  returns pid_t
  is native(mutter)
  is export
{ * }

sub meta_window_get_role (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_sandboxed_app_id (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_stable_sequence (MetaWindow $window)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_window_get_startup_id (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_tile_match (MetaWindow $window)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_get_title (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_transient_for (MetaWindow $window)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_window_get_user_time (MetaWindow $window)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_window_get_window_type (MetaWindow $window)
  returns MetaWindowType
  is native(mutter)
  is export
{ * }

sub meta_window_get_wm_class (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_wm_class_instance (MetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_work_area_all_monitors (
  MetaWindow    $window,
  MetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_work_area_current_monitor (
  MetaWindow    $window,
  MetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_work_area_for_monitor (
  MetaWindow    $window,
  gint          $which_monitor,
  MetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_workspace (MetaWindow $window)
  returns MetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_window_get_xwindow (MetaWindow $window)
  returns Window
  is native(mutter)
  is export
{ * }

sub meta_window_has_attached_dialogs (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_has_focus (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_above (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_always_on_all_workspaces (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_ancestor_of_transient (
  MetaWindow $window,
  MetaWindow $transient
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_attached_dialog (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_client_decorated (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_fullscreen (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_hidden (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_monitor_sized (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_on_all_workspaces (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_on_primary_monitor (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_override_redirect (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_remote (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_screen_sized (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_shaded (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_skip_taskbar (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_kill (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_located_on_workspace (
  MetaWindow    $window,
  MetaWorkspace $workspace
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_lower (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_lower_with_transients (MetaWindow $window, uint32_t $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_make_above (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_make_fullscreen (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_maximize (MetaWindow $window, MetaMaximizeFlags $directions)
  is native(mutter)
  is export
{ * }

sub meta_window_minimize (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_move_frame (
  MetaWindow $window,
  gboolean   $user_op,
  gint       $root_x_nw,
  gint       $root_y_nw
)
  is native(mutter)
  is export
{ * }

sub meta_window_move_resize_frame (
  MetaWindow $window,
  gboolean   $user_op,
  gint       $root_x_nw,
  gint       $root_y_nw,
  gint       $w,
  gint       $h
)
  is native(mutter)
  is export
{ * }

sub meta_window_move_to_monitor (MetaWindow $window, gint $monitor)
  is native(mutter)
  is export
{ * }

sub meta_window_raise (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_set_compositor_private (MetaWindow $window, GObject $priv)
  is native(mutter)
  is export
{ * }

sub meta_window_set_demands_attention (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_set_icon_geometry (MetaWindow $window, MetaRectangle $rect)
  is native(mutter)
  is export
{ * }

sub meta_window_shade (MetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_shove_titlebar_onscreen (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_showing_on_its_workspace (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_stick (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_titlebar_is_onscreen (MetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_unmake_above (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unmake_fullscreen (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unmaximize (MetaWindow $window, MetaMaximizeFlags $directions)
  is native(mutter)
  is export
{ * }

sub meta_window_unminimize (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unset_demands_attention (MetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unshade (MetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_unstick (MetaWindow $window)
  is native(mutter)
  is export
{ * }
