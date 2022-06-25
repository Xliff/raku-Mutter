use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Background::Image;

class Mutter::Meta::Background::Image {

  method cache_get_default ( :$raw = False ) {
    propReturnObject(
      meta_background_image_cache_get_default($!mbi),
      $raw,
      |Mutter::Meta::Background::Image::Cache.getTypePair
    );
  }

  method cache_load (GFile() $file, :$raw = False) {
    propReturnObject(
      meta_background_image_cache_load($!mbi, $file),
      $raw,
      |self.getTypePair
    );
  }

  method cache_purge (GFile() $file) {
    meta_background_image_cache_purge($!mbi, $file);
  }

  method get_success {
    meta_background_image_get_success($!mbi);
  }

  method get_texture ( :$raw = False ) {
    propReturnObject(
      meta_background_image_get_texture($!mbi),
      $raw,
      |Mutter::COGL::Texture.getTypePair
    );
  }

  method is_loaded {
    so meta_background_image_is_loaded($!mbi);
  }

}
