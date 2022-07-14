use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::InputDevice::Tool;

### /usr/src/mutter-42.1/clutter/clutter/clutter-input-device-tool.h

sub clutter_input_device_tool_get_axes (MutterClutterInputDeviceTool $tool)
  returns MutterClutterInputAxisFlags
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_tool_get_id (MutterClutterInputDeviceTool $tool)
  returns guint64
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_tool_get_serial (MutterClutterInputDeviceTool $tool)
  returns guint64
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_tool_get_tool_type (
  MutterClutterInputDeviceTool $tool
)
  returns MutterClutterInputDeviceToolType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_device_tool_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
