use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::Meta::Display;

### /usr/include/mutter-10/meta/display.h

sub meta_display_add_ignored_crossing_serial (MutterMetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_display_add_keybinding (
  MutterMetaDisplay         $display,
  Str                       $name,
  GSettings                 $settings,
  MutterMetaKeyBindingFlags $flags,
                            &handler (
                              MutterMetaDisplay,
                              MutterMetaWindow,
                              MutterClutterKeyEvent,
                              MutterMetaKeyBinding,
                              gpointer
                            ), #= MutterMetaKeyHandlerFunc,
  gpointer                  $user_data,
                            &free_data (gpointer)
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_display_begin_grab_op (
  MutterMetaDisplay $display,
  MutterMetaWindow  $window,
  MutterMetaGrabOp  $op,
  gboolean          $pointer_already_grabbed,
  gboolean          $frame_action,
  gint              $button,
  gulong            $modmask,
  guint32           $timestamp,
  gint              $root_x,
  gint              $root_y
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_clear_mouse_mode (MutterMetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_display_close (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_end_grab_op (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_focus_default_window (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_freeze_keyboard (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_get_compositor (MutterMetaDisplay $display)
  returns MutterMetaCompositor
  is native(mutter)
  is export
{ * }

sub meta_display_get_compositor_modifiers (MutterMetaDisplay $display)
  returns MutterClutterModifierType
  is native(mutter)
  is export
{ * }

sub meta_display_get_context (MutterMetaDisplay $display)
  returns MutterMetaContext
  is native(mutter)
  is export
{ * }

sub meta_display_get_current_monitor (MutterMetaDisplay $display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_current_time (MutterMetaDisplay $display)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_current_time_roundtrip (MutterMetaDisplay $display)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_focus_window (MutterMetaDisplay $display)
  returns MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_display_get_grab_op (MutterMetaDisplay $display)
  returns MutterMetaGrabOp
  is native(mutter)
  is export
{ * }

sub meta_display_get_keybinding_action (
  MutterMetaDisplay $display,
  gint              $keycode
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_display_get_last_user_time (MutterMetaDisplay $display)
  returns guint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_geometry (
  MutterMetaDisplay   $display,
  gint                $monitor,
  MtkRectangle $geometry
)
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_in_fullscreen (
  MutterMetaDisplay $display,
  gint              $monitor
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_index_for_rect (
  MutterMetaDisplay   $display,
  MtkRectangle $rect
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_neighbor_index (
  MutterMetaDisplay          $display,
  gint                       $which_monitor,
  MutterMetaDisplayDirection $dir
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_monitor_scale (MutterMetaDisplay $display, gint $monitor)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub meta_display_get_n_monitors (MutterMetaDisplay $display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_pad_action_label (
  MutterMetaDisplay        $display,
  MutterClutterInputDevice $pad,
  MutterMetaPadActionType  $action_type,
  guint                    $action_number
)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_display_get_primary_monitor (MutterMetaDisplay $display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_display_get_selection (MutterMetaDisplay $display)
  returns MutterMetaSelection
  is native(mutter)
  is export
{ * }

sub meta_display_get_size (
  MutterMetaDisplay $display,
  gint              $width    is rw,
  gint              $height   is rw
)
  is native(mutter)
  is export
{ * }

sub meta_display_get_sound_player (MutterMetaDisplay $display)
  returns MutterMetaSoundPlayer
  is native(mutter)
  is export
{ * }

sub meta_display_get_startup_notification (MutterMetaDisplay $display)
  returns MutterMetaStartupNotification
  is native(mutter)
  is export
{ * }

sub meta_display_get_tab_current (
  MutterMetaDisplay   $display,
  MutterMetaTabList   $type,
  MutterMetaWorkspace $workspace
)
  returns MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_display_get_tab_list (
  MutterMetaDisplay   $display,
  MutterMetaTabList   $type,
  MutterMetaWorkspace $workspace
)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_display_get_tab_next (
  MutterMetaDisplay   $display,
  MutterMetaTabList   $type,
  MutterMetaWorkspace $workspace,
  MutterMetaWindow    $window,
  gboolean            $backward
)
  returns MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_display_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_display_get_workspace_manager (MutterMetaDisplay $display)
  returns MutterMetaWorkspaceManager
  is native(mutter)
  is export
{ * }

sub meta_display_get_x11_display (MutterMetaDisplay $display)
  returns MutterMetaX11Display
  is native(mutter)
  is export
{ * }

sub meta_display_grab_accelerator (
  MutterMetaDisplay         $display,
  Str                       $accelerator,
  MutterMetaKeyBindingFlags $flags
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_display_is_pointer_emulating_sequence (
  MutterMetaDisplay          $display,
  MutterClutterEventSequence $sequence
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_list_all_windows (MutterMetaDisplay $display)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_display_remove_keybinding (MutterMetaDisplay $display, Str $name)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_request_pad_osd (
  MutterMetaDisplay        $display,
  MutterClutterInputDevice $pad,
  gboolean                 $edition_mode
)
  is native(mutter)
  is export
{ * }

sub meta_display_set_cursor (
  MutterMetaDisplay $display,
  MutterMetaCursor  $cursor
)
  is native(mutter)
  is export
{ * }

sub meta_display_set_input_focus (
  MutterMetaDisplay $display,
  MutterMetaWindow  $window,
  gboolean          $focus_frame,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_sort_windows_by_stacking (
  MutterMetaDisplay $display,
  GSList            $windows
)
  returns GSList
  is native(mutter)
  is export
{ * }

sub meta_display_supports_extended_barriers (MutterMetaDisplay $display)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_unfreeze_keyboard (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_ungrab_accelerator (
  MutterMetaDisplay $display,
  guint             $action_id
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_display_ungrab_keyboard (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_unset_input_focus (
  MutterMetaDisplay $display,
  guint32           $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_display_xserver_time_is_before (
  MutterMetaDisplay $display,
  guint32           $time1,
  guint32           $time2
)
  returns uint32
  is native(mutter)
  is export
{ * }


### /usr/src/mutter-42.1/src/meta/compositor-mutter.h

sub meta_disable_unredirect_for_display (MutterMetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_enable_unredirect_for_display (MutterMetaDisplay $display)
  is native(mutter)
  is export
{ * }

sub meta_focus_stage_window (MutterMetaDisplay $display, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_get_feedback_group_for_display (MutterMetaDisplay $display)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub meta_get_stage_for_display (MutterMetaDisplay $display)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub meta_get_top_window_group_for_display (MutterMetaDisplay $display)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub meta_get_window_actors (MutterMetaDisplay $display)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_get_window_group_for_display (MutterMetaDisplay $display)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub meta_stage_is_focused (MutterMetaDisplay $display)
  returns uint32
  is native(mutter)
  is export
{ * }
