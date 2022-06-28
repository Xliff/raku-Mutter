use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Compositor;

### /usr/include/mutter-10/meta/compositor.h

sub meta_compositor_add_window (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_destroy (MutterMetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_filter_keybinding (
  MutterMetaCompositor $compositor,
  MutterMetaKeyBinding $binding
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_compositor_flash_display (
  MutterMetaCompositor $compositor,
  MutterMetaDisplay    $display
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_get_laters (MutterMetaCompositor $compositor)
  returns MutterMetaLaters
  is native(mutter)
  is export
{ * }

sub meta_compositor_hide_tile_preview (MutterMetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_hide_window (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window,
  MutterMetaCompEffect $effect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_manage (MutterMetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_queue_frame_drawn (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window,
  gboolean             $no_delay_frame
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_remove_window (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_tile_preview (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window,
  MutterMetaRectangle  $tile_rect,
  gint                 $tile_monitor_number
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_window (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window,
  MutterMetaCompEffect $effect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_window_menu (
  MutterMetaCompositor     $compositor,
  MutterMetaWindow         $window,
  MutterMetaWindowMenuType $menu,
  gint                     $x,
  gint                     $y
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_window_menu_for_rect (
  MutterMetaCompositor     $compositor,
  MutterMetaWindow         $window,
  MutterMetaWindowMenuType $menu,
  MutterMetaRectangle      $rect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_size_change_window (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window,
  MutterMetaSizeChange $which_change,
  MutterMetaRectangle  $old_frame_rect,
  MutterMetaRectangle  $old_buffer_rect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_switch_workspace (
  MutterMetaCompositor      $compositor,
  MutterMetaWorkspace       $from,
  MutterMetaWorkspace       $to,
  MutterMetaMotionDirection $direction
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_sync_stack (MutterMetaCompositor $compositor, GList $stack)
  is native(mutter)
  is export
{ * }

sub meta_compositor_sync_updates_frozen (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_sync_window_geometry (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window,
  gboolean             $did_placement
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_unmanage (MutterMetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_window_opacity_changed (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_window_shape_changed (
  MutterMetaCompositor $compositor,
  MutterMetaWindow     $window
)
  is native(mutter)
  is export
{ * }
