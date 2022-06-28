use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Backend;

### /usr/src/mutter-42.1/src/meta/meta-backend.h

sub meta_backend_get_context (MutterMetaBackend $backend)
  returns MutterMetaContext
  is native(mutter)
  is export
{ * }

sub meta_backend_get_core_idle_monitor (MutterMetaBackend $backend)
  returns MutterMetaIdleMonitor
  is native(mutter)
  is export
{ * }

sub meta_backend_get_dnd (MutterMetaBackend $backend)
  returns MutterMetaDnd
  is native(mutter)
  is export
{ * }

sub meta_backend_get_monitor_manager (MutterMetaBackend $backend)
  returns MutterMetaMonitorManager
  is native(mutter)
  is export
{ * }

sub meta_backend_get_remote_access_controller (MutterMetaBackend $backend)
  returns MutterMetaRemoteAccessController
  is native(mutter)
  is export
{ * }

sub meta_backend_get_settings (MutterMetaBackend $backend)
  returns MutterMetaSettings
  is native(mutter)
  is export
{ * }

sub meta_backend_get_stage (MutterMetaBackend $backend)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub meta_backend_is_headless (MutterMetaBackend $backend)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_backend_is_rendering_hardware_accelerated (MutterMetaBackend $backend)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_backend_lock_layout_group (MutterMetaBackend $backend, guint $idx)
  is native(mutter)
  is export
{ * }

sub meta_clutter_init ()
  is native(mutter)
  is export
{ * }

sub meta_get_backend ()
  returns MutterMetaBackend
  is native(mutter)
  is export
{ * }

sub meta_backend_set_keymap (
  MutterMetaBackend $backend,
  Str         $layouts,
  Str         $variants,
  Str         $options
)
  is native(mutter)
  is export
{ * }
