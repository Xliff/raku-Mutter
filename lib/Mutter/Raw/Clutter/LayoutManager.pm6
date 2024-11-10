use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Structs;

unit package Mutter::Raw::Clutter::LayoutManager;

### /usr/src/mutter-42.1/clutter/clutter/clutter-layout-manager.h

sub clutter_layout_manager_allocate (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  MutterClutterActorBox      $allocation
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_child_get (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  MutterClutterActor         $actor,
  Str                        $first_property
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_child_get_property (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  MutterClutterActor         $actor,
  Str                        $property_name,
  GValue                     $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_child_set (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  MutterClutterActor         $actor,
  Str                        $first_property
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_child_set_property (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  MutterClutterActor         $actor,
  Str                        $property_name,
  GValue                     $value
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_find_child_property (
  MutterClutterLayoutManager $manager,
  Str                        $name
)
  returns GParamSpec
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_get_child_meta (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  MutterClutterActor         $actor
)
  returns MutterClutterLayoutMeta
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_get_preferred_height (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  gfloat                     $for_width,
  gfloat                     $min_height_p is rw,
  gfloat                     $nat_height_p is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_get_preferred_width (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container,
  gfloat                     $for_height,
  gfloat                     $min_width_p is rw,
  gfloat                     $nat_width_p is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_layout_changed (
  MutterClutterLayoutManager $manager
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_list_child_properties (
  MutterClutterLayoutManager $manager,
  guint                      $n_pspecs is rw
)
  returns CArray[CArray[GParamSpec]]
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_manager_set_container (
  MutterClutterLayoutManager $manager,
  MutterClutterContainer     $container
)
  is native(mutter-clutter)
  is export
{ * }
