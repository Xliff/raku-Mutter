use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use Mutter::Clutter::Backend;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterSettingsAncestry is export of Mu
  where MutterClutterSettings | GObject;

class Mutter::Clutter::Settings {
  also does GLib::Roles::Object;

  has MutterClutterSettings $!mcs is implementor;

  submethod BUILD ( :$mutter-clutter-settings ) {
    self.setMutterClutterSettings($mutter-clutter-settings)
      if $mutter-clutter-settings;
  }

  method setMutterClutterSettings(MutterClutterSettingsAncestry $_) {
    my $to-parent;

    $!mcs = do {
      when MutterClutterSettings {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterSettings, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterSettings
    is also<MutterClutterSettings>
  { $!mcs }

  # Singleton class, so this is all you should need!
  method get_default
    is also<
      get-default
      get
      new
    >
  {
    my $mutter-clutter-settings = clutter_settings_get_default();

    $mutter-clutter-settings ?? self.bless( :$mutter-clutter-settings )
                             !! Nil;
  }

  method backend is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Backend.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn 'backend does not allow reading' if $DEBUG;
        0;
      },
      STORE => -> $, MutterClutterBackend() $val is copy {
        $gv.object = $val;
        self.prop_set('backend', $gv);
      }
    );
  }

  # Type: int
  method double-click-time is rw  is g-property is also<double_click_time> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('double-click-time', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('double-click-time', $gv);
      }
    );
  }

  # Type: int
  method double-click-distance
    is rw
    is g-property
    is also<double_click_distance>
  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('double-click-distance', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('double-click-distance', $gv);
      }
    );
  }

  # Type: int
  method dnd-drag-threshold
    is rw
    is g-property
    is also<dnd_drag_threshold>
  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('dnd-drag-threshold', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('dnd-drag-threshold', $gv);
      }
    );
  }

  # Type: string
  method font-name is rw is g-property is also<font_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('font-name', $gv);
      }
    );
  }

  # Type: int
  method font-antialias is rw  is g-property is also<font_antialias> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-antialias', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('font-antialias', $gv);
      }
    );
  }

  # Type: int
  method font-dpi is rw  is g-property is also<font_dpi> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-dpi', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('font-dpi', $gv);
      }
    );
  }

  # Type: int
  method unscaled-font-dpi is rw  is g-property is also<unscaled_font_dpi> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        warn 'unscaled-font-dpi does not allow reading' if $DEBUG;
        0;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('unscaled-font-dpi', $gv);
      }
    );
  }

  # Type: int
  method font-hinting is rw  is g-property is also<font_hinting> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-hinting', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('font-hinting', $gv);
      }
    );
  }

  # Type: string
  method font-hint-style is rw  is g-property is also<font_hint_style> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-hint-style', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('font-hint-style', $gv);
      }
    );
  }

  # Type: string
  method font-subpixel-order
    is rw
    is g-property
    is also<font_subpixel_order>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-subpixel-order', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('font-subpixel-order', $gv);
      }
    );
  }

  # Type: int
  method long-press-duration
    is rw
    is g-property
    is also<long_press_duration>
  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('long-press-duration', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('long-press-duration', $gv);
      }
    );
  }

  # Type: uint
  method fontconfig-timestamp
    is rw
    is g-property
    is also<fontconfig_timestamp>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        warn 'fontconfig-timestamp does not allow reading' if $DEBUG;
        0;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('fontconfig-timestamp', $gv);
      }
    );
  }

  # Type: uint
  method password-hint-time
    is rw
    is g-property
    is also<password_hint_time>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('password-hint-time', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('password-hint-time', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_settings_get_type, $n, $t );
  }

}

sub clutter_settings_get_default ()
  returns MutterClutterSettings
  is native(mutter)
  is export
{ * }

sub clutter_settings_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }
