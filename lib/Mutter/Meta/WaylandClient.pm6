use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::WaylandClient;

use GLib::Roles::Object;

class Mutter::Meta::WaylandClient {
  also does GLib::Roles::Object;

  method new (
    GSubprocessLauncher()   $launcher,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    clear_error;
    my $meta-wayland-client = meta_wayland_client_new($!mwc, $error);
    set_error($error);

    $meta-wayland-client ?? self.bless( :$meta-wayland-client ) !! Nil;
  }

  method hide_from_window_list (MetaWindow() $window) {
    meta_wayland_client_hide_from_window_list($!mwc, $window);
  }

  method owns_window (MetaWindow() $window) {
    meta_wayland_client_owns_window($!mwc, $window);
  }

  method show_in_window_list (MetaWindow() $window) {
    meta_wayland_client_show_in_window_list($!mwc, $window);
  }

  method spawn (
    MetaDisplay()           $display,
    Str()                   $argv0
    CArray[Pointer[GError]] $error    = gerror
                            :$raw     = False
  ) {
    clear_error;
    my $sp = meta_wayland_client_spawn($!mwc, $display, $error, $argv0);
    set_erorr($error);

    propReturnObject($sp, $raw, |GLib::Subprocess.getTypePair)
  }

  multi method spawnv (
    MetaDisplay()           $display,
                            @argv,
    CArray[Pointer[GError]] $error    = gerror
  ) {
    samewith($display, ArrayToCArray(Str, @argv), $error);
  }
  multi method spawnv (
    MetaDisplay()           $display,
    CArray[Str]             $argv,
    CArray[Pointer[GError]] $error    = gerror
  ) {
    clear_error;
    my $sp = meta_wayland_client_spawnv($!mwc, $display, $argv, $error);
    set_error($error);

    propReturnObject($sp, $raw, |GLib::Subprocess.getTypePair)
  }

}
