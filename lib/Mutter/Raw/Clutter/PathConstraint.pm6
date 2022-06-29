use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::PathConstraint;

### /usr/src/mutter-42.1/clutter/clutter/clutter-path-constraint.h

sub clutter_path_constraint_get_offset (
  MutterClutterPathConstraint $constraint
)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_path_constraint_get_path (MutterClutterPathConstraint $constraint)
  returns MutterClutterPath
  is native(mutter)
  is export
{ * }

sub clutter_path_constraint_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_path_constraint_new (MutterClutterPath $path, gfloat $offset)
  returns MutterClutterConstraint
  is native(mutter)
  is export
{ * }

sub clutter_path_constraint_set_offset (
  MutterClutterPathConstraint $constraint,
  gfloat                      $offset
)
  is native(mutter)
  is export
{ * }

sub clutter_path_constraint_set_path (
  MutterClutterPathConstraint $constraint,
  MutterClutterPath           $path
)
  is native(mutter)
  is export
{ * }
