use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::VirtualInputDevice;

use GLib::Roles::Implementor;

class Mutter::Clutter::VirtualInputDevice {
  has MutterClutterVirtualInputDevice $!mcvid is implementor;

  method get_device_type {
    clutter_virtual_input_device_get_device_type($!mcvid);
  }

  method get_seat ( :$raw = False ) {
    propReturnObject(
      clutter_virtual_input_device_get_seat($!mcvid),
      $raw,
      |::('Mutter::Clutter::Seat').getTypePair
    );
  }

  method notify_absolute_motion (Int() $time_us, Num() $x, Num() $y) {
    my uint64_t  $t        = $time_us;
    my gdouble  ($xx, $yy) = ($x, $y);

    clutter_virtual_input_device_notify_absolute_motion($!mcvid, $t, $xx, $yy);
  }

  method notify_button (Int() $time_us, Int() $button, Int() $button_state) {
    my uint64_t                 $t  = $time_us;
    my uint32_t                 $b  = $button;
    my MutterClutterButtonState $bs = $button_state;

    clutter_virtual_input_device_notify_button($!mcvid, $t, $b, $bs);
  }

  method notify_discrete_scroll (
    Int() $time_us,
    Int() $direction,
    Int() $scroll_source
  ) {
    my uint64_t                     $t = $time_us;
    my MutterClutterScrollDirection $d = $direction;
    my MutterClutterScrollSource    $s = $scroll_source;

    clutter_virtual_input_device_notify_discrete_scroll($!mcvid, $t, $d, $s);
  }

  method notify_key (Int() $time_us, Int() $keyval, Int() $key_state) {
    my uint64_t              $t  = $time_us;
    my uint32_t              $kv = $keyval;
    my MutterClutterKeyState $ks = $key_state;

    clutter_virtual_input_device_notify_key($!mcvid, $t, $kv, $ks);
  }

  method notify_keyval (Int() $time_us, Int() $keyval, Int() $key_state) {
    my uint64_t              $t  = $time_us;
    my uint32_t              $kv = $keyval;
    my MutterClutterKeyState $ks = $key_state;

    clutter_virtual_input_device_notify_keyval($!mcvid, $t, $kv, $ks);
  }

  method notify_relative_motion (
    Int() $time_us,
    Num() $dx,
    Num() $dy
  ) {
    my uint64_t  $t          =  $time_us;
    my gdouble  ($ddx, $ddy) = ($dx, $dy);

    clutter_virtual_input_device_notify_relative_motion(
      $!mcvid,
      $t,
      $ddx,
      $ddy
    );
  }

  method notify_scroll_continuous (
    Int() $time_us,
    Num() $dx,
    Num() $dy,
    Int() $scroll_source,
    Int() $finish_flags
  ) {
    my uint64_t                       $t          =  $time_us;
    my gdouble                       ($ddx, $ddy) = ($dx, $dy);
    my MutterClutterScrollSource      $s          =  $scroll_source;
    my MutterClutterScrollFinishFlags $f          =  $finish_flags;

    clutter_virtual_input_device_notify_scroll_continuous(
      $!mcvid,
      $t,
      $ddx,
      $ddy,
      $s,
      $f
    );
  }

  method notify_touch_down (
    Int() $time_us,
    Int() $slot,
    Num() $x,
    Num() $y
  ) {
    my uint64_t $t        =  $time_us;
    my gint     $s        =  $slot;
    my gdouble ($xx, $yy) = ($x, $y);

    clutter_virtual_input_device_notify_touch_down($!mcvid, $t, $s, $xx, $yy);
  }

  method notify_touch_motion (
    Int() $time_us,
    Int() $slot,
    Num() $x,
    Num() $y
  ) {
    my uint64_t $t        =  $time_us;
    my gint     $s        =  $slot;
    my gdouble ($xx, $yy) = ($x, $y);

    clutter_virtual_input_device_notify_touch_motion(
      $!mcvid,
      $t,
      $s,
      $xx,
      $yy
    );
  }

  method notify_touch_up (Int() $time_us, Int() $slot) {
    my uint64_t $t = $time_us;
    my gint     $s = $slot;

    clutter_virtual_input_device_notify_touch_up($!mcvid, $t, $s);
  }

}
