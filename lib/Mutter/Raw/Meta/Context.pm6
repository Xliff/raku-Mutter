use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Context;

### /usr/src/mutter-42.1/src/meta/meta-context.h

sub meta_context_add_option_entries (
  MutterMetaContext  $context,
  GOptionEntry       $entries,
  Str                $translation_domain
)
  is native(mutter)
  is export
{ * }

sub meta_context_add_option_group (
  MutterMetaContext  $context,
  GOptionGroup       $group
)
  is native(mutter)
  is export
{ * }

sub meta_context_configure (
  MutterMetaContext       $context,
  gint                    $argc     is rw,
  CArray[CArray[Str]]     $argv,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_destroy (MutterMetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_context_get_backend (MutterMetaContext $context)
  returns MutterMetaBackend
  is native(mutter)
  is export
{ * }

sub meta_context_get_compositor_type (MutterMetaContext $context)
  returns MutterMetaCompositorType
  is native(mutter)
  is export
{ * }

sub meta_context_get_display (MutterMetaContext $context)
  returns MutterMetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_context_is_replacing (MutterMetaContext $context)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_notify_ready (MutterMetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_context_raise_rlimit_nofile (
  MutterMetaContext       $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_restore_rlimit_nofile (
  MutterMetaContext       $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_run_main_loop (
  MutterMetaContext       $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_set_gnome_wm_keybindings (
  MutterMetaContext $context,
  Str               $wm_keybindings
)
  is native(mutter)
  is export
{ * }

sub meta_context_set_plugin_gtype (
  MutterMetaContext $context,
  GType             $plugin_gtype
)
  is native(mutter)
  is export
{ * }

sub meta_context_set_plugin_name (MutterMetaContext $context, Str $plugin_name)
  is native(mutter)
  is export
{ * }

sub meta_context_setup (
  MutterMetaContext       $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_start (
  MutterMetaContext       $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_context_terminate (MutterMetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_context_terminate_with_error (
  MutterMetaContext     $context,
  Pointer[GError]       $error
)
  is native(mutter)
  is export
{ * }

sub meta_create_context (Str $name)
  returns MutterMetaContext
  is native(mutter)
  is export
{ * }
