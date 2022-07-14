use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::InputDevice;

### /usr/src/mutter-42.1/clutter/clutter/clutter-input-device.h

sub clutter_input_device_get_capabilities (MutterClutterInputDevice $device)
  returns MutterClutterInputCapabilities
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_device_mode (MutterClutterInputDevice $device)
  returns MutterClutterInputMode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_device_name (MutterClutterInputDevice $device)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_device_node (MutterClutterInputDevice $device)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_device_type (MutterClutterInputDevice $device)
  returns MutterClutterInputDeviceType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_group_n_modes (
  MutterClutterInputDevice $device,
  gint               $group
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_has_cursor (MutterClutterInputDevice $device)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_mode_switch_button_group (
  MutterClutterInputDevice $device,
  guint              $button
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_n_buttons (MutterClutterInputDevice $device)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_n_mode_groups (MutterClutterInputDevice $device)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_n_rings (MutterClutterInputDevice $device)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_n_strips (MutterClutterInputDevice $device)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_pad_feature_group (
  MutterClutterInputDevice           $device,
  MutterClutterInputDevicePadFeature $feature,
  gint                               $n_feature
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_product_id (MutterClutterInputDevice $device)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_seat (MutterClutterInputDevice $device)
  returns MutterClutterSeat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_get_vendor_id (MutterClutterInputDevice $device)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_is_grouped (
  MutterClutterInputDevice $device,
  MutterClutterInputDevice $other_device
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_is_mode_switch_button (
  MutterClutterInputDevice $device,
  guint                    $group,
  guint                    $button
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
