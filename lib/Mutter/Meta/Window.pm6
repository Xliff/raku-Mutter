use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Window;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterMetaWindowAncestry is export of Mu
  where MutterMetaWindow | GObject;

class Mutter::Meta::Window {
  also does GLib::Roles::Object;

  has MutterMetaWindow $!mw is implementor;

  submethod BUILD ( :$mutter-meta-win ) {
    self.setMutterMetaWindow($mutter-meta-win)
      if $mutter-meta-win
  }

  method setMutterMetaWindow (MutterMetaWindowAncestry $_) {
    my $to-parent;

    $!mw = do {
      when MutterMetaWindow {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaWindow, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaWindow
    is also<MutterMetaWindow>
  { $!mw }

  multi method new (MutterMetaWindowAncestry $mutter-meta-win, :$ref = True) {
    return unless $mutter-meta-win;

    my $o = self.bless( :$mutter-meta-win );
    $o.ref if $ref;
    $o;
  }

  # Type: boolean
  method above is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('above', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'above does not allow writing'
      }
    );
  }

  # Type: boolean
  method appears-focused is rw  is g-property is also<appears_focused> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('appears-focused', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'appears-focused does not allow writing'
      }
    );
  }

  # Type: boolean
  method decorated is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('decorated', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'decorated does not allow writing'
      }
    );
  }

  # Type: boolean
  method demands-attention is rw  is g-property is also<demands_attention> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('demands-attention', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'demands-attention does not allow writing'
      }
    );
  }

  # Type: MutterDisplay
  method display ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Meta::Display.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('display', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Meta::Display.getTypePair
        );
      },
      STORE => -> $, MutterMetaDisplay() $val is copy {
        $gv.object = $val;
        self.prop_set('display', $gv);
      }
    );
  }

  # Type: int
  method effect is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('effect', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('effect', $gv);
      }
    );
  }

  # Type: boolean
  method fullscreen is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fullscreen', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'fullscreen does not allow writing'
      }
    );
  }

  # Type: string
  method gtk-app-menu-object-path
    is rw
    is g-property
    is also<gtk_app_menu_object_path>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('gtk-app-menu-object-path', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'gtk-app-menu-object-path does not allow writing'
      }
    );
  }

  # Type: string
  method gtk-application-id
    is rw
    is g-property
    is also<gtk_application_id>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('gtk-application-id', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'gtk-application-id does not allow writing'
      }
    );
  }

  # Type: string
  method gtk-application-object-path
    is rw
    is g-property
    is also<gtk_application_object_path>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('gtk-application-object-path', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'gtk-application-object-path does not allow writing'
      }
    );
  }

  # Type: string
  method gtk-menubar-object-path
    is rw
    is g-property
    is also<gtk_menubar_object_path>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('gtk-menubar-object-path', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'gtk-menubar-object-path does not allow writing'
      }
    );
  }

  # Type: string
  method gtk-unique-bus-name
    is rw
    is g-property
    is also<gtk_unique_bus_name>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('gtk-unique-bus-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'gtk-unique-bus-name does not allow writing'
      }
    );
  }

  # Type: string
  method gtk-window-object-path
    is rw
    is g-property
    is also<gtk_window_object_path>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('gtk-window-object-path', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'gtk-window-object-path does not allow writing'
      }
    );
  }

  # Type: pointer
  method icon is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon', $gv);
        $gv.pointer;
      },
      STORE => -> $,  $val is copy {
        warn 'icon does not allow writing'
      }
    );
  }

  # Type: boolean
  method is-alive is rw  is g-property is also<is_alive> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-alive', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-alive does not allow writing'
      }
    );
  }

  # Type: boolean
  method maximized-horizontally
    is rw
    is g-property
    is also<maximized_horizontally>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('maximized-horizontally', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'maximized-horizontally does not allow writing'
      }
    );
  }

  # Type: boolean
  method maximized-vertically
    is rw
    is g-property
    is also<maximized_vertically>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('maximized-vertically', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'maximized-vertically does not allow writing'
      }
    );
  }

  # Type: pointer
  method mini-icon is rw  is g-property is also<mini_icon> {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('mini-icon', $gv);
        $gv.pointer;
      },
      STORE => -> $,  $val is copy {
        warn 'mini-icon does not allow writing'
      }
    );
  }

  # Type: boolean
  method minimized is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('minimized', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'minimized does not allow writing'
      }
    );
  }

  # Type: string
  method mutter-hints is rw  is g-property is also<mutter_hints> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('mutter-hints', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'mutter-hints does not allow writing'
      }
    );
  }

  # Type: boolean
  method on-all-workspaces is rw  is g-property is also<on_all_workspaces> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('on-all-workspaces', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'on-all-workspaces does not allow writing'
      }
    );
  }

  # Type: boolean
  method resizeable is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('resizeable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'resizeable does not allow writing'
      }
    );
  }

  # Type: boolean
  method skip-taskbar is rw  is g-property is also<skip_taskbar> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('skip-taskbar', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'skip-taskbar does not allow writing'
      }
    );
  }

  # Type: MutterWindowSuspendState
  method suspend-state is rw  is g-property is also<suspend_state> {
    my $gv = GLib::Value.new( MutterWindowSuspendState );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('suspend-state', $gv);
        $gv.MutterWindowSuspendState;
      },
      STORE => -> $,  $val is copy {
        warn 'suspend-state does not allow writing'
      }
    );
  }

  # Type: string
  method title is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'title does not allow writing'
      }
    );
  }

  # Type: boolean
  method urgent is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('urgent', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'urgent does not allow writing'
      }
    );
  }

  # Type: uint
  method user-time is rw  is g-property is also<user_time> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('user-time', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        warn 'user-time does not allow writing'
      }
    );
  }

  # Type: MutterWindowType
  method window-type ( :$enum = True )
    is rw
    is g-property
    is also<window_type>
  {
    my $gv = GLib::Value.new( MutterMetaWindowType );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('window-type', $gv);
        my $e = $gv.enum;
        return $e unless $enum;
        MutterMetaWindowTypeEnum($e);
      },
      STORE => -> $,  $val is copy {
        warn 'window-type does not allow writing'
      }
    );
  }

  # Type: string
  method wm-class is rw  is g-property is also<wm_class> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('wm-class', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'wm-class does not allow writing'
      }
    );
  }

  # Type: ulong
  method xwindow is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_ULONG );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('xwindow', $gv);
        $gv.ulong;
      },
      STORE => -> $, Int() $val is copy {
        $gv.ulong = $val;
        self.prop_set('xwindow', $gv);
      }
    );
  }

  method activate (Int() $current_time) {
    my guint32 $c = $current_time;

    meta_window_activate($!mw, $current_time);
  }

  method activate_with_workspace (
    Int()                 $current_time,
    MutterMetaWorkspace() $workspace
  )
    is also<activate-with-workspace>
  {
    my guint32 $c = $current_time;

    meta_window_activate_with_workspace($!mw, $c, $workspace);
  }

  method allows_move is also<allows-move> {
    meta_window_allows_move($!mw);
  }

  method allows_resize is also<allows-resize> {
    meta_window_allows_resize($!mw);
  }

  method real_appears_focused is also<real-appears-focused> {
    meta_window_appears_focused($!mw);
  }

  method begin_grab_op (Int() $op, Int() $frame_action, Int() $timestamp)
    is also<begin-grab-op>
  {
    my MutterMetaGrabOp $o = $op;
    my gboolean         $f = $frame_action.so.Int;
    my guint32          $t = $timestamp;

    meta_window_begin_grab_op($!mw, $o, $f, $t);
  }

  method can_close is also<can-close> {
    meta_window_can_close($!mw);
  }

  method can_maximize is also<can-maximize> {
    meta_window_can_maximize($!mw);
  }

  method can_minimize is also<can-minimize> {
    meta_window_can_minimize($!mw);
  }

  method can_shade is also<can-shade> {
    meta_window_can_shade($!mw);
  }

  method change_workspace (MutterMetaWorkspace() $workspace)
    is also<change-workspace>
  {
    meta_window_change_workspace($!mw, $workspace);
  }

  method change_workspace_by_index (Int() $space_index, Int() $append)
    is also<change-workspace-by-index>
  {
    my gint     $s = $space_index;
    my gboolean $a = $append.so.Int;

    meta_window_change_workspace_by_index($!mw, $space_index, $append);
  }

  method check_alive (Int() $timestamp) is also<check-alive> {
    my guint32 $t = $timestamp;

    meta_window_check_alive($!mw, $t);
  }

  method client_rect_to_frame_rect (
    MutterMetaRectangle() $client_rect,
    MutterMetaRectangle() $frame_rect
  )
    is also<client-rect-to-frame-rect>
  {
    meta_window_client_rect_to_frame_rect($!mw, $client_rect, $frame_rect);
  }

  method delete (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_delete($!mw, $t);
  }

  method find_root_ancestor ( :$raw = False ) is also<find-root-ancestor> {
    propReturnObject(
      meta_window_find_root_ancestor($!mw),
      $raw,
      |self.getTypePair
    );
  }

  method focus (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_focus($!mw, $t);
  }

  method foreach_ancestor (&func, gpointer $user_data = gpointer)
    is also<foreach-ancestor>
  {
    meta_window_foreach_ancestor($!mw, &func, $user_data);
  }

  method foreach_transient (&func, gpointer $user_data = gpointer)
    is also<foreach-transient>
  {
    meta_window_foreach_transient($!mw, &func, $user_data);
  }

  method frame_rect_to_client_rect (
    MutterMetaRectangle() $frame_rect,
    MutterMetaRectangle() $client_rect
  )
    is also<frame-rect-to-client-rect>
  {
    meta_window_frame_rect_to_client_rect($!mw, $frame_rect, $client_rect);
  }

  method get_buffer_rect (MutterMetaRectangle() $rect)
    is also<get-buffer-rect>
  {
    meta_window_get_buffer_rect($!mw, $rect);
  }

  method get_client_machine
    is also<get-client-machine>
  {
    meta_window_get_client_machine($!mw);
  }

  method get_client_type
    is also<get-client-type>
  {
    meta_window_get_client_type($!mw);
  }

  method get_compositor_private ( :$raw = False )
    is also<get-compositor-private>
  {
    propReturnObject(
      meta_window_get_compositor_private($!mw),
      $raw,
      |GLib::Object.getTypePair
    );
  }

  method get_description
    is also<get-description>
  {
    meta_window_get_description($!mw);
  }

  method get_display ( :$raw = False )
    is also<get-display>
  {
    propReturnObject(
      meta_window_get_display($!mw),
      $raw,
      |Mutter::Meta::Display.getTypePair
    );
  }

  method get_frame
    is also<get-frame>
  {
    meta_window_get_frame($!mw);
  }

  # cairo_region_t - No object yet!
  method get_frame_bounds ( :$raw = False )
    is also<get-frame-bounds>
  {
    propReturnObject(
      meta_window_get_frame_bounds($!mw),
      $raw,
      cairo_region_t,
    )
  }

  proto method get_frame_rect (|)
    is also<get-frame-rect>
  { * }

  multi method get_frame_rect {
    samewith(MutterMetaRectangle.new);
  }
  multi method get_frame_rect (MutterMetaRectangle() $rect) {
    meta_window_get_frame_rect($!mw, $rect);
    $rect;
  }

  method get_frame_type ( :$enum = True )
    is also<get-frame-type>
  {
    my $ft = meta_window_get_frame_type($!mw);
    return $ft unless $enum;
    MutterMetaFrameTypeEnum($ft);
  }

  method get_gtk_app_menu_object_path
    is also<get-gtk-app-menu-object-path>
  {
    meta_window_get_gtk_app_menu_object_path($!mw);
  }

  method get_gtk_application_id
    is also<get-gtk-application-id>
  {
    meta_window_get_gtk_application_id($!mw);
  }

  method get_gtk_application_object_path
    is also<get-gtk-application-object-path>
  {
    meta_window_get_gtk_application_object_path($!mw);
  }

  method get_gtk_menubar_object_path
    is also<get-gtk-menubar-object-path>
  {
    meta_window_get_gtk_menubar_object_path($!mw);
  }

  method get_gtk_theme_variant
    is also<get-gtk-theme-variant>
  {
    meta_window_get_gtk_theme_variant($!mw);
  }

  method get_gtk_unique_bus_name
    is also<get-gtk-unique-bus-name>
  {
    meta_window_get_gtk_unique_bus_name($!mw);
  }

  method get_gtk_window_object_path
    is also<get-gtk-window-object-path>
  {
    meta_window_get_gtk_window_object_path($!mw);
  }

  method get_icon_geometry (MutterMetaRectangle() $rect)
    is also<get-icon-geometry>
  {
    meta_window_get_icon_geometry($!mw, $rect);
  }

  method get_id
    is also<get-id>
  {
    meta_window_get_id($!mw);
  }

  method get_layer
    is also<get-layer>
  {
    meta_window_get_layer($!mw);
  }

  method get_maximized
    is also<get-maximized>
  {
    so meta_window_get_maximized($!mw);
  }

  method get_monitor
    is also<get-monitor>
  {
    meta_window_get_monitor($!mw);
  }

  method get_mutter_hints
    is also<get-mutter-hints>
  {
    meta_window_get_mutter_hints($!mw);
  }

  method get_pid
    is also<get-pid>
  {
    meta_window_get_pid($!mw);
  }

  method get_role
    is also<get-role>
  {
    meta_window_get_role($!mw);
  }

  method get_sandboxed_app_id
    is also<get-sandboxed-app-id>
  {
    meta_window_get_sandboxed_app_id($!mw);
  }

  method get_stable_sequence
    is also<get-stable-sequence>
  {
    meta_window_get_stable_sequence($!mw);
  }

  method get_startup_id
    is also<get-startup-id>
  {
    meta_window_get_startup_id($!mw);
  }

  method get_tile_match ( :$raw = False )
    is also<get-tile-match>
  {
    propReturnObject(
      meta_window_get_tile_match($!mw),
      $raw,
      |self.getTypePair
    );
  }

  method get_title
    is also<get-title>
  {
    meta_window_get_title($!mw);
  }

  method get_transient_for ( :$raw = False )
    is also<get-transient-for>
  {
    propReturnObject(
      meta_window_get_transient_for($!mw),
      $raw,
      |self.getTypePair
    )
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_window_get_type, $n, $t );
  }

  method get_user_time
    is also<get-user-time>
  {
    meta_window_get_user_time($!mw);
  }

  method get_window_type ( :$enum = True )
    is also<get-window-type>
  {
    my $wt = meta_window_get_window_type($!mw);
    return $wt unless $enum;
    MutterMetaWindowTypeEnum($wt);
  }

  method get_wm_class
    is also<get-wm-class>
  {
    meta_window_get_wm_class($!mw);
  }

  method get_wm_class_instance
    is also<get-wm-class-instance>
  {
    meta_window_get_wm_class_instance($!mw);
  }

  method get_work_area_all_monitors (MutterMetaRectangle() $area)
    is also<get-work-area-all-monitors>
  {
    meta_window_get_work_area_all_monitors($!mw, $area);
  }

  method get_work_area_current_monitor (MutterMetaRectangle() $area)
    is also<get-work-area-current-monitor>
  {
    meta_window_get_work_area_current_monitor($!mw, $area);
  }

  method get_work_area_for_monitor (
    Int()                 $which_monitor,
    MutterMetaRectangle() $area
  )
    is also<get-work-area-for-monitor>
  {
    my gint $w = $which_monitor;

    meta_window_get_work_area_for_monitor($!mw, $w, $area);
  }

  method get_workspace ( :$raw = False ) is also<get-workspace> {
    propReturnObject(
      meta_window_get_workspace($!mw),
      $raw,
      |Mutter::Meta::Workspace.getTypePair
    )
  }

  method get_xwindow is also<get-xwindow> {
    meta_window_get_xwindow($!mw);
  }

  method has_attached_dialogs is also<has-attached-dialogs> {
    so meta_window_has_attached_dialogs($!mw);
  }

  method has_focus is also<has-focus> {
    so meta_window_has_focus($!mw);
  }

  method is_above is also<is-above> {
    so meta_window_is_above($!mw);
  }

  method is_always_on_all_workspaces is also<is-always-on-all-workspaces> {
    so meta_window_is_always_on_all_workspaces($!mw);
  }

  method is_ancestor_of_transient (MutterMetaWindow() $transient)
    is also<is-ancestor-of-transient>
  {
    so meta_window_is_ancestor_of_transient($!mw, $transient);
  }

  method is_attached_dialog is also<is-attached-dialog> {
    so meta_window_is_attached_dialog($!mw);
  }

  method is_client_decorated is also<is-client-decorated> {
    so meta_window_is_client_decorated($!mw);
  }

  method is_fullscreen is also<is-fullscreen> {
    so meta_window_is_fullscreen($!mw);
  }

  method is_hidden is also<is-hidden> {
    so meta_window_is_hidden($!mw);
  }

  method is_monitor_sized is also<is-monitor-sized> {
    so meta_window_is_monitor_sized($!mw);
  }

  method is_on_all_workspaces is also<is-on-all-workspaces> {
    so meta_window_is_on_all_workspaces($!mw);
  }

  method is_on_primary_monitor is also<is-on-primary-monitor> {
    so meta_window_is_on_primary_monitor($!mw);
  }

  method is_override_redirect is also<is-override-redirect> {
    so meta_window_is_override_redirect($!mw);
  }

  method is_remote is also<is-remote> {
    so meta_window_is_remote($!mw);
  }

  method is_screen_sized is also<is-screen-sized> {
    so meta_window_is_screen_sized($!mw);
  }

  method is_shaded is also<is-shaded> {
    so meta_window_is_shaded($!mw);
  }

  method is_skip_taskbar is also<is-skip-taskbar> {
    so meta_window_is_skip_taskbar($!mw);
  }

  method kill {
    meta_window_kill($!mw);
  }

  method located_on_workspace (MutterMetaWorkspace() $workspace)
    is also<located-on-workspace>
  {
    meta_window_located_on_workspace($!mw, $workspace);
  }

  method lower {
    meta_window_lower($!mw);
  }

  method lower_with_transients (Int() $timestamp)
    is also<lower-with-transients>
  {
    my guint32 $t = $timestamp;

    meta_window_lower_with_transients($!mw, $t);
  }

  method make_above is also<make-above> {
    meta_window_make_above($!mw);
  }

  method make_fullscreen is also<make-fullscreen> {
    meta_window_make_fullscreen($!mw);
  }

  method maximize (Int() $directions) {
    my MutterMetaMaximizeFlags $d = $directions;

    meta_window_maximize($!mw, $d);
  }

  method minimize {
    meta_window_minimize($!mw);
  }

  method move_frame (Int() $user_op, Int() $root_x_nw, Int() $root_y_nw)
    is also<move-frame>
  {
    my gboolean  $u        =  $user_op.so.Int;
    my gint     ($rx, $ry) = ($root_x_nw, $root_y_nw);

    meta_window_move_frame($!mw, $u, $rx, $ry);
  }

  method move_resize_frame (
    Int() $user_op,
    Int() $root_x_nw,
    Int() $root_y_nw,
    Int() $w,
    Int() $h
  )
    is also<move-resize-frame>
  {
    my gboolean  $u                  = $user_op.so.Int;
    my gint     ($rx, $ry, $ww, $hh) = ($root_x_nw, $root_y_nw, $w, $h);

    meta_window_move_resize_frame($!mw, $user_op, $rx, $ry, $ww, $hh);
  }

  method move_to_monitor (Int() $monitor) is also<move-to-monitor> {
    my gint $m = $monitor;

    meta_window_move_to_monitor($!mw, $m);
  }

  method raise {
    meta_window_raise($!mw);
  }

  method set_compositor_private (GObject() $priv)
    is also<set-compositor-private>
  {
    meta_window_set_compositor_private($!mw, $priv);
  }

  method set_demands_attention is also<set-demands-attention> {
    meta_window_set_demands_attention($!mw);
  }

  method set_icon_geometry (MutterMetaRectangle() $rect)
    is also<set-icon-geometry>
  {
    meta_window_set_icon_geometry($!mw, $rect);
  }

  method shade (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_shade($!mw, $t);
  }

  method shove_titlebar_onscreen is also<shove-titlebar-onscreen> {
    meta_window_shove_titlebar_onscreen($!mw);
  }

  method showing_on_its_workspace is also<showing-on-its-workspace> {
    meta_window_showing_on_its_workspace($!mw);
  }

  method stick {
    meta_window_stick($!mw);
  }

  method titlebar_is_onscreen is also<titlebar-is-onscreen> {
    meta_window_titlebar_is_onscreen($!mw);
  }

  method unmake_above is also<unmake-above> {
    meta_window_unmake_above($!mw);
  }

  method unmake_fullscreen is also<unmake-fullscreen> {
    meta_window_unmake_fullscreen($!mw);
  }

  method unmaximize (Int() $directions) {
    my MutterMetaMaximizeFlags $d = $directions;

    meta_window_unmaximize($!mw, $d);
  }

  method unminimize {
    meta_window_unminimize($!mw);
  }

  method unset_demands_attention is also<unset-demands-attention> {
    meta_window_unset_demands_attention($!mw);
  }

  method unshade (Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_window_unshade($!mw, $timestamp);
  }

  method unstick {
    meta_window_unstick($!mw);
  }

}
