use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Easing;

use GLib::Roles::StaticClass;

class Mutter::Clutter::Easing {
  also does GLib::Roles::StaticClass;

  method clutter_ease_cubic_bezier (
    Num() $t,
    Num() $d,
    Num() $x_1,
    Num() $y_1,
    Num() $x_2,
    Num() $y_2
  ) {
    my gdouble ($tt, $dd, $x1, $y1, $x2, $y2) =
      ($t, $d, $x_1, $y_1, $x_2, $y_2);

    clutter_ease_cubic_bezier($t, $dd, $x1, $y1, $x2, $y2)
  }

  method clutter_ease_in_back (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_back($tt, $dd);
  }

  method clutter_ease_in_bounce (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_bounce($tt, $dd);
  }

  method clutter_ease_in_circ (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_circ($tt, $dd);
  }

  method clutter_ease_in_cubic (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_cubic($tt, $dd);
  }

  method clutter_ease_in_elastic (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_elastic($tt, $dd);
  }

  method clutter_ease_in_expo (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_expo($tt, $dd);
  }

  method clutter_ease_in_out_back (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_back($tt, $dd);
  }

  method clutter_ease_in_out_bounce (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_bounce($tt, $dd);
  }

  method clutter_ease_in_out_circ (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_circ($tt, $dd);
  }

  method clutter_ease_in_out_cubic (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_cubic($tt, $dd);
  }

  method clutter_ease_in_out_elastic (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_elastic($tt, $dd);
  }

  method clutter_ease_in_out_expo (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_expo($tt, $dd);
  }

  method clutter_ease_in_out_quad (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_quad($tt, $dd);
  }

  method clutter_ease_in_out_quart (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_quart($tt, $dd);
  }

  method clutter_ease_in_out_quint (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_quint($tt, $dd);
  }

  method clutter_ease_in_out_sine (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_out_sine($tt, $dd);
  }

  method clutter_ease_in_quad (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_quad($tt, $dd);
  }

  method clutter_ease_in_quart (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_quart($tt, $dd);
  }

  method clutter_ease_in_quint (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_quint($tt, $dd);
  }

  method clutter_ease_in_sine (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_in_sine($tt, $dd);
  }

  method clutter_ease_out_back (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_back($tt, $dd);
  }

  method clutter_ease_out_bounce (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_bounce($tt, $dd);
  }

  method clutter_ease_out_circ (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_circ($tt, $dd);
  }

  method clutter_ease_out_cubic (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_cubic($tt, $dd);
  }

  method clutter_ease_out_elastic (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_elastic($tt, $dd);
  }

  method clutter_ease_out_expo (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_expo($tt, $dd);
  }

  method clutter_ease_out_quad (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_quad($tt, $dd);
  }

  method clutter_ease_out_quart (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_quart($tt, $dd);
  }

  method clutter_ease_out_quint (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_quint($tt, $dd);
  }

  method clutter_ease_out_sine (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_ease_out_sine($tt, $dd);
  }

  method clutter_ease_steps_end (Num() $t, Num() $d, Int() $steps) {
    my gdouble ($tt, $dd) = ($t, $d);
    my gint     $s        =  $steps;

    clutter_ease_steps_end($tt, $dd, $s);
  }

  method clutter_ease_steps_start (Num() $t, Num() $d, Int() $steps) {
    my gdouble ($tt, $dd) = ($t, $d);
    my gint     $s        =  $steps;

    clutter_ease_steps_start($t, $d, $steps);
  }

  method clutter_get_easing_func_for_mode (Int() $mode) {
    my MutterClutterAnimationMode $m = $mode;

    clutter_get_easing_func_for_mode($mode);
  }

  method clutter_get_easing_name_for_mode (Int() $mode) {
    my MutterClutterAnimationMode $m = $mode;

    clutter_get_easing_name_for_mode($mode);
  }

  method clutter_linear (Num() $t, Num() $d) {
    my gdouble ($tt, $dd) = ($t, $d);

    clutter_linear($tt, $dd);
  }

  method for_mode (Int() $mode, Num() $t, Num() $d) {
    my MutterClutterAnimationMode  $m        =  $mode;
    my gdouble                    ($tt, $dd) = ($t, $d);

    clutter_easing_for_mode($mode, $t, $d);
  }

}
