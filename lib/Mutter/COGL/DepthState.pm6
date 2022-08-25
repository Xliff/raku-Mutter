use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::COGL::DepthState;

# BOXED

use GLib::Roles::Implementor;

class Mutter::COGL::DepthState {
  has MutterCoglDepthState $!mcds is implementor;

  submethod BUILD ( :$cogl-depth-state ) {
    $!mcds = $cogl-depth-state;
  }

  method Mutter::Raw::Structs::MutterCoglDepthState
    is also<MutterCoglDepthState>
  { $!mcds }

  method new {
    my $cogl-depth-state = MutterCoglDepthState.new;

    return Nil unless $cogl-depth-state;

    $cogl-depth-state = ::?CLASS.init($cogl-depth-state);

    self.bless( :$cogl-depth-state );
  }

  method range is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_range    },
      STORE => -> $, \v { self.set_range(v) }
  }

  method test_enabled is also<test-enabled> is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_test_enabled    },
      STORE => -> $, \v { self.set_test_enabled(v) }
  }

  method test_function is also<test-function> is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_test_function    },
      STORE => -> $, \v { self.set_test_function(v) }
  }

  method write_enabled is also<write-enabled> is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_write_enabled    },
      STORE => -> $, \v { self.set_write_enabled(v) }
  }

  proto method get_range (|)
    is also<get-range>
  { * }

  multi method get_range {
    samewith($, $);
  }
  multi method get_range ($near_val is rw, $far_val is rw) {
    my gfloat ($n, $f) = 0e0 xx 2;

    cogl_depth_state_get_range($!mcds, $n, $f);
    ($near_val, $far_val) = ($n, $f);
  }

  method get_test_enabled is also<get-test-enabled> {
    so cogl_depth_state_get_test_enabled($!mcds);
  }

  method get_test_function is also<get-test-function> {
    cogl_depth_state_get_test_function($!mcds);
  }

  method get_write_enabled is also<get-write-enabled> {
    so cogl_depth_state_get_write_enabled($!mcds);
  }

  method init (MutterCoglDepthState $state) is static {
    cogl_depth_state_init($state);
  }

  method set_range (Num() $near_val, Num() $far_val) is also<set-range> {
    my gfloat ($n, $f) = ($near_val, $far_val);

    cogl_depth_state_set_range($!mcds, $n, $f);
  }

  method set_test_enabled (Int() $enable) is also<set-test-enabled> {
    my gboolean $e = $enable.so.Int;

    cogl_depth_state_set_test_enabled($!mcds, $e);
  }

  method set_test_function (&function) is also<set-test-function> {
    cogl_depth_state_set_test_function($!mcds, &function);
  }

  method set_write_enabled (Int() $enable) is also<set-write-enabled> {
    my gboolean $e = $enable.so.Int;

    cogl_depth_state_set_write_enabled($!mcds, $e);
  }

}
