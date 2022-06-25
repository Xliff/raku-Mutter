use v6.c;

use GLib::Raw::Definition;
use Mutter::Raw::Definition;

unit package Mutter::Raw::Clutter::LayoutManager;

### /usr/src/mutter-42.1/clutter/clutter/clutter-layout-manager.h

sub clutter_layout_manager_allocate (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  ClutterActorBox      $allocation
)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_child_get (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  ClutterActor         $actor,
  Str                  $first_property
)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_child_get_property (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  ClutterActor         $actor,
  Str                  $property_name,
  GValue               $value
)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_child_set (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  ClutterActor         $actor,
  Str                  $first_property)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_child_set_property (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  ClutterActor         $actor,
  Str                  $property_name,
  GValue               $value
)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_find_child_property (
  ClutterLayoutManager $manager,
  Str                  $name
)
  returns GParamSpec
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_get_child_meta (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  ClutterActor         $actor
)
  returns ClutterLayoutMeta
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_get_preferred_height (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  gfloat               $for_width,
  gfloat               $min_height_p is rw,
  gfloat               $nat_height_p is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_get_preferred_width (
  ClutterLayoutManager $manager,
  ClutterContainer     $container,
  gfloat               $for_height,
  gfloat               $min_width_p is rw,
  gfloat               $nat_width_p is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_layout_changed (ClutterLayoutManager $manager)
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_list_child_properties (
  ClutterLayoutManager $manager,
  guint                $n_pspecs is rw
)
  returns CArray[CArray[GParamSpec]]
  is native(mutter)
  is export
{ * }

sub clutter_layout_manager_set_container (
  ClutterLayoutManager $manager,
  ClutterContainer     $container
)
  is native(mutter)
  is export
{ * }
