use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::VirtualInputDevice;

### /usr/src/mutter-clutter-42.1/clutter/clutter/clutter-virtual-input-device.h

sub clutter_virtual_input_device_get_device_type (
  MutterClutterVirtualInputDevice $virtual_device
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_get_seat (
  MutterClutterVirtualInputDevice $virtual_device
)
  returns MutterClutterSeat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_absolute_motion (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  gdouble                         $x,
  gdouble                         $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_button (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  uint32_t                        $button,
  MutterClutterButtonState        $button_state
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_discrete_scroll (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  MutterClutterScrollDirection    $direction,
  MutterClutterScrollSource       $scroll_source
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_key (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  uint32_t                        $key,
  MutterClutterKeyState           $key_state
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_keyval (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  uint32_t                        $keyval,
  MutterClutterKeyState           $key_state
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_relative_motion (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  gdouble                         $dx,
  gdouble                         $dy
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_scroll_continuous (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  gdouble                         $dx,
  gdouble                         $dy,
  MutterClutterScrollSource       $scroll_source,
  MutterClutterScrollFinishFlags  $finish_flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_touch_down (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  gint                            $slot,
  gdouble                         $x,
  gdouble                         $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_touch_motion (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  gint                            $slot,
  gdouble                         $x,
  gdouble                         $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_virtual_input_device_notify_touch_up (
  MutterClutterVirtualInputDevice $virtual_device,
  uint64_t                        $time_us,
  gint                            $slot
)
  is native(mutter-clutter)
  is export
{ * }
