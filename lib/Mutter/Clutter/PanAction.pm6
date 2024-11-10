use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PanAction;

class Mutter::Clutter::PanAction {
  has MutterClutterPanAction $!mcpa is implementor;

  multi method new {
    my $mutter-clutter-pan-action = clutter_pan_action_new();

    $mutter-clutter-pan-action ?? self.bless( :$mutter-clutter-pan-action )
                               !! Nil;
  }

  method get_acceleration_factor {
    clutter_pan_action_get_acceleration_factor($!mcpa);
  }

  proto method get_constrained_motion_delta (|)
  { * }

  multi method get_constrained_motion_delta (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_constrained_motion_delta (
    Int()  $point,
           $delta_x is rw,
           $delta_y is rw
  ) {
    my gint    $p        =  $point;
    my gfloat ($dx, $dy) = ($delta_x, $delta_y);

    clutter_pan_action_get_constrained_motion_delta($!mcpa, $point, $dx, $dy);
    ($delta_x, $delta_y) = ($dx, $dy);
  }

  method get_deceleration {
    so clutter_pan_action_get_deceleration($!mcpa);
  }

  method get_interpolate {
    so clutter_pan_action_get_interpolate($!mcpa);
  }

  proto method get_interpolated_coords (|)
  { * }

  multi method get_interpolated_coords {
    samewith($, $);
  }
  multi method get_interpolated_coords (
    $interpolated_x is rw,
    $interpolated_y is rw
  ) {
    my gfloat ($ix, $iy) = 0 xx 2;

    clutter_pan_action_get_interpolated_coords($!mcpa, $ix, $iy);
    ($interpolated_x, $interpolated_y) = ($ix, $iy);
  }

  proto method get_interpolated_delta (|)
  { * }

  multi method get_interpolated_delta {
    samewith($, $);
  }
  multi method get_interpolated_delta ($delta_x is rw, $delta_y is rw) {
    my gfloat ($dx, $dy) = 0 xx 2;

    clutter_pan_action_get_interpolated_delta($!mcpa, $dx, $dy);
    ($delta_x, $delta_y) = ($dx, $dy);
  }

  proto method get_motion_coords (|)
  { * }

  multi method get_motion_coords (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_motion_coords (
    Int() $point,
          $motion_x is rw,
          $motion_y is rw
  ) {
    my gint    $p        = $point;
    my gfloat ($mx, $my) = 0 xx 2;

    clutter_pan_action_get_motion_coords($!mcpa, $point, $mx, $my);
    ($motion_x, $motion_y) = ($mx, $my);
  }

  proto method get_motion_delta (|)
  { * }

  multi method get_motion_delta (Int() $point = 0) {
    samewith($point, $, $);
  }
  multi method get_motion_delta (
    Int()  $point,
           $delta_x is rw,
           $delta_y is rw
  ) {
    my gint    $p        = $point;
    my gfloat ($dx, $dy) = 0 xx 2;

    clutter_pan_action_get_motion_delta($!mcpa, $point, $dx, $dy);
    ($delta_x, $delta_y) = ($dx, $dy);
  }

  method get_pan_axis {
    MutterClutterPanAxisEnum( clutter_pan_action_get_pan_axis($!mcpa) );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_pan_action_get_type, $n, $t );
  }

  method set_acceleration_factor (Num() $factor) {
    my gdouble $f = $factor;

    clutter_pan_action_set_acceleration_factor($!mcpa, $f);
  }

  method set_deceleration (Num() $rate) {
    my gdouble $r = $rate;

    clutter_pan_action_set_deceleration($!mcpa, $r);
  }

  method set_interpolate (Int() $should_interpolate) {
    my gboolean $s = $should_interpolate.so.Int;

    clutter_pan_action_set_interpolate($!mcpa, $s);
  }

  method set_pan_axis (Int() $axis) {
    my MutterClutterPanAxis $a = $axis;

    clutter_pan_action_set_pan_axis($!mcpa, $a);
  }

}
