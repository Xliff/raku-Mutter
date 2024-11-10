use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Meta::Window;

### /usr/include/mutter-10/meta/window.h

sub meta_window_activate (MutterMetaWindow $window, guint32 $current_time)
  is native(mutter)
  is export
{ * }

sub meta_window_activate_with_workspace (
  MutterMetaWindow    $window,
  guint32             $current_time,
  MutterMetaWorkspace $workspace
)
  is native(mutter)
  is export
{ * }

sub meta_window_allows_move (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_allows_resize (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_appears_focused (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_begin_grab_op (
  MutterMetaWindow $window,
  MutterMetaGrabOp $op,
  gboolean         $frame_action,
  guint32          $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_window_can_close (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_can_maximize (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_can_minimize (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_can_shade (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_change_workspace (
  MutterMetaWindow    $window,
  MutterMetaWorkspace $workspace
)
  is native(mutter)
  is export
{ * }

sub meta_window_change_workspace_by_index (
  MutterMetaWindow $window,
  gint             $space_index,
  gboolean         $append
)
  is native(mutter)
  is export
{ * }

sub meta_window_check_alive (MutterMetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_client_rect_to_frame_rect (
  MutterMetaWindow    $window,
  MutterMetaRectangle $client_rect,
  MutterMetaRectangle $frame_rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_delete (MutterMetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_find_root_ancestor (MutterMetaWindow $window)
  returns MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_focus (MutterMetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_foreach_ancestor (
  MutterMetaWindow $window,
                   &func (MutterMetaWindow, gpointer --> gboolean),
  Pointer          $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_window_foreach_transient (
  MutterMetaWindow $window,
                   &func (MutterMetaWindow, gpointer --> gboolean),
  Pointer          $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_window_frame_rect_to_client_rect (
  MutterMetaWindow    $window,
  MutterMetaRectangle $frame_rect,
  MutterMetaRectangle $client_rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_buffer_rect (
  MutterMetaWindow    $window,
  MutterMetaRectangle $rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_client_machine (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_client_type (MutterMetaWindow $window)
  returns MutterMetaWindowClientType
  is native(mutter)
  is export
{ * }

sub meta_window_get_compositor_private (MutterMetaWindow $window)
  returns GObject
  is native(mutter)
  is export
{ * }

sub meta_window_get_description (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_display (MutterMetaWindow $window)
  returns MutterMetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame (MutterMetaWindow $window)
  returns MutterMetaFrame
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame_bounds (MutterMetaWindow $window)
  returns cairo_region_t
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame_rect (
  MutterMetaWindow    $window,
  MutterMetaRectangle $rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_frame_type (MutterMetaWindow $window)
  returns MutterMetaFrameType
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_app_menu_object_path (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_application_id (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_application_object_path (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_menubar_object_path (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_theme_variant (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_unique_bus_name (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_gtk_window_object_path (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_icon_geometry (
  MutterMetaWindow    $window,
  MutterMetaRectangle $rect
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_get_id (MutterMetaWindow $window)
  returns uint64
  is native(mutter)
  is export
{ * }

sub meta_window_get_layer (MutterMetaWindow $window)
  returns MutterMetaStackLayer
  is native(mutter)
  is export
{ * }

sub meta_window_get_maximized (MutterMetaWindow $window)
  returns MutterMetaMaximizeFlags
  is native(mutter)
  is export
{ * }

sub meta_window_get_monitor (MutterMetaWindow $window)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_window_get_mutter_hints (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_pid (MutterMetaWindow $window)
  returns pid_t
  is native(mutter)
  is export
{ * }

sub meta_window_get_role (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_sandboxed_app_id (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_stable_sequence (MutterMetaWindow $window)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_window_get_startup_id (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_tile_match (MutterMetaWindow $window)
  returns MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_get_title (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_transient_for (MutterMetaWindow $window)
  returns MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_window_get_user_time (MutterMetaWindow $window)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_window_get_window_type (MutterMetaWindow $window)
  returns MutterMetaWindowType
  is native(mutter)
  is export
{ * }

sub meta_window_get_wm_class (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_wm_class_instance (MutterMetaWindow $window)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_window_get_work_area_all_monitors (
  MutterMetaWindow    $window,
  MutterMetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_work_area_current_monitor (
  MutterMetaWindow    $window,
  MutterMetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_work_area_for_monitor (
  MutterMetaWindow    $window,
  gint                $which_monitor,
  MutterMetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_window_get_workspace (MutterMetaWindow $window)
  returns MutterMetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_window_get_xwindow (MutterMetaWindow $window)
  returns gpointer # Window
  is native(mutter)
  is export
{ * }

sub meta_window_has_attached_dialogs (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_has_focus (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_above (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_always_on_all_workspaces (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_ancestor_of_transient (
  MutterMetaWindow $window,
  MutterMetaWindow $transient
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_attached_dialog (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_client_decorated (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_fullscreen (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_hidden (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_monitor_sized (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_on_all_workspaces (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_on_primary_monitor (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_override_redirect (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_remote (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_screen_sized (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_shaded (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_is_skip_taskbar (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_kill (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_located_on_workspace (
  MutterMetaWindow    $window,
  MutterMetaWorkspace $workspace
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_lower (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_lower_with_transients (
  MutterMetaWindow $window,
  uint32_t         $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_window_make_above (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_make_fullscreen (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_maximize (
  MutterMetaWindow        $window,
  MutterMetaMaximizeFlags $directions
)
  is native(mutter)
  is export
{ * }

sub meta_window_minimize (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_move_frame (
  MutterMetaWindow $window,
  gboolean         $user_op,
  gint             $root_x_nw,
  gint             $root_y_nw
)
  is native(mutter)
  is export
{ * }

sub meta_window_move_resize_frame (
  MutterMetaWindow $window,
  gboolean         $user_op,
  gint             $root_x_nw,
  gint             $root_y_nw,
  gint             $w,
  gint             $h
)
  is native(mutter)
  is export
{ * }

sub meta_window_move_to_monitor (MutterMetaWindow $window, gint $monitor)
  is native(mutter)
  is export
{ * }

sub meta_window_raise (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_set_compositor_private (
  MutterMetaWindow $window,
  GObject          $priv
)
  is native(mutter)
  is export
{ * }

sub meta_window_set_demands_attention (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_set_icon_geometry (
  MutterMetaWindow    $window,
  MutterMetaRectangle $rect
)
  is native(mutter)
  is export
{ * }

sub meta_window_shade (MutterMetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_shove_titlebar_onscreen (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_showing_on_its_workspace (MutterMetaWindow $window)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_stick (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_titlebar_is_onscreen (MutterMetaWindow $window)
  returns uint32
  is      native(mutter)
  is      export
{ * }

sub meta_window_unmake_above (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unmake_fullscreen (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unmaximize (
  MutterMetaWindow        $window,
  MutterMetaMaximizeFlags $directions
)
  is native(mutter)
  is export
{ * }

sub meta_window_unminimize (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unset_demands_attention (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }

sub meta_window_unshade (MutterMetaWindow $window, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_window_unstick (MutterMetaWindow $window)
  is native(mutter)
  is export
{ * }
