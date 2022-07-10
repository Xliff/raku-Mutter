use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::BindingPool;

### /usr/src/mutter-42.1/clutter/clutter/clutter-binding-pool.h

sub clutter_binding_pool_activate (
  MutterClutterBindingPool  $pool,
  guint                     $key_val,
  MutterClutterModifierType $modifiers,
  GObject                   $gobject
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_block_action (
  MutterClutterBindingPool $pool,
  Str $action_name
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_find (Str $name)
  returns MutterClutterBindingPool
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_find_action (
  MutterClutterBindingPool  $pool,
  guint                     $key_val,
  MutterClutterModifierType $modifiers
)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_get_for_class (gpointer $klass)
  returns MutterClutterBindingPool
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_install_action (
  MutterClutterBindingPool  $pool,
  Str                       $action_name,
  guint                     $key_val,
  MutterClutterModifierType $modifiers,
                            &callback (
                              GObject,
                              Str,
                              guint,
                              MutterClutterModifierType,
                              gpointer
                              --> gboolean
                            ),
  gpointer                  $data,
                            &notify (gpointer)
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_install_closure (
  MutterClutterBindingPool  $pool,
  Str                       $action_name,
  guint                     $key_val,
  MutterClutterModifierType $modifiers,
  GClosure                  $closure
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_new (Str $name)
  returns MutterClutterBindingPool
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_override_action (
  MutterClutterBindingPool  $pool,
  guint                     $key_val,
  MutterClutterModifierType $modifiers,
  gpointer                  $callback,
  gpointer                  $data,
                            &notify (gpointer)
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_override_closure (
  MutterClutterBindingPool  $pool,
  guint                     $key_val,
  MutterClutterModifierType $modifiers,
  GClosure                  $closure
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_remove_action (
  MutterClutterBindingPool  $pool,
  guint                     $key_val,
  MutterClutterModifierType $modifiers
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_binding_pool_unblock_action (
  MutterClutterBindingPool $pool,
  Str                      $action_name
)
  is native(mutter-clutter)
  is export
{ * }
