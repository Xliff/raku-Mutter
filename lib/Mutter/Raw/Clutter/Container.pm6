use v6.c;

use NativeCall;

unit package Mutter::Raw::Clutter::Container;

### /usr/src/mutter-42.1/clutter/clutter/clutter-container.h

# sub clutter_container_child_get (
#   MutterClutterContainer $container,
#   MutterClutterActor     $actor,
#   Str                    $first_prop
#   ...
# )
#   is native(mutter)
#   is export
# { * }

sub clutter_container_child_get_property (
  MutterClutterContainer $container,
  MutterClutterActor     $child,
  Str                    $property,
  GValue                 $value
)
  is native(mutter)
  is export
{ * }

sub clutter_container_child_notify (
  MutterClutterContainer $container,
  MutterClutterActor     $child,
  GParamSpec             $pspec
)
  is native(mutter)
  is export
{ * }

# sub clutter_container_child_set (
#   MutterClutterContainer $container,
#   MutterClutterActor     $actor,
#   Str                    $first_prop,
#   ...
# )
#   is native(mutter)
#   is export
# { * }

sub clutter_container_child_set_property (
  MutterClutterContainer $container,
  MutterClutterActor     $child,
  Str                    $property,
  GValue                 $value
)
  is native(mutter)
  is export
{ * }

sub clutter_container_class_find_child_property (
  GObjectClass $klass,
  Str          $property_name
)
  returns GParamSpec
  is native(mutter)
  is export
{ * }

sub clutter_container_class_list_child_properties (
  GObjectClass $klass,
  guint        $n_properties is rw
)
  returns CArray[CArray[GParamSpec]]
  is native(mutter)
  is export
{ * }

sub clutter_container_create_child_meta (
  MutterClutterContainer $container,
  MutterClutterActor     $actor
)
  is native(mutter)
  is export
{ * }

sub clutter_container_destroy_child_meta (
  MutterClutterContainer $container,
  MutterClutterActor     $actor
)0
  is native(mutter)
  is export
{ * }

sub clutter_container_find_child_by_name (
  MutterClutterContainer $container,
  Str                    $child_name
)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_container_get_child_meta (
  MutterClutterContainer $container,
  MutterClutterActor     $actor
)
  returns MutterClutterChildMeta
  is native(mutter)
  is export
{ * }

sub clutter_container_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }
