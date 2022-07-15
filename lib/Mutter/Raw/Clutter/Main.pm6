use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Pango::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Main;

constant GSourceFunc is export := Pointer;

### /usr/src/mutter-42.1/clutter/clutter/clutter-main.h

sub clutter_add_debug_flags (
  MutterClutterDebugFlag     $debug_flags,
  MutterClutterDrawDebugFlag $draw_flags,
  MutterClutterPickDebugFlag $pick_flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_debug_set_max_render_time_constant (
  gint $max_render_time_constant_us
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_disable_accessibility ()
  is native(mutter-clutter)
  is export
{ * }

sub clutter_do_event (MutterClutterEvent $event)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_accessibility_enabled ()
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_default_text_direction ()
  returns MutterClutterTextDirection
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_font_map ()
  returns PangoFontMap
  is native(mutter-clutter)
  is export
{ * }

sub clutter_remove_debug_flags (
  MutterClutterDebugFlag     $debug_flags,
  MutterClutterDrawDebugFlag $draw_flags,
  MutterClutterPickDebugFlag $pick_flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_add_idle (GSourceFunc $func, gpointer $data)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_add_idle_full (
  gint           $priority,
  GSourceFunc    $func,
  gpointer       $data,
                 &notify (gpointer)
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_add_repaint_func (
  GSourceFunc $func,
  gpointer    $data,
              &notify (gpointer)
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_add_repaint_func_full (
  MutterClutterRepaintFlags $flags,
  GSourceFunc               $func,
  gpointer                  $data,
                            &notify (gpointer)
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_add_timeout (
  guint       $interval,
  GSourceFunc $func,
  gpointer    $data
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_add_timeout_full (
  gint        $priority,
  guint       $interval,
  GSourceFunc $func,
  gpointer    $data,
              &notify (gpointer)
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_threads_remove_repaint_func (guint $handle_id)
  is native(mutter-clutter)
  is export
{ * }
