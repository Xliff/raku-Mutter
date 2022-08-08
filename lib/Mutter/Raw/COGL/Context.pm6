use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

### /usr/src/mutter-42.1/cogl/cogl/cogl-context.h

sub cogl_foreach_feature (
  MutterCoglContext $context,
                    &callback (MutterCoglFeatureID, gpointer),
  Pointer           $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_get_graphics_reset_status (MutterCoglContext $context)
  returns MutterCoglGraphicsResetStatus
  is native(mutter-clutter)
  is export
{ * }

sub cogl_has_feature (MutterCoglContext $context, MutterCoglFeatureID $feature)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_has_features (MutterCoglContext $context)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_is_context (MutterCoglContext $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_free_timestamp_query (
  MutterCoglContext        $context,
  MutterCoglTimestampQuery $query
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_get_display (MutterCoglContext $context)
  returns MutterCoglDisplay
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_get_gpu_time_ns (MutterCoglContext $context)
  returns int64_t
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_get_named_pipeline (
  MutterCoglContext     $context,
  MutterCoglPipelineKey $key
)
  returns MutterCoglPipeline
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_get_renderer (MutterCoglContext $context)
  returns MutterCoglRenderer
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_is_hardware_accelerated (MutterCoglContext $context)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_new (
  MutterCoglDisplay      $display,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglContext
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_set_named_pipeline (
  MutterCoglContext     $context,
  MutterCoglPipelineKey $key,
  MutterCoglPipeline    $pipeline
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_context_timestamp_query_get_time_ns (
  MutterCoglContext        $context,
  MutterCoglTimestampQuery $query
)
  returns int64_t
  is native(mutter-clutter)
  is export
{ * }
