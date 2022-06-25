use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Context;

### /usr/src/mutter-42.1/src/meta/meta-context.h

sub meta_context_add_option_entries (
  MetaContext  $context,
  GOptionEntry $entries,
  Str          $translation_domain
)
  is native(mutter)
  is export
{ * }

sub meta_context_add_option_group (
  MetaContext  $context,
  GOptionGroup $group
)
  is native(mutter)
  is export
{ * }

sub meta_context_configure (
  MetaContext             $context,
  gint                    $argc     is rw,
  CArray[CArray[Str]]     $argv,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_destroy (MetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_context_get_backend (MetaContext $context)
  returns MetaBackend
  is native(mutter)
  is export
{ * }

sub meta_context_get_compositor_type (MetaContext $context)
  returns MetaCompositorType
  is native(mutter)
  is export
{ * }

sub meta_context_get_display (MetaContext $context)
  returns MetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_context_is_replacing (MetaContext $context)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_notify_ready (MetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_context_raise_rlimit_nofile (
  MetaContext             $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_restore_rlimit_nofile (
  MetaContext             $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_run_main_loop (
  MetaContext             $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_set_gnome_wm_keybindings (
  MetaContext $context,
  Str         $wm_keybindings
)
  is native(mutter)
  is export
{ * }

sub meta_context_set_plugin_gtype (MetaContext $context, GType $plugin_gtype)
  is native(mutter)
  is export
{ * }

sub meta_context_set_plugin_name (MetaContext $context, Str $plugin_name)
  is native(mutter)
  is export
{ * }

sub meta_context_setup (MetaContext $context, CArray[Pointer[GError]] $error)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_start (MetaContext $context, CArray[Pointer[GError]] $error)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_terminate (MetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_context_terminate_with_error (
  MetaContext     $context,
  Pointer[GError] $error
)
  is native(mutter)
  is export
{ * }

sub meta_create_context (Str $name)
  returns MetaContext
  is native(mutter)
  is export
{ * }
