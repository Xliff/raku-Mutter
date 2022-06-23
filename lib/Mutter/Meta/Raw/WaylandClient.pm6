use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::WaylandClient;

### /usr/src/mutter-42.1/src/meta/meta-wayland-client.h

sub meta_wayland_client_hide_from_window_list (
  MetaWaylandClient $client,
  MetaWindow        $window
)
  is native(mutter)
  is export
{ * }

sub meta_wayland_client_new (
  GSubprocessLauncher     $launcher,
  CArray[Pointer[GError]] $error
)
  returns MetaWaylandClient
  is native(mutter)
  is export
{ * }

sub meta_wayland_client_owns_window (
  MetaWaylandClient $client,
  MetaWindow $window
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_wayland_client_show_in_window_list (
  MetaWaylandClient $client,
  MetaWindow        $window
)
  is native(mutter)
  is export
{ * }

sub meta_wayland_client_spawn (
  MetaWaylandClient       $client,
  MetaDisplay             $display,
  CArray[Pointer[GError]] $error,
  Str                     $argv0
)
  returns GSubprocess
  is native(mutter)
  is export
{ * }

sub meta_wayland_client_spawnv (
  MetaWaylandClient       $client,
  MetaDisplay             $display,
  CArray[Str]             $argv,
  CArray[Pointer[GError]] $error
)
  returns GSubprocess
  is native(mutter)
  is export
{ * }
