use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::COGL::Texture2d;

### /usr/src/mutter-42.1/cogl/cogl/cogl-texture-2d.h

sub cogl_egl_texture_2d_new_from_image (
  MutterCoglContext       $ctx,
  gint                    $width,
  gint                    $height,
  MutterCoglPixelFormat   $format,
  EGLImageKHR             $image,
  MutterCoglEglImageFlags $flags,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglTexture2d
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_is_texture_2d (MutterCoglTexture2d $object)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_texture_2d_egl_image_external_alloc_finish (
  MutterCoglTexture2d $tex_2d,
  Pointer             $user_data,
                      &destroy (gpointer)
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_2d_egl_image_external_bind (MutterCoglTexture2d $tex_2d)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_texture_2d_get_gtype ()
  returns GType
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_texture_2d_new_from_bitmap (MutterCoglBitmap $bitmap)
  returns MutterCoglTexture2d
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_texture_2d_new_from_data (
  MutterCoglContext       $ctx,
  gint                    $width,
  gint                    $height,
  MutterCoglPixelFormat   $format,
  gint                    $rowstride,
  CArray[uint8_t]         $data,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglTexture2d
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_texture_2d_new_from_egl_image_external (
  MutterCoglContext       $ctx,
  gint                    $width,
  gint                    $height,
                          &alloc (
                            MutterCoglTexture2d,
                            gpointer,
                            CArray[Pointer[GError]]
                          ),
  gpointer                $user_data,
                          &destroy (gpointer),
  CArray[Pointer[GError]] $error
)
  returns MutterCoglTexture2d
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_texture_2d_new_from_file (
  MutterCoglContext       $ctx,
  Str                     $filename,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglTexture2d
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_texture_2d_new_with_size (
  MutterCoglContext $ctx,
  gint              $width,
  gint              $height
)
  returns MutterCoglTexture2d
  is      native(mutter-clutter)
  is      export
{ * }
