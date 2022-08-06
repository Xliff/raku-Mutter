use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::COGL::Pipeline;

### /usr/src/mutter-42.1/cogl/cogl/cogl-pipeline.h

sub cogl_is_pipeline (MutterCoglPipeline $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_pipeline_copy (MutterCoglPipeline $source)
  returns MutterCoglPipeline
  is native(mutter-clutter)
  is export
{ * }

sub cogl_pipeline_foreach_layer (
  MutterCoglPipeline $pipeline,
                     &callback (
                       MutterCoglPipeline,
                       gint,
                       Pointer,
                       --> gboolean
                     ),
                     Pointer $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_pipeline_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_pipeline_get_uniform_location (
  MutterCoglPipeline $pipeline,
  Str                $uniform_name
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_pipeline_new (MutterCoglContext $context)
  returns MutterCoglPipeline
  is native(mutter-clutter)
  is export
{ * }
