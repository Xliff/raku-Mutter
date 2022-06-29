use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PaintContext;

class Mutter::Clutter::PaintContext {
  has MutterClutterPaintContext $!mcpc is implementor;

  method new_for_framebuffer (
    MutterCoglFramebuffer() $framebuffer,
    cairo_region_t()        $redraw_clip,
    Int()                   $paint_flags
  ) {
    my MutterClutterPaintFlag $p = $paint_flags;

    my $mutter-clutter-paint-context =
      clutter_paint_context_new_for_framebuffer(
        $framebuffer,
        $redraw_clip,
        $p
      );

    $mutter-clutter-paint-context
      ?? self.bless( :$mutter-clutter-paint-context )
      !! Nil
  }

  method destroy {
    clutter_paint_context_destroy($!mcpc);
  }

  method get_framebuffer (:$raw = False ) {
    propReturnObject(
      clutter_paint_context_get_framebuffer($!mcpc),
      $raw,
      |Mutter::Cogl::Framebuffer.getTypePair
    )
  }

  method get_paint_flags {
    clutter_paint_context_get_paint_flags($!mcpc);
  }

  method get_redraw_clip ( :$raw = False ) {
    propReturnObject(
      clutter_paint_context_get_redraw_clip($!mcpc),
      $raw,
      cairo_region_t,
      Cairo::Region
    );
  }

  method get_stage_view ( :$raw = False ) {
    propReturnObject(
      clutter_paint_context_get_stage_view($!mcpc),
      $raw,
      |Mutter::Clutter::StageView
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_paint_context_get_type,
      $n,
      $t
    );
  }

  method pop_framebuffer {
    clutter_paint_context_pop_framebuffer($!mcpc);
  }

  method push_framebuffer (MutterCoglFramebuffer() $framebuffer) {
    clutter_paint_context_push_framebuffer($!mcpc, $framebuffer);
  }

  method ref {
    clutter_paint_context_ref($!mcpc);
    self;
  }

  method unref {
    clutter_paint_context_unref($!mcpc);
  }

}
