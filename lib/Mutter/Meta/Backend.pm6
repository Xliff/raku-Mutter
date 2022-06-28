use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Backend;

class GLib::Roles::Object;

class Mutter::Meta::Backend {
  also does GLib::Roles::Object;

  has MutterMetaBackend $!mb is implementor;

  method get_context ( :$raw = False ) {
    propReturnObject(
      meta_backend_get_context($!mb),
      $raw,
      |Mutter::Meta::Context.getTypePair
    );
  }

  method get_core_idle_monitor ( :$raw = False ) {
    propReturnObject(
      meta_backend_get_core_idle_monitor($!mb),
      $raw,
      |Mutter::Meta::IdleMonitor.getTypePair
    );
  }

  method get_dnd ( :$raw = False ) {
    propReturnObject(
      meta_backend_get_dnd($!mb),
      $raw,
      |Mutter::Meta::Dnd.getTypePair
    );
  }

  method get_monitor_manager ( :$raw = False) {
    propReturnObject(
      meta_backend_get_monitor_manager($!mb).
      $raw,
      Mutter::Meta::MonitorManager.getTypePair
    );
  }

  method get_remote_access_controller ( :$raw = False ) {
    propReturnObject(
      meta_backend_get_remote_access_controller($!mb).
      $raw,
      Mutter::Meta::RemoteAccessController.getTypePair
    );
  }

  method get_settings ( :$raw = False ) {
    propReturnObject(
      meta_backend_get_settings($!mb),
      $raw,
      |Mutter::Meta::Settings.getTypePair
    );
  }

  method get_stage ( :$raw = False ) {
    propReturnObject(
      meta_backend_get_stage($!mb),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method is_headless {
    so meta_backend_is_headless($!mb);
  }

  method is_rendering_hardware_accelerated {
    so meta_backend_is_rendering_hardware_accelerated($!mb);
  }

  method lock_layout_group (guint $idx) {
    my guint $i = $idx;

    meta_backend_lock_layout_group($!mb, $i);
  }

  method clutter_init {
    meta_clutter_init();
  }

  method get_backend ( :$raw = False ) {
    propReturnObject(
      meta_get_backend($!mb),
      $raw,
      |self.getTypePair
    );
  }

  method set_keymap (Str() $layouts, Str() $variants, Str() $options) {
    meta_backend_set_keymap($!mb, $layouts, $variants, $options);
  }

}
