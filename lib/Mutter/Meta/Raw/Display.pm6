use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Display;

### /usr/include/mutter-10/meta/display.h

sub meta_display_add_ignored_crossing_serial (MetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_display_add_keybinding (
  MetaDisplay         $display,
  Str                 $name,
  GSettings           $settings,
  MetaKeyBindingFlags $flags,
                      &handler (
                        MetaDisplay,
                        MetaWindow,
                        ClutterKeyEvent,
                        MetaKeyBinding,
                        gpointer
                      ), #= MetaKeyHandlerFunc,
  gpointer            $user_data,
                      &free_data (gpointer)
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_display_begin_grab_op (
  MetaDisplay $display,
  MetaWindow  $window,
  MetaGrabOp  $op,
  gboolean    $pointer_already_grabbed,
  gboolean    $frame_action,
  gint        $button,
  gulong      $modmask,
  guint32     $timestamp,
  gint        $root_x,
  gint        $root_y
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_clear_mouse_mode (MetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_display_close (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_end_grab_op (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_focus_default_window (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_freeze_keyboard (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_get_compositor (MetaDisplay $display)
  returns MetaCompositor
  is native(mutter)
  is export
{ * }

sub meta_display_get_compositor_modifiers (MetaDisplay $display)
  returns ClutterModifierType
  is native(mutter)
  is export
{ * }

sub meta_display_get_context (MetaDisplay $display)
  returns MetaContext
  is native(mutter)
  is export
{ * }

sub meta_display_get_current_monitor (MetaDisplay $display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_current_time (MetaDisplay $display)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_current_time_roundtrip (MetaDisplay $display)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_focus_window (MetaDisplay $display)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_display_get_grab_op (MetaDisplay $display)
  returns MetaGrabOp
  is native(mutter)
  is export
{ * }

sub meta_display_get_keybinding_action (
  MetaDisplay $display,
  gint        $keycode
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_display_get_last_user_time (MetaDisplay $display)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_geometry (
  MetaDisplay   $display,
  gint          $monitor,
  MetaRectangle $geometry
)
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_in_fullscreen (
  MetaDisplay $display,
  gint        $monitor
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_index_for_rect (
  MetaDisplay   $display,
  MetaRectangle $rect
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_neighbor_index (
  MetaDisplay          $display,
  gint                 $which_monitor,
  MetaDisplayDirection $dir
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_scale (MetaDisplay $display, gint $monitor)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub meta_display_get_n_monitors (MetaDisplay $display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_pad_action_label (
  MetaDisplay        $display,
  ClutterInputDevice $pad,
  MetaPadActionType  $action_type,
  guint              $action_number
)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_display_get_primary_monitor (MetaDisplay $display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_selection (MetaDisplay $display)
  returns MetaSelection
  is native(mutter)
  is export
{ * }

sub meta_display_get_size (
  MetaDisplay $display,
  gint        $width    is rw,
  gint        $height   is rw
)
  is native(mutter)
  is export
{ * }

sub meta_display_get_sound_player (MetaDisplay $display)
  returns MetaSoundPlayer
  is native(mutter)
  is export
{ * }

sub meta_display_get_startup_notification (MetaDisplay $display)
  returns MetaStartupNotification
  is native(mutter)
  is export
{ * }

sub meta_display_get_tab_current (
  MetaDisplay   $display,
  MetaTabList   $type,
  MetaWorkspace $workspace
)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_display_get_tab_list (
  MetaDisplay   $display,
  MetaTabList   $type,
  MetaWorkspace $workspace
)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_display_get_tab_next (
  MetaDisplay   $display,
  MetaTabList   $type,
  MetaWorkspace $workspace,
  MetaWindow    $window,
  gboolean      $backward
)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_display_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_display_get_workspace_manager (MetaDisplay $display)
  returns MetaWorkspaceManager
  is native(mutter)
  is export
{ * }

sub meta_display_get_x11_display (MetaDisplay $display)
  returns MetaX11Display
  is native(mutter)
  is export
{ * }

sub meta_display_grab_accelerator (
  MetaDisplay         $display,
  Str                 $accelerator,
  MetaKeyBindingFlags $flags
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_display_is_pointer_emulating_sequence (
  MetaDisplay          $display,
  ClutterEventSequence $sequence
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_list_all_windows (MetaDisplay $display)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_display_remove_keybinding (MetaDisplay $display, Str $name)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_request_pad_osd (
  MetaDisplay        $display,
  ClutterInputDevice $pad,
  gboolean           $edition_mode
)
  is native(mutter)
  is export
{ * }

sub meta_display_set_cursor (
  MetaDisplay $display,
  MetaCursor  $cursor
)
  is native(mutter)
  is export
{ * }

sub meta_display_set_input_focus (
  MetaDisplay $display,
  MetaWindow  $window,
  gboolean    $focus_frame,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_sort_windows_by_stacking (
  MetaDisplay $display,
  GSList      $windows
)
  returns GSList
  is native(mutter)
  is export
{ * }

sub meta_display_supports_extended_barriers (MetaDisplay $display)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_unfreeze_keyboard (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_ungrab_accelerator (
  MetaDisplay $display,
  guint       $action_id
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_ungrab_keyboard (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_unset_input_focus (
  MetaDisplay $display,
  guint32     $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_xserver_time_is_before (
  MetaDisplay $display,
  guint32     $time1,
  guint32     $time2
)
  returns uint32
  is native(mutter)
  is export
{ * }


### /usr/src/mutter-42.1/src/meta/compositor-mutter.h

sub meta_disable_unredirect_for_display (MetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_enable_unredirect_for_display (MetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_focus_stage_window (MetaDisplay $display, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_get_feedback_group_for_display (MetaDisplay $display)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub meta_get_stage_for_display (MetaDisplay $display)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub meta_get_top_window_group_for_display (MetaDisplay $display)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub meta_get_window_actors (MetaDisplay $display)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_get_window_group_for_display (MetaDisplay $display)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub meta_stage_is_focused (MetaDisplay $display)
  returns uint32
  is native(mutter)
  is export
{ * }
