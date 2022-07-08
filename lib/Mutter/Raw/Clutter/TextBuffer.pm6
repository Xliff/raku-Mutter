use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::TextBuffer;

### /usr/src/mutter-42.1/clutter/clutter/clutter-text-buffer.h

sub clutter_text_buffer_delete_text (
  MutterClutterTextBuffer $buffer,
  guint                   $position,
  gint                    $n_chars
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_emit_deleted_text (
  MutterClutterTextBuffer $buffer,
  guint                   $position,
  guint                   $n_chars
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_emit_inserted_text (
  MutterClutterTextBuffer $buffer,
  guint                   $position,
  Str                     $chars,
  guint                   $n_chars
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_get_bytes (MutterClutterTextBuffer $buffer)
  returns gsize
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_get_length (MutterClutterTextBuffer $buffer)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_get_max_length (MutterClutterTextBuffer $buffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_get_text (MutterClutterTextBuffer $buffer)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_insert_text (
  MutterClutterTextBuffer $buffer,
  guint                   $position,
  CArray[uint8]           $chars,
  gint                    $n_chars
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_new ()
  returns MutterClutterTextBuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_new_with_text (CArray[uint8] $text, gssize $text_len)
  returns MutterClutterTextBuffer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_set_max_length (
  MutterClutterTextBuffer $buffer,
  gint                    $max_length
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_text_buffer_set_text (
  MutterClutterTextBuffer $buffer,
  CArray[uint8]           $chars,
  gint                    $n_chars
)
  is native(mutter-clutter)
  is export
{ * }
