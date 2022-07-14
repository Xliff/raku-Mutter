use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::InputDevice::Tool;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterInputDeviceToolAncestry is export of Mu
  where MutterClutterInputDeviceTool | GObject;

class Mutter::Clutter::InputDevice::Tool {
  also does GLib::Roles::Object;

  has MutterClutterInputDeviceTool $!mcidt is implementor;

  submethod BUILD ( :$mutter-clutter-input-device-tool ) {
    self.setMutterClutterInputDeviceTool($mutter-clutter-input-device-tool)
      if $mutter-clutter-input-device-tool;
  }

  method setMutterClutterInputDeviceTool(
    MutterClutterInputDeviceToolAncestry $_
  ) {
    my $to-parent;

    $!mcidt = do {
      when MutterClutterInputDeviceTool {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterInputDeviceTool, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterInputDeviceTool
  { $!mcidt }

  constant CTA := MutterClutterInputDeviceToolAncestry;

  method new (CTA $mutter-clutter-input-device-tool, :$ref = True) {
    return Nil unless $mutter-clutter-input-device-tool;

    my $o = self.bless( :$mutter-clutter-input-device-tool );
    $o.ref if $ref;
    $o;
  }

  method get_axes ( :set(:$flags) = True ) {
    my $f = clutter_input_device_tool_get_axes($!mcidt);
    return $f unless $flags;
    getFlags(MutterClutterInputAxisFlags, $f)
  }

  method get_id {
    clutter_input_device_tool_get_id($!mcidt);
  }

  method get_serial {
    clutter_input_device_tool_get_serial($!mcidt);
  }

  method get_tool_type {
    MutterClutterInputDeviceToolTypeEnum(
      clutter_input_device_tool_get_tool_type($!mcidt)
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_input_device_tool_get_type,
      $n,
      $t
    );
  }

}
