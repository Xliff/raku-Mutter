use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Seat;

use GLib::GList;

use Mutter::Clutter::VirtualInputDevice;

use GLib::Roles::Implementor;

class Mutter::Clutter::Seat {
  has MutterClutterSeat $!mcs is implementor;

  method bell_notify {
    clutter_seat_bell_notify($!mcs);
  }

  method create_virtual_device (Int() $device_type, :$raw = False) {
    my MutterClutterInputDeviceType $d = $device_type;

    propReturnObject(
      clutter_seat_create_virtual_device($!mcs, $d),
      $raw,
      |Mutter::Clutter::VirtualInputDevice
    );
  }

  method ensure_a11y_state {
    clutter_seat_ensure_a11y_state($!mcs);
  }

  method get_keyboard ( :$raw = False ) {
    propReturnObject(
      clutter_seat_get_keyboard($!mcs),
      $raw,
      |Mutter::Clutter::InputDevice.getTypePair
    );
  }

  method get_keymap ( :$raw = False ) {
    propReturnObject(
      clutter_seat_get_keymap($!mcs),
      $raw,
      |Mutter::Clutter::Keymap.getTypePair
    );
  }

  method get_pointer_a11y_settings (
    MutterClutterPointerA11ySettings() $settings
  ) {
    clutter_seat_get_pointer_a11y_settings($!mcs, $settings);
  }

  method get_supported_virtual_device_types {
    clutter_seat_get_supported_virtual_device_types($!mcs);
  }

  method get_touch_mode {
    clutter_seat_get_touch_mode($!mcs);
  }

  method has_touchscreen {
    clutter_seat_has_touchscreen($!mcs);
  }

  method inhibit_unfocus {
    clutter_seat_inhibit_unfocus($!mcs);
  }

  method is_unfocus_inhibited {
    so clutter_seat_is_unfocus_inhibited($!mcs);
  }

  method list_devices ( :$raw = False, :$glist = False ) {
    returnGList(
      clutter_seat_list_devices($!mcs),
      $raw,
      $glist,
      |Mutter::Clutter::InputDevice.getTypePair
    );
  }

  method peek_devices ( :$raw = False, :$glist = False ) {
    returnGList(
      clutter_seat_peek_devices($!mcs),
      $raw,
      $glist,
      |Mutter::Clutter::InputDevice.getTypePair
    );
  }

  method query_state (
    MutterClutterInputDevice()   $device,
    MutterClutterEventSequence() $sequence,
    graphene_point_t()           $coords,
    Int()                        $modifiers
  ) {
    my MutterClutterModifierType $m = $modifiers;

    clutter_seat_query_state($!mcs, $device, $sequence, $coords, $m);
  }

  method set_pointer_a11y_dwell_click_type (Int() $click_type) {
    my MutterClutterPointerA11yDwellClickType $c = $click_type;

    clutter_seat_set_pointer_a11y_dwell_click_type($!mcs, $c);
  }

  method set_pointer_a11y_settings (
    MutterClutterPointerA11ySettings $settings
  ) {
    clutter_seat_set_pointer_a11y_settings($!mcs, $settings);
  }

  method uninhibit_unfocus {
    clutter_seat_uninhibit_unfocus($!mcs);
  }

  method warp_pointer (Int() $x, Int() $y) {
    my gint ($xx, $yy) = ($x, $y);

    clutter_seat_warp_pointer($!mcs, $xx, $yy);
  }

}
