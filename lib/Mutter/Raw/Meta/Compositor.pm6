use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Compositor;

### /usr/include/mutter-10/meta/compositor.h

sub meta_compositor_add_window (
  MetaCompositor $compositor,
  MetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_destroy (MetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_filter_keybinding (
  MetaCompositor $compositor,
  MetaKeyBinding $binding
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_compositor_flash_display (
  MetaCompositor $compositor,
  MetaDisplay    $display
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_get_laters (MetaCompositor $compositor)
  returns MetaLaters
  is native(mutter)
  is export
{ * }

sub meta_compositor_hide_tile_preview (MetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_hide_window (
  MetaCompositor $compositor,
  MetaWindow     $window,
  MetaCompEffect $effect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_manage (MetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_queue_frame_drawn (
  MetaCompositor $compositor,
  MetaWindow     $window,
  gboolean       $no_delay_frame
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_remove_window (
  MetaCompositor $compositor,
  MetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_tile_preview (
  MetaCompositor $compositor,
  MetaWindow     $window,
  MetaRectangle  $tile_rect,
  gint           $tile_monitor_number
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_window (
  MetaCompositor $compositor,
  MetaWindow     $window,
  MetaCompEffect $effect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_window_menu (
  MetaCompositor     $compositor,
  MetaWindow         $window,
  MetaWindowMenuType $menu,
  gint               $x,
  gint               $y
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_show_window_menu_for_rect (
  MetaCompositor     $compositor,
  MetaWindow         $window,
  MetaWindowMenuType $menu,
  MetaRectangle      $rect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_size_change_window (
  MetaCompositor $compositor,
  MetaWindow     $window,
  MetaSizeChange $which_change,
  MetaRectangle  $old_frame_rect,
  MetaRectangle  $old_buffer_rect
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_switch_workspace (
  MetaCompositor      $compositor,
  MetaWorkspace       $from,
  MetaWorkspace       $to,
  MetaMotionDirection $direction
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_sync_stack (MetaCompositor $compositor, GList $stack)
  is native(mutter)
  is export
{ * }

sub meta_compositor_sync_updates_frozen (
  MetaCompositor $compositor,
  MetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_sync_window_geometry (
  MetaCompositor $compositor,
  MetaWindow     $window,
  gboolean       $did_placement
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_unmanage (MetaCompositor $compositor)
  is native(mutter)
  is export
{ * }

sub meta_compositor_window_opacity_changed (
  MetaCompositor $compositor,
  MetaWindow     $window
)
  is native(mutter)
  is export
{ * }

sub meta_compositor_window_shape_changed (
  MetaCompositor $compositor,
  MetaWindow     $window
)
  is native(mutter)
  is export
{ * }
