use v6.c;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::InputDevice;

use GLib::Value;
use Mutter::Clutter::Seat;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterClutterInputDeviceAncestry is export of Mu
  where MutterClutterInputDevice | GObject;

class Mutter::Clutter::InputDevice {
  also does GLib::Roles::Object;

  has MutterClutterInputDevice $!mcid is implementor;

  submethod BUILD ( :$mutter-clutter-input-device ) {
    self.setMutterClutterInputDevice($mutter-clutter-input-device)
      if $mutter-clutter-input-device;
  }

  method setMutterClutterInputDevice(MutterClutterInputDeviceAncestry $_) {
    my $to-parent;

    $!mcid = do {
      when MutterClutterInputDevice {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterInputDevice, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterInputDevice
  { $!mcid }

  method new (
    MutterClutterInputDeviceAncestry  $mutter-clutter-input-device,
                                     :$ref                          = True
  ) {
    return Nil unless $mutter-clutter-input-device;

    my $o = self.bless( :$mutter-clutter-input-device );
    $o.ref if $ref;
    $o;
  }

  # Type: string
  method name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('name', $gv);
      }
    );
  }

  # Type: MutterInputDeviceType
  method device-type is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterInputDeviceType)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('device-type', $gv);
        $gv.valueFromEnum(MutterClutterInputDeviceType);
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterInputDeviceType)= $val;
        self.prop_set('device-type', $gv);
      }
    );
  }

  # Type: MutterInputCapabilities
  method capabilities is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterInputCapabilities)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('capabilities', $gv);
        $gv.valueFromEnum(MutterClutterInputCapabilities);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterInputCapabilities) = $val;
        self.prop_set('capabilities', $gv);
      }
    );
  }

  # Type: MutterSeat
  method seat ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Seat.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('seat', $gv);
        propReturnObject(
          $gv.MutterSeat,
          $raw,
          |Mutter::Clutter::Seat.getTypePair
        );
      },
      STORE => -> $, MutterClutterSeat() $val is copy {
        $gv.object = $val;
        self.prop_set('seat', $gv);
      }
    );
  }

  # Type: MutterInputMode
  method device-mode is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterInputMode)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('device-mode', $gv);
        $gv.valueFromEnum(MutterClutterInputMode);
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterInputMode) = $val;
        self.prop_set('device-mode', $gv);
      }
    );
  }

  # Type: boolean
  method has-cursor is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('has-cursor', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('has-cursor', $gv);
      }
    );
  }

  # Type: MutterBackend
  method backend ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Backend.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('backend', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Backend.getTypePair
        )
      },
      STORE => -> $, MutterClutterBackend() $val is copy {
        $gv.MutterBackend = $val;
        self.prop_set('backend', $gv);
      }
    );
  }

  # Type: string
  method vendor-id is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('vendor-id', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('vendor-id', $gv);
      }
    );
  }

  # Type: string
  method product-id is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('product-id', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('product-id', $gv);
      }
    );
  }

  # Type: int
  method n-rings is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-rings', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('n-rings', $gv);
      }
    );
  }

  # Type: int
  method n-strips is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-strips', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('n-strips', $gv);
      }
    );
  }

  # Type: int
  method n-mode-groups is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-mode-groups', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('n-mode-groups', $gv);
      }
    );
  }

  # Type: int
  method n-buttons is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-buttons', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('n-buttons', $gv);
      }
    );
  }

  # Type: string
  method device-node is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('device-node', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('device-node', $gv);
      }
    );
  }

  method get_capabilities {
    clutter_input_device_get_capabilities($!mcid);
  }

  method get_device_mode {
    MutterClutterInputModeEnum(
      clutter_input_device_get_device_mode($!mcid)
    );
  }

  method get_device_name {
    clutter_input_device_get_device_name($!mcid);
  }

  method get_device_node {
    clutter_input_device_get_device_node($!mcid);
  }

  method get_device_type {
    MutterClutterInputDeviceTypeEnum(
      clutter_input_device_get_device_type($!mcid)
    );
  }

  method get_group_n_modes (gint $group) {
    my gint $g = $group;

    clutter_input_device_get_group_n_modes($!mcid, $g);
  }

  method get_has_cursor {
    so clutter_input_device_get_has_cursor($!mcid);
  }

  method get_mode_switch_button_group (guint $button) {
    my guint $b = $button;

    clutter_input_device_get_mode_switch_button_group($!mcid, $b);
  }

  method get_n_buttons {
    clutter_input_device_get_n_buttons($!mcid);
  }

  method get_n_mode_groups {
    clutter_input_device_get_n_mode_groups($!mcid);
  }

  method get_n_rings {
    clutter_input_device_get_n_rings($!mcid);
  }

  method get_n_strips {
    clutter_input_device_get_n_strips($!mcid);
  }

  method get_pad_feature_group (Int() $feature, Int() $n_feature) {
    my MutterClutterInputDevicePadFeature $f = $feature;
    my gint                               $n = $n_feature;

    clutter_input_device_get_pad_feature_group($!mcid, $f, $n);
  }

  method get_product_id {
    clutter_input_device_get_product_id($!mcid);
  }

  method get_seat ( :$raw = False ) {
    propReturnObject(
      clutter_input_device_get_seat($!mcid),
      $raw,
      |Mutter::Clutter::Seat.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_input_device_get_type, $n, $t );
  }
  method get_vendor_id {
    clutter_input_device_get_vendor_id($!mcid);
  }

  method is_grouped (MutterClutterInputDevice() $other_device) {
    so clutter_input_device_is_grouped($!mcid, $other_device);
  }

  method is_mode_switch_button (Int() $group, Int() $button) {
    my guint ($g, $b) = ($group, $button);

    so clutter_input_device_is_mode_switch_button($!mcid, $g, $b);
  }

}
