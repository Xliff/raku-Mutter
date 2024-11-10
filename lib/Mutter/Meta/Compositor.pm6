use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Compositor;

use GLib::Roles::Object;

our subset MetaCompositorAncestry is export of Mu
  where MetaCompistor | GObject;

class Mutter::Meta::Compositor {
  also does GLib::Roles::Object;

  has MetaCompositor $!c is implementor;

  method add_window (MetaWindow() $window) is also<add-window> {
    meta_compositor_add_window($!c, $window);
  }

  method destroy {
    meta_compositor_destroy($!c);
  }

  method filter_keybinding (MetaKeyBinding() $binding) is also<filter-keybinding> {
    meta_compositor_filter_keybinding($!c, $binding);
  }

  method flash_display (MetaDisplay() $display) is also<flash-display> {
    meta_compositor_flash_display($!c, $display);
  }

  method get_laters 
  	is also<
		get-laters
		laters
	> 
  {
    meta_compositor_get_laters($!c);
  }

  method hide_tile_preview is also<hide-tile-preview> {
    meta_compositor_hide_tile_preview($!c);
  }

  method hide_window (
    MetaWindow()     $window,
    Int()            $effect
  ) 
    is also<hide-window>
  {
    my MetaCompEffect $e = $effect;

    meta_compositor_hide_window($!c, $window, $e);
  }

  method manage {
    meta_compositor_manage($!c);
  }

  method queue_frame_drawn (
    MetaWindow()     $window,
    Int()            $no_delay_frame
  ) 
    is also<queue-frame-drawn>
  {
    my gboolean $n = $no_delay_frame.so.Int;

    meta_compositor_queue_frame_drawn($!c, $window, $no_delay_frame);
  }

  method remove_window (MetaWindow() $window) is also<remove-window> {
    meta_compositor_remove_window($!c, $window);
  }

  method show_tile_preview
    MetaWindow()     $window,
    MetaRectangle()  $tile_rect,
    Int()            $tile_monitor_number
  ) 
    is also<show-tile-preview>
  {
    my gint $t = $tile_monitor_number;

    meta_compositor_show_tile_preview($!c, $window, $tile_rect, $t);
  }

  method show_window (
    MetaWindow()     $window,
    Int()            $effect
  ) 
    is also<show-window>
  {
    my MetaCompEffect $e = $effect;

    meta_compositor_show_window($!c, $window, $e);
  }

  method show_window_menu (
    MetaWindow()     $window,
    Int()            $menu,
    Int()            $x,
    Int()            $y
  ) 
    is also<show-window-menu>
  {
    my gint               ($xx, $yy) = ($x, $y);
    my MetaWindowMenuType  $m        =  $menu;

    meta_compositor_show_window_menu($!c, $window, $menu, $x, $y);
  }

  method show_window_menu_for_rect (
    MetaWindow()     $window,
    Int()            $menu,
    MetaRectangle()  $rect
  ) 
    is also<show-window-menu-for-rect>
  {
    my MetaWindowMenuType $m = $menu;

    meta_compositor_show_window_menu_for_rect($!c, $window, $m, $rect);
  }

  method size_change_window (
    MetaWindow()     $window,
    Int()            $which_change,
    MetaRectangle()  $old_frame_rect,
    MetaRectangle()  $old_buffer_rect
  ) 
    is also<size-change-window>
  {
    my MetaSizeChange $w = $which_change;

    meta_compositor_size_change_window(
      $!c,
      $window,
      $w,
      $old_frame_rect,
      $old_buffer_rect
    );
  }

  method switch_workspace (
    MetaWorkspace()  $from,
    MetaWorkspace()  $to,
    Int()            $direction
  ) 
    is also<switch-workspace>
  {
    my MetaMotionDirection $d = $direction;

    meta_compositor_switch_workspace($!c, $from, $to, $d);
  }

  method sync_stack (
    MetaCompositor()  $!c,
    GList()           $stack,
                     :$raw         = False,
                     :$glist       = False
  ) 
    is also<sync-stack>
  {
    returnGList(
      meta_compositor_sync_stack($!c, $stack),
      $raw,
      $glist,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method sync_updates_frozen (
    MetaCompositor() $!c,
    MetaWindow()     $window
  ) 
    is also<sync-updates-frozen>
  {
    meta_compositor_sync_updates_frozen($!c, $window);
  }

  method sync_window_geometry (
    MetaCompositor() $!c,
    MetaWindow()     $window,
    Int()            $did_placement
  ) 
    is also<sync-window-geometry>
  {
    my gboolean $d = $did_placement;

    meta_compositor_sync_window_geometry($!c, $window, $d);
  }

  method unmanage (MetaCompositor() $!c) {
    meta_compositor_unmanage($!c);
  }

  method window_opacity_changed (
    MetaCompositor() $!c,
    MetaWindow()     $window
  ) 
    is also<window-opacity-changed>
  {
    meta_compositor_window_opacity_changed($!c, $window);
  }

  method window_shape_changed (
    MetaCompositor() $!c,
    MetaWindow()     $window
  ) 
    is also<window-shape-changed>
  {
    meta_compositor_window_shape_changed($!c, $window);
  }

}
