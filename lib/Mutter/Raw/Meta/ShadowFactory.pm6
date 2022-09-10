use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::ShadowFactory;

### /usr/src/mutter-42.1/src/meta/meta-shadow-factory.h

sub meta_shadow_factory_get_default ()
  returns MutterMetaShadowFactory
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_factory_get_params (
  MutterMetaShadowFactory $factory,
  Str                     $class_name,
  gboolean                $focused,
  MutterMetaShadowParams  $params
)
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_factory_get_shadow (
  MutterMetaShadowFactory $factory,
  MutterMetaWindowShape   $shape,
  gint                    $width,
  gint                    $height,
  Str                     $class_name,
  gboolean                $focused
)
  returns MutterMetaShadow
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_get_bounds (
  MutterMetaShadow      $shadow,
  gint                  $window_x,
  gint                  $window_y,
  gint                  $window_width,
  gint                  $window_height,
  cairo_rectangle_int_t $bounds
)
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_paint (
  MutterMetaShadow      $shadow,
  MutterCoglFramebuffer $framebuffer,
  gint                  $window_x,
  gint                  $window_y,
  gint                  $window_width,
  gint                  $window_height,
  guint8                $opacity,
  cairo_region_t        $clip,
  gboolean              $clip_strictly
)
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_ref (MutterMetaShadow $shadow)
  returns MutterMetaShadow
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_unref (MutterMetaShadow $shadow)
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_factory_new ()
  returns MutterMetaShadowFactory
  is native(mutter-clutter)
  is export
{ * }

sub meta_shadow_factory_set_params (
  MutterMetaShadowFactory $factory,
  Str                     $class_name,
  gboolean                $focused,
  MutterMetaShadowParams  $params
)
  is native(mutter-clutter)
  is export
{ * }
