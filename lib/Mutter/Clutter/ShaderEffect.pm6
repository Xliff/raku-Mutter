use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::ShaderEffect;

use Mutter::Clutter::Effect;

class Mutter::Clutter::ShaderEffect is Mutter::Clutter::Effect {
  has MutterClutterShaderEffect $!mcse is implementor;

  method new (Int() $shader-type) {
    my MutterClutterShaderType $s = $shader-type;

    my $mutter-clutter-shader-effect = clutter_shader_effect_new($s);

    $mutter-clutter-shader-effect
      ?? self.bless( :$mutter-clutter-shader-effect )
      !! Nil;
  }

  method get_program ( :$raw = False ) {
    propReturnObject(
      clutter_shader_effect_get_program($!mcse),
      $raw,
      |Mutter::Cogl::Handle.getTypePair
    );
  }

  method get_shader ( :$raw = False ) {
    propReturnObject(
      clutter_shader_effect_get_shader($!mcse),
      $raw,
      |Mutter::Cogl::Handle.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_shader_effect_get_type, $n, $t );
  }

  method set_shader_source (Str $source) {
    clutter_shader_effect_set_shader_source($!mcse, $source);
  }

  method set_uniform_value (Str() $name, GValue() $value) {
    clutter_shader_effect_set_uniform_value($!mcse, $name, $value);
  }

}
