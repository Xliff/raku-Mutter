use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::AlignConstraint;

### /usr/src/mutter-42.1/clutter/clutter/clutter-align-constraint.h

sub clutter_align_constraint_get_align_axis (
  MutterClutterAlignConstraint $align
)
  returns MutterClutterAlignAxis
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_get_factor (
  MutterClutterAlignConstraint $align
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_get_pivot_point (
  MutterClutterAlignConstraint $align,
  graphene_point_t             $pivot_point
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_get_source (
  MutterClutterAlignConstraint $align
)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_new (
  MutterClutterActor     $source,
  MutterClutterAlignAxis $axis,
  gfloat                 $factor
)
  returns MutterClutterConstraint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_set_align_axis (
  MutterClutterAlignConstraint $align,
  MutterClutterAlignAxis       $axis
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_set_factor (
  MutterClutterAlignConstraint $align,
  gfloat                       $factor
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_set_pivot_point (
  MutterClutterAlignConstraint $align,
  graphene_point_t             $pivot_point
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_align_constraint_set_source (
  MutterClutterAlignConstraint $align,
  MutterClutterActor           $source
)
  is native(mutter-clutter)
  is export
{ * }
