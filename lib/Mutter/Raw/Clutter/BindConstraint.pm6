use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::BindConstraint;

### /usr/src/mutter-42.1/clutter/clutter/clutter-bind-constraint.h

sub clutter_bind_constraint_get_coordinate (
  MutterClutterBindConstraint $constraint
)
  returns MutterClutterBindCoordinate
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_get_offset (
  MutterClutterBindConstraint $constraint
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_get_source (
  MutterClutterBindConstraint $constraint
)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_new (
  MutterClutterActor          $source,
  MutterClutterBindCoordinate $coordinate,
  gfloat                      $offset
)
  returns MutterClutterConstraint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_set_coordinate (
  MutterClutterBindConstraint $constraint,
  MutterClutterBindCoordinate $coordinate
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_set_offset (
  MutterClutterBindConstraint $constraint,
  gfloat                      $offset
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_bind_constraint_set_source (
  MutterClutterBindConstraint $constraint,
  MutterClutterActor          $source
)
  is native(mutter-clutter)
  is export
{ * }
