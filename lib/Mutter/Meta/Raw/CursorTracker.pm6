use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::CursorTracker;

### /usr/src/mutter-42.1/src/meta/meta-cursor-tracker.h

sub meta_cursor_tracker_get_for_display (MetaDisplay $display)
  returns MetaCursorTracker
  is native(mutter)
  is export
{ * }

sub meta_cursor_tracker_get_hot (
  MetaCursorTracker $tracker,
  gint              $x        is rw,
  gint              $y        is rw
)
  is native(mutter)
  is export
{ * }

sub meta_cursor_tracker_get_pointer (
  MetaCursorTracker   $tracker,
  graphene_point_t    $coords,
  ClutterModifierType $mods
)
  is native(mutter)
  is export
{ * }

sub meta_cursor_tracker_get_pointer_visible (MetaCursorTracker $tracker)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_cursor_tracker_get_scale (MetaCursorTracker $tracker)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub meta_cursor_tracker_get_sprite (MetaCursorTracker $tracker)
  returns CoglTexture
  is native(mutter)
  is export
{ * }

sub meta_cursor_tracker_set_pointer_visible (
  MetaCursorTracker $tracker,
  gboolean          $visible
)
  is native(mutter)
  is export
{ * }
