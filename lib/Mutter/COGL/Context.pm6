use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Context;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglContextAncestry is export of Mu
  where MutterCoglContext | MutterCoglObjectAncestry;

class Mutter::COGL::Context is Mutter::COGL::Object {
  has MutterCoglContext $!mcc is implementor;

  submethod BUILD ( :$mutter-cogl-context ) {
    self.setMutterCoglContext($mutter-cogl-context)
      if $mutter-cogl-context
  }

  method setMutterCoglContext (MutterCoglContextAncestry $_) {
    my $to-parent;

    $!mcc = do {
      when MutterCoglContext {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglContext, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglContext
  { $!mcc }

  multi method new (
    MutterCoglContextAncestry  $mutter-cogl-context,
                              :$ref                  = True
  ) {
    return unless $mutter-cogl-context;

    my $o = self.bless( :$mutter-cogl-context );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterCoglDisplay()     $display,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    clear_error;
    my $mutter-cogl-context = cogl_context_new($display, $error);
    set_error($error);

    $mutter-cogl-context ?? self.bless( :$mutter-cogl-context ) !! Nil
  }

  method is_context is also<is-context> {
    so cogl_is_context($!mcc);
  }

  method free_timestamp_query (MutterCoglTimestampQuery() $query)
    is also<free-timestamp-query>
  {
    cogl_context_free_timestamp_query($!mcc, $query);
  }

  method get_display ( :$raw = False ) is also<get-display> {
    propReturnObject(
      cogl_context_get_display($!mcc),
      $raw,
      |Mutter::COGL::Display.getTypePair
    );
  }

  method get_gpu_time_ns is also<get-gpu-time-ns> {
    cogl_context_get_gpu_time_ns($!mcc);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_context_get_gtype, $n, $t );
  }

  method get_named_pipeline (MutterCoglPipelineKey $key)
    is also<get-named-pipeline>
  {
    cogl_context_get_named_pipeline($!mcc, $key);
  }

  method get_renderer ( :$raw = False ) is also<get-renderer> {
    propReturnObject(
      cogl_context_get_renderer($!mcc),
      $raw,
      |Mutter::COGL::Renderer.getTypePair
    );
  }

  method is_hardware_accelerated is also<is-hardware-accelerated> {
    so cogl_context_is_hardware_accelerated($!mcc);
  }

  method set_named_pipeline (
    MutterCoglPipelineKey() $key,
    MutterCoglPipeline()    $pipeline
  )
    is also<set-named-pipeline>
  {
    cogl_context_set_named_pipeline($!mcc, $key, $pipeline);
  }

  method timestamp_query_get_time_ns (MutterCoglTimestampQuery() $query)
    is also<timestamp-query-get-time-ns>
  {
    cogl_context_timestamp_query_get_time_ns($!mcc, $query);
  }

  method get_egl_display {
    # cw: Can only return the pointer, since we don't know what 'EGLDisplay'
    #     is
    cogl_egl_context_get_egl_display($!mcc);
  }

}

# method cogl_foreach_feature (MutterCoglFeatureCallback $callback, Pointer $user_data) {
#   cogl_foreach_feature($!mcc, $callback, $user_data);
# }
#
# method cogl_get_graphics_reset_status {
#   cogl_get_graphics_reset_status($!mcc);
# }
#
# method cogl_has_feature (MutterCoglFeatureID $feature) {
#   cogl_has_feature($!mcc, $feature);
# }
#
# method cogl_has_features {
#   cogl_has_features($!mcc);
# }
