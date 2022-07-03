use v6.c;

use Mutter::Raw::Types;
use Graphene::Raw::Matrix;
use Mutter::Raw::Clutter::Stage::View;

class Mutter::Clutter::Stage::View {
  has MutterClutterStageView $!mcsv is implementor;

  method !destroy {
    clutter_stage_view_destroy($!mcsv);
  }

  method get_frame_clock ( :$raw = False ) {
    propReturnObject(
      clutter_stage_view_get_frame_clock($!mcsv),
      $raw,
      |Mutter::Clutter::FrameClock.getTypePair
    )
  }

  method get_framebuffer ( :$raw = False ) {
    propReturnObject(
      clutter_stage_view_get_framebuffer($!mcsv),
      $raw,
      |Mutter::Cogl::Framebuffer.getTypePair
    )
  }

  proto method get_layout (|)
  { * }

  multi method get_layout {
    samewith( cairo_rectangle_int_t.new );
  }
  multi method get_layout (cairo_rectangle_int_t() $rect) {
    clutter_stage_view_get_layout($!mcsv, $rect);
    $rect;
  }

  proto method get_offscreen_transformation_matrix (|)
  { * }

  multi method get_offscreen_transformation_matrix ( :$raw = False ) {
    samewith( graphene_matrix_alloc(), :$raw );
  }
  multi method get_offscreen_transformation_matrix (
    graphene_matrix_t()  $matrix,
                        :$raw     = False
  ) {
    clutter_stage_view_get_offscreen_transformation_matrix($!mcsv, $matrix);
    propReturnObject($matrix, $raw, |Mutter::Cogl::FrameBuffer.getTypePair);
  }

  method get_onscreen ( :$raw = False ) {
    propReturnObject(
      clutter_stage_view_get_onscreen($!mcsv),
      $raw,
      |Mutter::Cogl::Framebuffer.getTypePair
    );
  }

  method get_refresh_rate {
    clutter_stage_view_get_refresh_rate($!mcsv);
  }

  method get_scale {
    clutter_stage_view_get_scale($!mcsv);
  }

  method invalidate_offscreen_blit_pipeline {
    clutter_stage_view_invalidate_offscreen_blit_pipeline($!mcsv);
  }

  method peek_scanout ( :$raw = False ) {
    propReturnObject(
      clutter_stage_view_peek_scanout($!mcsv),
      $raw,
      |Mutter::Cogl::Scanout.getTypePair
    )
  }


}
