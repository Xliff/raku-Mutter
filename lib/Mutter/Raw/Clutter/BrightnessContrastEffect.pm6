use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::BrightnessContrastEffect;

### /usr/src/mutter-42.\1/clutter/clutter/clutter-brightness-contrast-effect.h

sub clutter_brightness_contrast_effect_get_brightness (
  MutterClutterBrightnessContrastEffect $effect,
  gfloat                                $red     is rw,
  gfloat                                $green   is rw,
  gfloat                                $blue    is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_get_contrast (
  MutterClutterBrightnessContrastEffect $effect,
  gfloat                                $red     is rw,
  gfloat                                $green   is rw,
  gfloat                                $blue    is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_new ()
  returns MutterClutterEffect
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_set_brightness (
  MutterClutterBrightnessContrastEffect $effect,
  gfloat                                $brightness
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_set_brightness_full (
  MutterClutterBrightnessContrastEffect $effect,
  gfloat                                $red,
  gfloat                                $green,
  gfloat                                $blue
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_set_contrast (
  MutterClutterBrightnessContrastEffect $effect,
  gfloat                                $contrast
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_brightness_contrast_effect_set_contrast_full (
  MutterClutterBrightnessContrastEffect $effect,
  gfloat                                $red,
  gfloat                                $green,
  gfloat                                $blue
)
  is native(mutter-clutter)
  is export
{ * }
