use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::StaticClass;

class Mutter::COGL::PixelFormat {
  also does GLib::Roles::StaticClass;

  method get_bytes_per_pixel (Int() $format, Int() $plane) {
    my MutterCoglPixelFormat $f = $format;
    my gint                  $p = $plane;

    cogl_pixel_format_get_bytes_per_pixel($f, $p);
  }

  method get_n_planes (Int() $format) {
    my MutterCoglPixelFormat $f = $format;

    cogl_pixel_format_get_n_planes($f);
  }

  method to_string (Int() $format) {
    my MutterCoglPixelFormat $f = $format;

    cogl_pixel_format_to_string($f);
  }

}


### /usr/src/mutter-42.1/cogl/cogl/cogl-pixel-format.h

sub cogl_pixel_format_get_bytes_per_pixel (
  MutterCoglPixelFormat $format,
  gint                  $plane
)
  returns gint
  is native(mutter-cogl)
  is export
{ * }

sub cogl_pixel_format_get_n_planes (MutterCoglPixelFormat $format)
  returns gint
  is native(mutter-cogl)
  is export
{ * }

sub cogl_pixel_format_to_string (MutterCoglPixelFormat $format)
  returns Str
  is native(mutter-cogl)
  is export
{ * }
