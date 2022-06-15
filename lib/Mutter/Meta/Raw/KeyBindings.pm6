use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Keybindings;

### /usr/include/mutter-10/meta/keybindings.h

sub meta_key_binding_get_mask (MetaKeyBinding $binding)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_key_binding_get_modifiers (MetaKeyBinding $binding)
  returns MetaVirtualModifier
  is native(mutter)
  is export
{ * }

sub meta_key_binding_get_name (MetaKeyBinding $binding)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_key_binding_is_builtin (MetaKeyBinding $binding)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_key_binding_is_reversed (MetaKeyBinding $binding)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_keybindings_set_custom_handler (
  Str      $name,
           &handler (
             MetaDisplay,
             MetaWindow,
             ClutterKeyEvent,
             MetaKeyBinding,
             gpointer
           ), #= MetaKeyHandlerFunc
  gpointer $user_data,
           &free_data (gpointer)
)
  returns uint32
  is native(mutter)
  is export
{ * }
