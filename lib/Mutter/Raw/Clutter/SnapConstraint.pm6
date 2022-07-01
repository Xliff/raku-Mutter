use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Snap::Constraint;

### /usr/src/mutter-42.1/clutter/clutter/clutter-snap-constraint.h

sub clutter_snap_constraint_get_edges (
  MutterClutterSnapConstraint $constraint,
  MutterClutterSnapEdge       $from_edge,
  MutterClutterSnapEdge       $to_edge
)
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_get_offset (
  MutterClutterSnapConstraint $constraint
)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_get_source (
  MutterClutterSnapConstraint $constraint
)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_new (
  MutterClutterActor    $source,
  MutterClutterSnapEdge $from_edge,
  MutterClutterSnapEdge $to_edge,
  gfloat                $offset
)
  returns MutterClutterConstraint
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_set_edges (
  MutterClutterSnapConstraint $constraint,
  MutterClutterSnapEdge       $from_edge,
  MutterClutterSnapEdge       $to_edge
)
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_set_offset (
  MutterClutterSnapConstraint $constraint,
  gfloat                      $offset
)
  is native(mutter)
  is export
{ * }

sub clutter_snap_constraint_set_source (
  MutterClutterSnapConstraint $constraint,
  MutterClutterActor          $source
)
  is native(mutter)
  is export
{ * }
