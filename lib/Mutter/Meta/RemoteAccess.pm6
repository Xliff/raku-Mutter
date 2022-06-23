use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::RemoteAccessController {
  has MetaRemoteAccessController $!mrac is implementor;

  method inhibit_remote_access {
    meta_remote_access_controller_inhibit_remote_access($!mrac);
  }

  method uninhibit_remote_access {
    meta_remote_access_controller_uninhibit_remote_access($!mrac);
  }

}

class Mutter::Meta::RemoteAccessHandle {
  has MetaRemoteAccessHandle $!mrah;

  method get_disable_animations {
    meta_remote_access_handle_get_disable_animations($!mrah);
  }

  method stop {
    meta_remote_access_handle_stop($!mrah);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-remote-access-controller.h

sub meta_remote_access_controller_inhibit_remote_access (
  MetaRemoteAccessController $controller
)
  is native(mutter)
  is export
{ * }

sub meta_remote_access_handle_get_disable_animations (
  MetaRemoteAccessHandle $handle
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_remote_access_handle_stop (MetaRemoteAccessHandle $handle)
  is native(mutter)
  is export
{ * }

sub meta_remote_access_controller_uninhibit_remote_access (
  MetaRemoteAccessController $controller
)
  is native(mutter)
  is export
{ * }
