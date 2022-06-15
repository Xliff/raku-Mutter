use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Background::Image;

### /usr/src/mutter-42.1/src/meta/meta-background-image.h

sub meta_background_image_cache_get_default ()
  returns MetaBackgroundImageCache
  is native(mutter)
  is export
{ * }

sub meta_background_image_cache_load (
  MetaBackgroundImageCache $cache,
  GFile                    $file
)
  returns MetaBackgroundImage
  is native(mutter)
  is export
{ * }

sub meta_background_image_cache_purge (
  MetaBackgroundImageCache $cache,
  GFile                    $file
)
  is native(mutter)
  is export
{ * }

sub meta_background_image_get_success (MetaBackgroundImage $image)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_background_image_get_texture (MetaBackgroundImage $image)
  returns CoglTexture
  is native(mutter)
  is export
{ * }

sub meta_background_image_is_loaded (MetaBackgroundImage $image)
  returns uint32
  is native(mutter)
  is export
{ * }
