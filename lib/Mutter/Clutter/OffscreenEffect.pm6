use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::OffscreenEffect;

#use Mutter::Cogl::Handle;
#use Mutter::Cogl::Pipeline;
use Mutter::Clutter::Effect;

use GLib::Roles::Implementor;

our subset MutterClutterOffscreenEffectAncestry is export of Mu
  where MutterClutterOffscreenEffect | MutterClutterEffectAncestry;

class Mutter::Clutter::OffscreenEffect is Mutter::Clutter::Effect {
  has MutterClutterOffscreenEffect $!mcoe is implementor;

  submethod BUILD ( :$mutter-clutter-offscreen-effect ) {
    self.setMutterClutterOffscreenEffect($mutter-clutter-offscreen-effect)
      if $mutter-clutter-offscreen-effect
  }

  method setMutterClutterOffscreenEffect (
    MutterClutterOffscreenEffectAncestry $_
  ) {
    my $to-parent;

    $!mcoe = do {
      when MutterClutterOffscreenEffect {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterOffscreenEffect, $_);
      }
    }
    self.setMutterClutterEffect($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterOffscreenEffect
  { $!mcoe }

  constant MCOE := MutterClutterOffscreenEffectAncestry;
  multi method new (MCOE $mutter-clutter-offscreen-effect, :$ref = True) {
    return unless $mutter-clutter-offscreen-effect;

    my $o = self.bless( :$mutter-clutter-offscreen-effect );
    $o.ref if $ref;
    $o;
  }

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
