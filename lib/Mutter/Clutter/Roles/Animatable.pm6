use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Animatable;

use GLib::Object::ParamSpec;

use GLib::Roles::Object;

role Mutter::Clutter::Roles::Animatable {
  has NutterClutterAnimatable $!mc-anim is implementor;

  method Mutter::Raw::Definitions::MutterClutterAnimatable
    is also<MutterClutterAnimatable>
  { $!mc-anim }

  method roleInit-MutterClutterAnimatable {
    my \i = findProperImplementor(self.^attributes);

    $!mc-anim = cast( MutterClutterAnimatable, i.get_value(self) );
  }

  method find_property (Str() $property_name, :$raw = False)
    is also<find-property>
  {
    propReturnObject(
      clutter_animatable_find_property($!mc-anim, $property_name),
      $raw,
      |GLib::Object::ParamSpec.getTypePair
    );
  }

  method get_actor ( :$raw = False ) {
    propReturnObject(
      clutter_animatable_get_actor($!mc-anim),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_initial_state (Str() $property_name, GValue() $value)
    is also<get-initial-state>
  {
    clutter_animatable_get_initial_state($!mc-anim, $property_name, $value);
  }

  method mutterclutteranimatable_get_type
    is also<mutterclutteranimatable-get-type>
  {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_animatable_get_type, $n, $t );
  }

  method interpolate_value (
    Str()                   $property_name,
    MutterClutterInterval() $interval,
    Num()                   $progress,
    GValue()                $value
  )
    is also<interpolate-value>
  {
    my gdouble $p = $progress;

    clutter_animatable_interpolate_value(
      $!mc-anim,
      $property_name,
      $interval,
      $p,
      $value
    );
  }

  method set_final_state (Str() $property_name, GValue() $value)
    is also<set-final-state>
  {
    clutter_animatable_set_final_state($!mc-anim, $property_name, $value);
  }

}

our subset MutterClutterAnimatable is export of Mu
  where MutterClutterAnimatable | GObject;

class Mutter::Clutter::Animatable {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Animatable;

  method setMutterClutterAnimatable (MutterClutterAnimatableAncestry $_) {
    my $to-parent;

    $!mc-anim = do {
      when MutterClutterAnimatable {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterAnimatable, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (
    MutterClutterAnimatable  $mutter-clutter-animatable,
                            :$ref                        = True
  ) {
    return unless $mutter-clutter-animatable;

    my $o = self.bless( :$mutter-clutter-animatable );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.mutterclutteranimatable_get_type;
  }
}
