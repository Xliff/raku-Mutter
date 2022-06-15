use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

class Mutter::Meta::Raw::Background::Content;

### /usr/src/mutter-42.1/src/meta/meta-background-content.h

sub meta_background_content_new (MetaDisplay $display, gint $monitor)
  returns ClutterContent
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_background (
  MetaBackgroundContent $self,
  MetaBackground        $background
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_gradient (
  MetaBackgroundContent $self,
  gboolean              $enabled,
  gint                  $height,
  gdouble               $tone_start
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_rounded_clip_bounds (
  MetaBackgroundContent $self,
  graphene_rect_t       $bounds
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_rounded_clip_radius (
  MetaBackgroundContent $self,
  gfloat                $radius
)
  is native(mutter)
  is export
{ * }

sub meta_background_content_set_vignette (
  MetaBackgroundContent $self,
  gboolean              $enabled, 
  gdouble               $brightness, 
  gdouble               $sharpness
)
  is native(mutter)
  is export
{ * }
