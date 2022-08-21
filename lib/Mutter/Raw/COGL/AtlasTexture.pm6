use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::COGL::AtlasTexture;

### /usr/src/mutter-42.1/cogl/cogl/cogl-atlas-texture.h

sub cogl_is_atlas_texture (MutterCoglAtlasTexture $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_atlas_texture_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_atlas_texture_new_from_bitmap (MutterCoglBitmap $bmp)
  returns MutterCoglAtlasTexture
  is native(mutter-clutter)
  is export
{ * }

sub cogl_atlas_texture_new_from_data (
  MutterCoglContext       $ctx,
  gint                    $width,
  gint                    $height,
  MutterCoglPixelFormat   $format,
  gint                    $rowstride,
  CArray[uint8_t]         $data,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglAtlasTexture
  is native(mutter-clutter)
  is export
{ * }

sub cogl_atlas_texture_new_from_file (
  MutterCoglContext       $ctx,
  Str                     $filename,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglAtlasTexture
  is native(mutter-clutter)
  is export
{ * }

sub cogl_atlas_texture_new_with_size (
  MutterCoglContext $ctx,
  gint              $width,
  gint              $height
)
  returns MutterCoglAtlasTexture
  is native(mutter-clutter)
  is export
{ * }
