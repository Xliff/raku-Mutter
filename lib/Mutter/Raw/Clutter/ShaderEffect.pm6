use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::ShaderEffect;

### /usr/src/mutter-42.1/clutter/clutter/clutter-shader-effect.h

sub clutter_shader_effect_get_program (MutterClutterShaderEffect $effect)
  returns MutterCoglHandle
  is native(mutter)
  is export
{ * }

sub clutter_shader_effect_get_shader (MutterClutterShaderEffect $effect)
  returns MutterCoglHandle
  is native(mutter)
  is export
{ * }

sub clutter_shader_effect_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_shader_effect_new (MutterClutterShaderType $shader_type)
  returns MutterClutterShaderEffect
  is native(mutter)
  is export
{ * }

sub clutter_shader_effect_set_shader_source (
  MutterClutterShaderEffect $effect,
  Str                             $source
)
  returns uint32
  is native(mutter)
  is export
{ * }

# sub clutter_shader_effect_set_uniform (
#   MutterClutterShaderEffect $effect,
#   Str $name,
#   GType $gtype,
#   gsize $n_values,
#   ...
# )
#   is native(mutter)
#   is export
# { * }

sub clutter_shader_effect_set_uniform_value (
  MutterClutterShaderEffect $effect,
  Str                       $name,
  GValue                    $value
)
  is native(mutter)
  is export
{ * }
