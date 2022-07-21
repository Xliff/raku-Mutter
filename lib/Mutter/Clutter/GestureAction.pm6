use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::GestureAction;

use Mutter::Clutter::Action;

use GLib::Roles::Implementor;

class Mutter::Clutter::GestureAction is Mutter::Clutter::Action {
  has MutterClutterGestureAction $!mcga is implementor;

  method new {
    my $mutter-clutter-gesture-action = clutter_gesture_action_new();

    $mutter-clutter-gesture-action
      ?? self.bless( :$mutter-clutter-gesture-action )
      !! Nil;
  }

  method cancel {
    clutter_gesture_action_cancel($!mcga);
  }

  method get_device (Int() $point, :$raw = False) {
    my guint $p = $point;

    propReturnObject(
      clutter_gesture_action_get_device($!mcga, $p),
      $raw,
      |Mutter::Clutter::InputDevice.getTypePair
    );
  }

  method get_last_event (Int() $point, :$raw = False) {
    my guint $p = $point;

    propReturnObject(
      clutter_gesture_action_get_last_event($!mcga, $point),
      $raw,
      |Mutter::Clutter::Event.getTypePair
    );
  }

  proto method get_motion_coords (|)
  { * }

  multi method get_motion_coords (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_motion_coords (Int() $point, $motion_x is rw, $motion_y is rw) {
    my guint   $p        = $point;
    my gfloat ($mx, $my) = 0e0 xx 2;

    clutter_gesture_action_get_motion_coords($!mcga, $p, $mx, $my);
    ($motion_x, $motion_y) = ($mx, $my);
  }

  proto method get_motion_delta (|)
  { * }

  multi method get_motion_delta (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_motion_delta (Int() $point, $delta_x is rw, $delta_y is rw) {
    my guint   $p        = $point;
    my gfloat ($dx, $dy) = 0e0 xx 2;

    clutter_gesture_action_get_motion_delta($!mcga, $p, $dx, $dy);
    ($delta_x, $delta_y) = ($dx, $dy);
  }

  method get_n_current_points {
    clutter_gesture_action_get_n_current_points($!mcga);
  }

  method get_n_touch_points {
    clutter_gesture_action_get_n_touch_points($!mcga);
  }

  proto method get_press_coords (|)
  { * }

  multi method get_press_coords (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_press_coords (Int() $point, $press_x is rw, $press_y is rw) {
    my guint   $p        = $point;
    my gfloat ($px, $py) = 0e0 xx 2;

    clutter_gesture_action_get_press_coords($!mcga, $p, $px, $py);
    ($press_x, $press_y) = ($px, $py);
  }

  proto method get_release_coords (|)
  { * }

  multi method get_release_coords (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_release_coords (Int() $point, $release_x is rw, $release_y is rw) {
    my guint   $p        = $point;
    my gfloat ($rx, $ry) = 0e0 xx 2;

    clutter_gesture_action_get_release_coords($!mcga, $p, $rx, $ry);
    ($release_x, $release_y) = ($rx, $ry);
  }

  method get_sequence (Int() $point, :$raw = False) {
    my guint $p = $point;

    propReturnObject(
      clutter_gesture_action_get_sequence($!mcga, $p),
      $raw,
      |Mutter::Clutter::EventSequence.getTypePair
    )
  }

  proto method get_threshold_trigger_distance (|)
  { * }

  multi method get_threshold_trigger_distance {
    samewith($, $);
  }
  multi method get_threshold_trigger_distance ($x is rw, $y is rw) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_gesture_action_get_threshold_trigger_distance($!mcga, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_threshold_trigger_edge {
    MutterClutterGestureTriggerEdgeEnum(
      clutter_gesture_action_get_threshold_trigger_edge($!mcga)
    );
  }

  proto method get_velocity (|)
  { * }

  multi method get_velocity (Int() $point) {
    samewith($point, $, $);
  }
  multi method get_velocity (
    Int() $point,
          $velocity_x is rw,
          $velocity_y is rw
  ) {
    my guint   $p        = $point;
    my gfloat ($vx, $vy) = 0e0 xx 2;

    clutter_gesture_action_get_velocity($!mcga, $p, $vx, $vy);
    ($velocity_x, $velocity_y) = ($vx, $vy);
  }

  method set_n_touch_points (Int() $nb_points) {
    my gint $n = $nb_points;

    clutter_gesture_action_set_n_touch_points($!mcga, $nb_points);
  }

  method set_threshold_trigger_distance (Num() $x, Num() $y) {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_gesture_action_set_threshold_trigger_distance($!mcga, $xx, $yy)
  }

  method set_threshold_trigger_edge (Int() $edge) {
    my MutterClutterGestureTriggerEdge $e = $edge;

    clutter_gesture_action_set_threshold_trigger_edge($!mcga, $e);
  }

}
