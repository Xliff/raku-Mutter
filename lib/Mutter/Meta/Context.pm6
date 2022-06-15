use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Meta::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::Context {
  also does GLib::Roles::Object;

  method create_context ( :$raw = False )
    is also<
      create-context
      create
      new
    >
  {
      my $meta-context = meta_create_context($!mc);

      $meta-context ?? self.bless( :$meta-context ) !! Nil;
  }

  method add_option_entries (
    GOptionEntry() $entries,
    Str()          $translation_domain
  )
    is also<add-option-entries>
  {
    meta_context_add_option_entries($!mc, $entries, $translation_domain);
  }

  method add_option_group (GOptionGroup() $group) is also<add-option-group> {
    meta_context_add_option_group($!mc, $group);
  }

  method configure (
                            $argc is rw,
    CArray[CArray[Str]]     $argv,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ac = $argc;

    meta_context_configure($!mc, $a, $argv, $error);
  }

  method destroy {
    meta_context_destroy($!mc);
  }

  method get_backend ( :$raw = False )
    is also<
      get-backend
      backend
    >
  {
    propReturnObject(
      meta_context_get_backend($!mc),
      $raw,
      |Mutter::Meta::Backend.getTypePair
    );
  }

  method get_compositor_type
    is also<
      get-compositor-type
      compositor-type
      compositor_type
    >
  {
    meta_context_get_compositor_type($!mc);
  }

  method get_display ( :$raw = False )
    is also<
      get-display
      display
    >
  {
    propReturnObject(
      meta_context_get_display($!mc),
      $raw,
      |Mutter::Meta::Display.getTypePair
    );
  }

  method is_replacing is also<is-replacing> {
    so meta_context_is_replacing($!mc);
  }

  method notify_ready is also<notify-ready> {
    meta_context_notify_ready($!mc);
  }

  method raise_rlimit_nofile (CArray[Pointer[GError]] $error = gerror)
    is also<raise-rlimit-nofile>
  {
    clear_error;
    meta_context_raise_rlimit_nofile($!mc, $error);
    set_error($error);
  }

  method restore_rlimit_nofile (CArray[Pointer[GError]] $error = gerror)
    is also<restore-rlimit-nofile>
  {
    clear_error;
    meta_context_restore_rlimit_nofile($!mc, $error);
    set_error($error);
  }

  method run_main_loop (CArray[Pointer[GError]] $error = gerror)
    is also<run-main-loop>
  {
    clear_error;
    meta_context_run_main_loop($!mc, $error);
    set_error($error);
  }

  method set_gnome_wm_keybindings (Str() $wm_keybindings)
    is also<set-gnome-wm-keybindings>
  {
    meta_context_set_gnome_wm_keybindings($!mc, $wm_keybindings);
  }

  method set_plugin_gtype (Int() $plugin_gtype) is also<set-plugin-gtype> {
    my GType $p = $plugin_gtype;

    meta_context_set_plugin_gtype($!mc, $p);
  }

  method set_plugin_name (Str() $plugin_name) is also<set-plugin-name> {
    meta_context_set_plugin_name($!mc, $plugin_name);
  }

  method setup (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    meta_context_setup($!mc, $error);
    set_error($error);
  }

  method start (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    meta_context_start($!mc, $error);
    set_error($error);
  }

  method terminate {
    meta_context_terminate($!mc);
  }

  method terminate_with_error (Pointer[GError] $error)
    is also<terminate-with-error>
  {
    meta_context_terminate_with_error($!mc, $error);
  }

}
