use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Image;

### /usr/src/mutter-42.1/clutter/clutter/clutter-image.h

sub clutter_image_error_quark ()
  returns GQuark
  is native(mutter-clutter)
  is export
{ * }

sub clutter_image_get_texture (MutterClutterImage $image)
  returns MutterCoglTexture
  is native(mutter-clutter)
  is export
{ * }

sub clutter_image_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_image_new ()
  returns MutterClutterContent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_image_set_area (
  MutterClutterImage      $image,
  CArray[guint8]          $data,
  MutterCoglPixelFormat   $pixel_format,
  cairo_rectangle_int_t   $rect,
  guint                   $row_stride,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_image_set_bytes (
  MutterClutterImage      $image,
  GBytes                  $data,
  MutterCoglPixelFormat   $pixel_format,
  guint                   $width,
  guint                   $height,
  guint                   $row_stride,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_image_set_data (
  MutterClutterImage      $image,
  CArray[guint8]          $data,
  MutterCoglPixelFormat   $pixel_format,
  guint                   $width,
  guint                   $height,
  guint                   $row_stride,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
