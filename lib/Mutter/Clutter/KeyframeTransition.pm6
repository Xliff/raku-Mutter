use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::KeyframeTransition;

use Mutter::Clutter::PropertyTransition;

use GLib::Roles::Implementor;
use GLib::Roles::TypedBuffer;

our subset MutterClutterKeyframeTransitionAncestry is export of Mu
  where MutterClutterKeyframeTransition          |
        MutterClutterPropertyTransitionAncestry;

class Mutter::Clutter::KeyframeTransition
  is Mutter::Clutter::PropertyTransition
{
  has MutterClutterKeyframeTransition $!mckt is implementor;

  submethod BUILD ( :$mutter-clutter-keyframe ) {
    self.setMutterClutterKeyframeTransition($mutter-clutter-keyframe)
      if $mutter-clutter-keyframe
  }

  method setMutterClutterKeyframeTransition (
    MutterClutterKeyframeTransitionAncestry $_
  ) {
    my $to-parent;

    $!mckt = do {
      when MutterClutterKeyframeTransition {
        $to-parent = cast(MutterClutterPropertyTransition, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterKeyframeTransition, $_);
      }
    }
    self.setMutterClutterPropertyTransition($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterKeyframeTransition
  { $!mckt }

  multi method new (
    MutterClutterKeyframeTransitionAncestry  $mutter-clutter-keyframe,
                                            :$ref                      = True
  ) {
    return unless $mutter-clutter-keyframe;

    my $o = self.bless( :$mutter-clutter-keyframe );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $property-name) {
    my $mutter-clutter-keyframe = clutter_keyframe_transition_new(
      $property-name
    );

    $mutter-clutter-keyframe ?? self.bless( :$mutter-clutter-keyframe )
                             !! Nil;
  }

  method clear {
    clutter_keyframe_transition_clear($!mckt);
  }

  proto method get_key_frame (|)
  { * }

  multi method get_key_frame (Int() $index) {
    my $v = GValue.new;

    $v ?? samewith($index, $, $, $v) !! Nil;
  }
  multi method get_key_frame (
    Int()    $index,
             $key     is rw,
             $mode    is rw,
    GValue() $value
  ) {
    my guint                      $i = $index;
    my gdouble                    $k = 0e0;
    my MutterClutterAnimationMode $m = 0;

    clutter_keyframe_transition_get_key_frame($!mckt, $i, $k, $m, $value);
    ($key, $mode) = ($k, $m);
    ($key, $mode, $value);
  }

  method get_n_key_frames {
    clutter_keyframe_transition_get_n_key_frames($!mckt);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_keyframe_transition_get_type,
      $n,
      $t
    );
  }

  method set_key_frame (
    Int()    $index,
    Num()    $key,
    Int()    $mode,
    GValue() $value
  ) {
    my guint                      $i = $index;
    my gdouble                    $k = $key;
    my MutterClutterAnimationMode $m = $mode;

    clutter_keyframe_transition_set_key_frame($!mckt, $i, $k, $m, $value);
  }

  proto method set_key_frames (|)
  { * }

  multi method set_key_frames (@key-frames) {
    samewith( @key-frames.elems, ArrayToCArray(gdouble, @key-frames) );
  }
  multi method set_key_frames (Int() $n_key_frames, CArray[gdouble] $key_frames) {
    my guint $n = $n_key_frames;

    clutter_keyframe_transition_set_key_frames($!mckt, $n, $key_frames);
  }

  proto method set_modes (|)
  { * }

  multi method set_modes (@modes) {
    samewith(
      @modes.elems,
      ArrayToCArray(MutterClutterAnimationMode, @modes)
    );
  }
  multi method set_modes (
    Int()                              $n_modes,
    CArray[MutterClutterAnimationMode] $modes
  ) {
    my guint $n = $n_modes;

    clutter_keyframe_transition_set_modes($!mckt, $n, $modes);
  }

  proto method set_values (|)
  { * }

  multi method set_values (@values) {
    samewith( @values.elems, GLib::Roles::TypedBuffer[GValue].new(@values).p );
  }
  multi method set_values (Int() $n_values, Pointer $values) {
    clutter_keyframe_transition_set_values($!mckt, $n_values, $values);
  }

}
