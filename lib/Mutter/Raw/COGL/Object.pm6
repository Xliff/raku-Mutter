use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Structs;

unit package Mutter::Raw::COGL::Object;

### /usr/src/mutter-42.1/cogl/cogl/cogl-object.h

sub cogl_object_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_object_get_user_data (
  MutterCoglObject      $object,
  MutterCoglUserDataKey $key
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_object_ref (MutterCoglObject $object)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_object_set_user_data (
  MutterCoglObject      $object,
  MutterCoglUserDataKey $key,
  Pointer               $user_data,
                        &destroy (Pointer)
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_object_unref (MutterCoglObject $object)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_debug_object_foreach_type (
  &func (
    MutterCoglDebugObjectTypeInfo $info,
    Pointer                       $ud
  ),
  Pointer $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_debug_object_print_instances ()
  is native(mutter-clutter)
  is export
{ * }
