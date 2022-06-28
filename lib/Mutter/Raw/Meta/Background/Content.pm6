use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Background::Content;

### /usr/src/mutter-42.1/src/meta/meta-background-content.h

sub meta_background_content_new (MutterMetaDisplay $display, gint $monitor)
  returns MutterClutterContent
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_background (
  MutterMetaBackgroundContent $self,
  MutterMetaBackground        $background
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_gradient (
  MutterMetaBackgroundContent $self,
  gboolean              $enabled,
  gint                  $height,
  gdouble               $tone_start
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_rounded_clip_bounds (
  MutterMetaBackgroundContent $self,
  graphene_rect_t             $bounds
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_rounded_clip_radius (
  MutterMetaBackgroundContent $self,
  gfloat                      $radius
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_vignette (
  MutterMetaBackgroundContent $self,
  gboolean                    $enabled,
  gdouble                     $brightness,
  gdouble                     $sharpness
)
  is native(mutter)
  is export
{ * }
