use v6.c;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Interval;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterIntervalAncestry is export of Mu
  where MutterClutterInterval | GObject;

class Mutter::Clutter::Interval {
  also does GLib::Roles::Object;

  has MutterClutterInterval $!mci is implementor;

  submethod BUILD ( :$mutter-clutter-interval ) {
    self.setMutterClutterInterval($mutter-clutter-interval)
      if $mutter-clutter-interval;
  }

  method setMutterClutterInterval(MutterClutterIntervalAncestry $_) {
    my $to-parent;

    $!mci = do {
      when MutterClutterInterval {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterInterval, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterInterval
  { $!mci }

  method new (
    MutterClutterIntervalAncestry  $mutter-clutter-interval,
                                  :$ref                      = True
  ) {
    return Nil unless $mutter-clutter-interval;

    my $o = self.bless( :$mutter-clutter-interval );
    $o.ref if $ref;
    $o;
  }

  method new_with_values (Int() $gtype, GValue() $initial, GValue() $final) {
    my GType $g = $gtype;

    my $mutter-clutter-interval = clutter_interval_new_with_values(
      $g,
      $initial,
      $final
    );

    $mutter-clutter-interval ?? self.bless( :$mutter-clutter-interval )
                             !! Nil;
  }

  # Type: GType
  method value-type is rw  is g-property {
    my $gv = GLib::Value.new( typeToGType(GType) );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('value-type', $gv);
        $gv.valueFromEnum(GType);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GType) = $val;
        self.prop_set('value-type', $gv);
      }
    );
  }

  # Type: GValue
  method initial is rw  is g-property {
    my $gv = GLib::Value.new( self.value-type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('initial', $gv);
        $gv.valueFromType(self.value-type);
      },
      STORE => -> $, GValue() $val {
        self.prop_set('initial', $val);
      }
    );
  }

  # Type: GValue
  method final is rw  is g-property {
    my $gv = GLib::Value.new( self.value_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('final', $gv);
        $gv.valueFromType(self.value-type);
      },
      STORE => -> $, GValue() $val is copy {
        self.prop_set('final', $val);
      }
    );
  }

  method clone ( :$raw = False) {
    propReturnObject(
      clutter_interval_clone($!mci),
      $raw,
      |self.getTypePair
    );
  }

  method compute (Num() $factor) {
    my gdouble $f = $factor;

    clutter_interval_compute($!mci, $f);
  }

  proto method compute_value (|)
  { * }

  multi method compute_value (Num() $factor) {
    my $gv = GLib::Value.new(self.value-type);

    samewith($factor, $gv);
    $gv.value;
  }
  multi method compute_value (Num() $factor, GValue() $value) {
    my gdouble $f = $factor;

    clutter_interval_compute_value($!mci, $f, $value);
  }

  proto method get_final_value (|)
  { * }

  multi method get_final_value {
    my $gv = GLib::Value.new(self.value-type);

    samewith($gv);
    $gv.value;
  }
  multi method get_final_value (GValue() $value) {
    clutter_interval_get_final_value($!mci, $value);
  }

  proto method get_initial_value (|)
  { *}

  multi method get_initial_value {
    my $gv = GLib::Value.new(self.value-type);

    samewith($gv);
    $gv.value;
  }
  multi method get_initial_value (GValue() $value) {
    clutter_interval_get_initial_value($!mci, $value);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_interval_get_type, $n, $t );
  }

  method get_value_type {
    clutter_interval_get_value_type($!mci);
  }

  method is_valid {
    so clutter_interval_is_valid($!mci);
  }

  method peek_final_value ( :$raw = False ) {
    propReturnObject(
      clutter_interval_peek_final_value($!mci),
      $raw,
      GLib::Value.getTypePair
    );
  }

  method peek_initial_value ( :$raw = False ) {
    propReturnObject(
      clutter_interval_peek_initial_value($!mci),
      $raw,
      GLib::Value.getTypePair
    );
  }

  method set_final_value (GValue() $value) {
    clutter_interval_set_final_value($!mci, $value);
  }

  method set_initial_value (GValue() $value) {
    clutter_interval_set_initial_value($!mci, $value);
  }

  method validate (GParamSpec() $pspec) {
    so clutter_interval_validate($!mci, $pspec);
  }

}
