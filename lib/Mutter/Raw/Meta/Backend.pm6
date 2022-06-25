use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Backend;

### /usr/src/mutter-42.1/src/meta/meta-backend.h

sub meta_backend_get_context (MetaBackend $backend)
  returns MetaContext
  is native(mutter)
  is export
{ * }

sub meta_backend_get_core_idle_monitor (MetaBackend $backend)
  returns MetaIdleMonitor
  is native(mutter)
  is export
{ * }

sub meta_backend_get_dnd (MetaBackend $backend)
  returns MetaDnd
  is native(mutter)
  is export
{ * }

sub meta_backend_get_monitor_manager (MetaBackend $backend)
  returns MetaMonitorManager
  is native(mutter)
  is export
{ * }

sub meta_backend_get_remote_access_controller (MetaBackend $backend)
  returns MetaRemoteAccessController
  is native(mutter)
  is export
{ * }

sub meta_backend_get_settings (MetaBackend $backend)
  returns MetaSettings
  is native(mutter)
  is export
{ * }

sub meta_backend_get_stage (MetaBackend $backend)
  returns ClutterActor
  is native(mutter)
  is export
{ * }

sub meta_backend_is_headless (MetaBackend $backend)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_backend_is_rendering_hardware_accelerated (MetaBackend $backend)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_backend_lock_layout_group (MetaBackend $backend, guint $idx)
  is native(mutter)
  is export
{ * }

sub meta_clutter_init ()
  is native(mutter)
  is export
{ * }

sub meta_get_backend ()
  returns MetaBackend
  is native(mutter)
  is export
{ * }

sub meta_backend_set_keymap (
  MetaBackend $backend,
  Str         $layouts,
  Str         $variants,
  Str         $options
)
  is native(mutter)
  is export
{ * }
