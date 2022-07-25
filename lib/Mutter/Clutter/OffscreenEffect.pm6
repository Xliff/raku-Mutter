use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::OffscreenEffect;

#use Mutter::Cogl::Handle;
#use Mutter::Cogl::Pipeline;
use Mutter::Clutter::Effect;

use GLib::Roles::Implementor;

class Mutter::Clutter::OffscreenEffect is Mutter::Clutter::Effect {
  has MutterClutterOffscreenEffect $!mcoe is implementor;

  method create_texture (Num() $width, Num() $height, :$raw = False) {
    my gfloat ($w, $h) = ($width, $height);

    propReturnObject(
      clutter_offscreen_effect_create_texture($!mcoe, $w, $h),
      $raw,
      |Mutter::Cogl::Handle.getTypePair
    );
  }

  method get_pipeline ( :$raw = False ) {
    propReturnObject(
      clutter_offscreen_effect_get_pipeline($!mcoe),
      $raw,
      |Mutter::Cogl::Pipeline.getTypePair
    );
  }

  proto method get_target_size (|)
  { * }

  multi method get_target_size {
    samewith($, $);
  }
  multi method get_target_size ($width is rw, $height is rw) {
    my gfloat ($w, $h) = ($width, $height);

    clutter_offscreen_effect_get_target_size($!mcoe, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_texture ( :$raw = False ) {
    propReturnObject(
      clutter_offscreen_effect_get_texture($!mcoe),
      $raw,
      |Mutter::Cogl::Handle.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_offscreen_effect_get_type, $n, $t );
  }

  method paint_target (
    MutterClutterPaintNode()    $node,
    MutterClutterPaintContext() $paint_context
  ) {
    clutter_offscreen_effect_paint_target($!mcoe, $node, $paint_context);
  }

}
