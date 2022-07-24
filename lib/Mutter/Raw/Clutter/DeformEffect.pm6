use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::DeformEffect;

### /usr/src/mutter-42.1/clutter/clutter/clutter-deform-effect.h

sub clutter_deform_effect_get_back_material (MutterClutterDeformEffect $effect)
  returns MutterCoglHandle
  is native(mutter-clutter)
  is export
{ * }

sub clutter_deform_effect_get_n_tiles (
  MutterClutterDeformEffect $effect,
  guint                     $x_tiles is rw,
  guint                     $y_tiles is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_deform_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_deform_effect_invalidate (MutterClutterDeformEffect $effect)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_deform_effect_set_back_material (
  MutterClutterDeformEffect $effect,
  MutterCoglHandle          $material
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_deform_effect_set_n_tiles (
  MutterClutterDeformEffect $effect,
  guint                     $x_tiles,
  guint                     $y_tiles
)
  is native(mutter-clutter)
  is export
{ * }
