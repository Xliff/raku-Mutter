use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Util;


### /usr/src/mutter-42.1/src/meta/util.h

sub meta_accelerator_name (
  MutterClutterModifierType $accelerator_mods,
  gint                      $accelerator_key
)
  returns Str
  is      native(mutter)
  is      export
{ * }

sub meta_add_clutter_debug_flags (
  ClutterDebugFlag     $debug_flags,
  ClutterDrawDebugFlag $draw_flags,
  ClutterPickDebugFlag $pick_flags
)
  is native(mutter)
  is export
{ * }

sub meta_add_debug_paint_flag (MetaDebugPaintFlag $flag)
  is native(mutter)
  is export
{ * }

sub meta_add_verbose_topic (MetaDebugTopic $topic)
  is native(mutter)
  is export
{ * }

sub meta_bug (Str $format)
  is native(mutter)
  is export
{ * }

sub meta_external_binding_name_for_action (guint $keybinding_action)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_fatal (Str $format)
  is native(mutter)
  is export
{ * }

sub meta_frame_type_to_string (MetaFrameType $type)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_g_utf8_strndup (Str $src, gsize $n)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_get_clutter_debug_flags (
  ClutterDebugFlag     $debug_flags,
  ClutterDrawDebugFlag $draw_flags,
  ClutterPickDebugFlag $pick_flags
)
  is native(mutter)
  is export
{ * }

sub meta_get_debug_paint_flags ()
  returns MetaDebugPaintFlag
  is native(mutter)
  is export
{ * }

sub meta_get_locale_direction ()
  returns MetaLocaleDirection
  is native(mutter)
  is export
{ * }

sub meta_gravity_to_string (MetaGravity $gravity)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_is_syncing ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_is_topic_enabled (MetaDebugTopic $topic)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_is_verbose ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_is_wayland_compositor ()
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_pop_no_msg_prefix ()
  is native(mutter)
  is export
{ * }

sub meta_push_no_msg_prefix ()
  is native(mutter)
  is export
{ * }

sub meta_remove_clutter_debug_flags (
  ClutterDebugFlag     $debug_flags,
  ClutterDrawDebugFlag $draw_flags,
  ClutterPickDebugFlag $pick_flags
)
  is native(mutter)
  is export
{ * }

sub meta_remove_debug_paint_flag (MetaDebugPaintFlag $flag)
  is native(mutter)
  is export
{ * }

sub meta_remove_verbose_topic (MetaDebugTopic $topic)
  is native(mutter)
  is export
{ * }

sub meta_show_dialog (
  Str    $type,
  Str    $message,
  Str    $timeout,
  Str    $display,
  Str    $ok_text,
  Str    $cancel_text,
  Str    $icon_name,
  gint   $transient_for,
  GSList $columns,
  GSList $entries
)
  returns GPid
  is native(mutter)
  is export
{ * }

sub meta_topic_to_string (MetaDebugTopic $topic)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_unsigned_long_equal (CArray[gulong] $v1, CArray[gulong] $v2)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_unsigned_long_hash (CArray[gulong] $v)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_warning (Str $format)
  is native(mutter)
  is export
{ * }
