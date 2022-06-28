use v6.c;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Background::Image;

### /usr/src/mutter-42.1/src/meta/meta-background-image.h

sub meta_background_image_cache_get_default ()
  returns MutterMetaBackgroundImageCache
  is native(mutter)
  is export
{ * }

sub meta_background_image_cache_load (
  MutterMetaBackgroundImageCache $cache,
  GFile                          $file
)
  returns MutterMetaBackgroundImage
  is native(mutter)
  is export
{ * }

sub meta_background_image_cache_purge (
  MutterMetaBackgroundImageCache $cache,
  GFile                          $file
)
  is native(mutter)
  is export
{ * }

sub meta_background_image_get_success (MutterMetaBackgroundImage $image)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_background_image_get_texture (MutterMetaBackgroundImage $image)
  returns CoglTexture
  is native(mutter)
  is export
{ * }

sub meta_background_image_is_loaded (MutterMetaBackgroundImage $image)
  returns uint32
  is native(mutter)
  is export
{ * }
