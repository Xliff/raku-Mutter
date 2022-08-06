use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Pipeline;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglPipelineAncestry is export of Mu
  where MutterCoglPipeline | MutterCoglObjectAncestry;

class Mutter::COGL::Pipeline is Mutter::COGL::Object {
  has MutterCoglPipeline $!mcp is implementor;

  submethod BUILD ( :$mutter-cogl-pipeline ) {
    self.setMutterCoglPipeline($mutter-cogl-pipeline)
      if $mutter-cogl-pipeline
  }

  method setMutterCoglPipeline (MutterCoglPipelineAncestry $_) {
    my $to-parent;

    $!mcp = do {
      when MutterCoglPipeline {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglPipeline, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglPipeline
    is also<MutterCoglPipeline>
  { $!mcp }

  multi method new (
    MutterCoglPipelineAncestry  $mutter-cogl-pipeline,
                               :$ref                   = True
  ) {
    return unless $mutter-cogl-pipeline;

    my $o = self.bless( :$mutter-cogl-pipeline );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglContext() $context) {
    my $mutter-cogl-pipeline = cogl_pipeline_new($context);

    $mutter-cogl-pipeline ?? self.bless( :$mutter-cogl-pipeline ) !! Nil;
  }

  method is_pipeline is also<is-pipeline> {
    so cogl_is_pipeline($!mcp);
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      cogl_pipeline_copy($!mcp),
      $raw,
      |self.getTypePair
    );
  }

  method foreach_layer (&callback, gpointer $user_data = gpointer)
    is also<foreach-layer>
  {
    cogl_pipeline_foreach_layer($!mcp, &callback, $user_data);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_pipeline_get_gtype, $n, $t );
  }

  method get_uniform_location (Str() $uniform_name)
    is also<get-uniform-location>
  {
    cogl_pipeline_get_uniform_location($!mcp, $uniform_name);
  }

}
