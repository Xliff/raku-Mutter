use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::Clutter::Seat;

### /usr/src/mutter-42.1/clutter/clutter/clutter-seat.h

sub clutter_seat_bell_notify (MutterClutterSeat $seat)
  is native(mutter)
  is export
{ * }

sub clutter_seat_create_virtual_device (
  MutterClutterSeat            $seat,
  MutterClutterInputDeviceType $device_type
)
  returns MutterClutterVirtualInputDevice
  is native(mutter)
  is export
{ * }

sub clutter_seat_ensure_a11y_state (MutterClutterSeat $seat)
  is native(mutter)
  is export
{ * }

sub clutter_seat_get_keyboard (MutterClutterSeat $seat)
  returns MutterClutterInputDevice
  is native(mutter)
  is export
{ * }

sub clutter_seat_get_keymap (MutterClutterSeat $seat)
  returns MutterClutterKeymap
  is native(mutter)
  is export
{ * }

sub clutter_seat_get_pointer_a11y_settings (
  MutterClutterSeat                $seat,
  MutterClutterPointerA11ySettings $settings
)
  is native(mutter)
  is export
{ * }

sub clutter_seat_get_supported_virtual_device_types (MutterClutterSeat $seat)
  returns MutterClutterVirtualDeviceType
  is native(mutter)
  is export
{ * }

sub clutter_seat_get_touch_mode (MutterClutterSeat $seat)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_seat_has_touchscreen (MutterClutterSeat $seat)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_seat_inhibit_unfocus (MutterClutterSeat $seat)
  is native(mutter)
  is export
{ * }

sub clutter_seat_is_unfocus_inhibited (MutterClutterSeat $seat)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_seat_list_devices (MutterClutterSeat $seat)
  returns GList
  is native(mutter)
  is export
{ * }

sub clutter_seat_peek_devices (MutterClutterSeat $seat)
  returns GList
  is native(mutter)
  is export
{ * }

sub clutter_seat_query_state (
  MutterClutterSeat          $seat,
  MutterClutterInputDevice   $device,
  MutterClutterEventSequence $sequence,
  graphene_point_t           $coords,
  MutterClutterModifierType  $modifiers
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_seat_set_pointer_a11y_dwell_click_type (
  MutterClutterSeat                      $seat,
  MutterClutterPointerA11yDwellClickType $click_type
)
  is native(mutter)
  is export
{ * }

sub clutter_seat_set_pointer_a11y_settings (
  MutterClutterSeat                $seat,
  MutterClutterPointerA11ySettings $settings
)
  is native(mutter)
  is export
{ * }

sub clutter_seat_uninhibit_unfocus (MutterClutterSeat $seat)
  is native(mutter)
  is export
{ * }

sub clutter_seat_warp_pointer (MutterClutterSeat $seat, gint $x, gint $y)
  is native(mutter)
  is export
{ * }
