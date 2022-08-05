use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::COGL::Bitmap;

### /usr/src/mutter-42.1/cogl/cogl/cogl-bitmap.h

sub cogl_is_bitmap (Pointer $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_error_quark ()
  returns uint32_t
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_buffer (MutterCoglBitmap $bitmap)
  returns MutterCoglPixelBuffer
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_format (MutterCoglBitmap $bitmap)
  returns MutterCoglPixelFormat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_height (MutterCoglBitmap $bitmap)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_rowstride (MutterCoglBitmap $bitmap)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_size_from_file (
  Str  $filename,
  gint $width     is rw,
  gint $height    is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_get_width (MutterCoglBitmap $bitmap)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_new_for_data (
  MutterCoglContext     $context,
  gint                  $width,
  gint                  $height,
  MutterCoglPixelFormat $format,
  gint                  $rowstride,
  CArray[uint8_t]       $data
)
  returns MutterCoglBitmap
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_new_from_buffer (
  MutterCoglBuffer      $buffer,
  MutterCoglPixelFormat $format,
  gint                  $width,
  gint                  $height,
  gint                  $rowstride,
  gint                  $offset
)
  returns MutterCoglBitmap
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_new_from_file (Str $filename, CArray[Pointer[GError]] $error)
  returns MutterCoglBitmap
  is native(mutter-clutter)
  is export
{ * }

sub cogl_bitmap_new_with_size (
  MutterCoglContext     $context,
  gint                  $width,
  gint                  $height,
  MutterCoglPixelFormat $format
)
  returns MutterCoglBitmap
  is native(mutter-clutter)
  is export
{ * }
