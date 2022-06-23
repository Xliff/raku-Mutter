use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::MonitorManager;

### /usr/src/mutter-42.1/src/meta/meta-monitor-manager.h

sub meta_monitor_manager_can_switch_config (MetaMonitorManager $manager)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get ()
  returns MetaMonitorManager
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get_display_configuration_timeout ()
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get_is_builtin_display_on (MetaMonitorManager $manager)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get_monitor_for_connector (
  MetaMonitorManager $manager,
  Str                $connector
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get_panel_orientation_managed (
  MetaMonitorManager $manager
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get_switch_config (MetaMonitorManager $manager)
  returns MetaMonitorSwitchConfigType
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_monitor_manager_switch_config (
  MetaMonitorManager          $manager,
  MetaMonitorSwitchConfigType $config_type
)
  is native(mutter)
  is export
{ * }
