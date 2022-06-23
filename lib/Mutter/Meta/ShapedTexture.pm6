use v6.c;

use NativeCall;

use Cairo;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::ShapedTexture {
  also does GLib::Roles::Object;

  has MetaShapedTexture $!mst is implementor;

  method get_image (cairo_rectangle_int_t $clip, :$raw = False) {
    propReturnObject(
      meta_shaped_texture_get_image($!mst, $clip),
      $raw,
      Cairo::cairo_surface_t,
      Cairo::Surface
    )
  }

  method get_texture ( :$raw = False ) {
    propReturnObject(
      meta_shaped_texture_get_texture($!mst),
      $raw,
      |Mutter::COGL::Texture.getTypePair
    );
  }

  method set_create_mipmaps (Int() $create_mipmaps) {
    my gboolean $c = $create_mipmaps.so.Int;

    meta_shaped_texture_set_create_mipmaps($!mst, $c);
  }

  method set_mask_texture (CoglTexture() $mask_texture) {
    meta_shaped_texture_set_mask_texture($!mst, $mask_texture);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-shaped-texture.h

sub meta_shaped_texture_get_image (
  MetaShapedTexture     $stex,
  cairo_rectangle_int_t $clip
)
  returns cairo_surface_t
  is native(mutter)
  is export
{ * }

sub meta_shaped_texture_get_texture (MetaShapedTexture $stex)
  returns CoglTexture
  is native(mutter)
  is export
{ * }

sub meta_shaped_texture_set_create_mipmaps (
  MetaShapedTexture $stex,
  gboolean $create_mipmaps
)
  is native(mutter)
  is export
{ * }

sub meta_shaped_texture_set_mask_texture (
  MetaShapedTexture $stex,
  CoglTexture       $mask_texture
)
  is native(mutter)
  is export
{ * }
