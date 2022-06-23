use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Plugin;

### /usr/src/mutter-42.1/src/meta/meta-plugin.h

sub meta_plugin_complete_display_change (MetaPlugin $plugin, gboolean $ok)
  is native(mutter)
  is export
{ * }

sub meta_plugin_destroy_completed (MetaPlugin $plugin, MetaWindowActor $actor)
  is native(mutter)
  is export
{ * }

sub meta_plugin_get_display (MetaPlugin $plugin)
  returns MetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_plugin_get_info (MetaPlugin $plugin)
  returns MetaPluginInfo
  is native(mutter)
  is export
{ * }

sub meta_plugin_get_type
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_plugin_manager_set_plugin_type (GType $gtype)
  is native(mutter)
  is export
{ * }

sub meta_plugin_map_completed (MetaPlugin $plugin, MetaWindowActor $actor)
  is native(mutter)
  is export
{ * }

sub meta_plugin_minimize_completed (
  MetaPlugin      $plugin,
  MetaWindowActor $actor
)
  is native(mutter)
  is export
{ * }

sub meta_plugin_register_type (GTypeModule $type_module)
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_plugin_size_change_completed (
  MetaPlugin      $plugin,
  MetaWindowActor $actor
)
  is native(mutter)
  is export
{ * }

sub meta_plugin_switch_workspace_completed (MetaPlugin $plugin)
  is native(mutter)
  is export
{ * }

sub meta_plugin_unminimize_completed (
  MetaPlugin      $plugin,
  MetaWindowActor $actor
)
  is native(mutter)
  is export
{ * }
