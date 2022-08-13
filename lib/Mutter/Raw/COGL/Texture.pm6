use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::COGL::Texture;

### /usr/src/mutter-42.1/cogl/cogl/cogl-texture.h

sub cogl_texture_allocate (
  MutterCoglTexture       $texture,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_is_texture (MutterCoglTexture $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_error_quark ()
  returns uint32_t
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_components (MutterCoglTexture $texture)
  returns MutterCoglTextureComponents
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_data (
  MutterCoglTexture     $texture,
  MutterCoglPixelFormat $format,
  gint                  $rowstride,
  CArray[uint8_t]       $data
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_gl_texture (
  MutterCoglTexture $texture,
  gint              $out_gl_handle is rw,
  gint              $out_gl_target is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_height (MutterCoglTexture $texture)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_max_waste (MutterCoglTexture $texture)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_premultiplied (MutterCoglTexture $texture)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_get_width (MutterCoglTexture $texture)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_is_get_data_supported (MutterCoglTexture $texture)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_is_sliced (MutterCoglTexture $texture)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_set_components (
  MutterCoglTexture           $texture,
  MutterCoglTextureComponents $components
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_set_data (
  MutterCoglTexture       $texture,
  MutterCoglPixelFormat   $format,
  gint                    $rowstride,
  uint8_t                 $data,
  gint                    $level,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_set_premultiplied (
  MutterCoglTexture $texture,
  gboolean          $premultiplied
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_set_region (
  MutterCoglTexture     $texture,
  gint                  $src_x,
  gint                  $src_y,
  gint                  $dst_x,
  gint                  $dst_y,
  gint                  $dst_width,
  gint                  $dst_height,
  gint                  $width,
  gint                  $height,
  MutterCoglPixelFormat $format,
  gint                  $rowstride,
  CArray[uint8_t]       $data
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_set_region_from_bitmap (
  MutterCoglTexture $texture,
  gint              $src_x,
  gint              $src_y,
  gint              $dst_x,
  gint              $dst_y,
  gint              $dst_width,
  gint              $dst_height,
  MutterCoglBitmap  $bitmap
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
