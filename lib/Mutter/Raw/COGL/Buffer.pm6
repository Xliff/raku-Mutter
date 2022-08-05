use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::COGL::Buffer;

### /usr/src/mutter-42.1/cogl/cogl/cogl-buffer.h

# sub _cogl_buffer_error_domain ()
#   returns uint32_t
#   is native(mutter-clutter)
#   is export
# { * }

sub cogl_is_buffer (MutterCoglBuffer $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_get_size (MutterCoglBuffer $buffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_get_update_hint (MutterCoglBuffer $buffer)
  returns MutterCoglBufferUpdateHint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_map (
  MutterCoglBuffer        $buffer,
  MutterCoglBufferAccess  $access,
  MutterCoglBufferMapHint $hints
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_map_range (
  MutterCoglBuffer        $buffer,
  size_t                  $offset,
  size_t                  $size,
  MutterCoglBufferAccess  $access,
  MutterCoglBufferMapHint $hints,
  CArray[Pointer[GError]] $error
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_set_data (
  MutterCoglBuffer $buffer,
  size_t           $offset,
  Pointer          $data,
  size_t           $size
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_set_update_hint (
  MutterCoglBuffer           $buffer,
  MutterCoglBufferUpdateHint $hint
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_buffer_unmap (MutterCoglBuffer $buffer)
  is native(mutter-clutter)
  is export
{ * }
