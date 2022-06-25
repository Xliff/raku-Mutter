use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Plugin;

class Mutter::Meta::Plugin {
  has MetaPlugin $!mp is implementor;

  method destroy_completed (MetaWindowActor() $actor) {
    meta_plugin_destroy_completed($!mp, $actor);
  }

  method get_display {
    meta_plugin_get_display($!mp);
  }

  method get_info {
    meta_plugin_get_info($!mp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_plugin_get_type, $n, $t );
  }

  method manager_set_plugin_type {
    meta_plugin_manager_set_plugin_type($!mp);
  }

  method map_completed (MetaWindowActor() $actor) {
    meta_plugin_map_completed($!mp, $actor);
  }

  method minimize_completed (MetaWindowActor() $actor) {
    meta_plugin_minimize_completed($!mp, $actor);
  }

  method register_type (GTypeModule $typeModule) {
    meta_plugin_register_type($typeModule);
  }

  method size_change_completed (MetaWindowActor() $actor) {
    meta_plugin_size_change_completed($!mp, $actor);
  }

  method switch_workspace_completed {
    meta_plugin_switch_workspace_completed($!mp);
  }

  method unminimize_completed (MetaWindowActor() $actor) {
    meta_plugin_unminimize_completed($!mp, $actor);
  }

}
