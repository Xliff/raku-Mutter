use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::COGL::Texture;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

class Mutter::COGL::Texture is Mutter::COGL::Object {
  has MutterCoglTexture $!mct is implementor;

  method allocate (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $a = cogl_texture_allocate($!mct, $error);
    set_error($error);
    $a;
  }

  method cogl_is_texture {
    so cogl_is_texture($!mct);
  }

  method error_quark is static {
    cogl_texture_error_quark();
  }

  method get_components {
    cogl_texture_get_components($!mct);
  }

  proto method get_data (|)
  { * }

  multi method get_data (
    Int()  $format,
    Int()  $rowstride,
          :$raw        = False
  ) {
    samewith($format, $rowstride, newCArray(uint8_t) );
  }
  multi method get_data (
    Int()            $format,
    Int()            $rowstride,
    CArray[uint8_t]  $data,
                    :$raw        = False
  ) {
    my MutterCoglPixelFormat $f = $format;
    my gint                  $r = $rowstride;

    cogl_texture_get_data($!mct, $f, $r, $data);
    return $data if $raw;
    $data ?? Buf.new($data) !! Nil;
  }

  proto method get_gl_texture (|)
  { * }

  multi method get_gl_texture {
    samewith($, $);
  }
  multi method get_gl_texture (
    $out_gl_handle is rw,
    $out_gl_target is rw
  ) {
    my gint ($oh, $ot) = 0 xx 2;

    cogl_texture_get_gl_texture($!mct, $oh, $ot);
    ($out_gl_handle, $out_gl_target) = ($oh, $ot);
  }

  method get_gtype {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_texture_get_gtype, $n, $t );
  }

  method get_height {
    cogl_texture_get_height($!mct);
  }

  method get_max_waste {
    cogl_texture_get_max_waste($!mct);
  }

  method get_premultiplied {
    so cogl_texture_get_premultiplied($!mct);
  }

  method get_width {
    cogl_texture_get_width($!mct);
  }

  method is_get_data_supported {
    so cogl_texture_is_get_data_supported($!mct);
  }

  method is_sliced {
    so cogl_texture_is_sliced($!mct);
  }

  method set_components (MutterCoglTextureComponents $components) {
    cogl_texture_set_components($!mct, $components);
  }

  method set_data (
    MutterCoglPixelFormat   $format,
    gint                    $rowstride,
    CArray[uint8_t]         $data,
    gint                    $level,
    CArray[Pointer[GError]] $error = gerror
  ) {
    cogl_texture_set_data($!mct, $format, $rowstride, $data, $level, $error);
  }

  method set_premultiplied (Int() $premultiplied) {
    my gboolean $p = $premultiplied.so.Int;

    cogl_texture_set_premultiplied($!mct, $p);
  }

  method set_region (
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
  ) {
    cogl_texture_set_region($!mct, $src_x, $src_y, $dst_x, $dst_y, $dst_width, $dst_height, $width, $height, $format, $rowstride, $data);
  }

  method set_region_from_bitmap (
    gint             $src_x,
    gint             $src_y,
    gint             $dst_x,
    gint             $dst_y,
    gint             $dst_width,
    gint             $dst_height,
    MutterCoglBitmap $bitmap
  ) {
    cogl_texture_set_region_from_bitmap($!mct, $src_x, $src_y, $dst_x, $dst_y, $dst_width, $dst_height, $bitmap);
  }

}
