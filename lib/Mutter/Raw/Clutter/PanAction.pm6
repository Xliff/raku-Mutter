use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::PanAction;

### /usr/src/mutter-42.1/clutter/clutter/clutter-pan-action.h

sub clutter_pan_action_get_acceleration_factor (MutterClutterPanAction $self)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_constrained_motion_delta (
  MutterClutterPanAction $self,
  guint                  $point,
  gfloat                 $delta_x is rw,
  gfloat                 $delta_y is rw
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_deceleration (MutterClutterPanAction $self)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_interpolate (MutterClutterPanAction $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_interpolated_coords (
  MutterClutterPanAction $self,
  gfloat                 $interpolated_x is rw,
  gfloat                 $interpolated_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_interpolated_delta (
  MutterClutterPanAction $self,
  gfloat                 $delta_x is rw,
  gfloat                 $delta_y is rw
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_motion_coords (
  MutterClutterPanAction $self,
  guint                  $point,
  gfloat                 $motion_x is rw,
  gfloat                 $motion_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_motion_delta (
  MutterClutterPanAction $self,
  guint                  $point,
  gfloat                 $delta_x is rw,
  gfloat                 $delta_y is rw
)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_pan_axis (MutterClutterPanAction $self)
  returns MutterClutterPanAxis
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_new ()
  returns MutterClutterAction
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_set_acceleration_factor (
  MutterClutterPanAction $self,
  gdouble                $factor
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_set_deceleration (
  MutterClutterPanAction $self,
  gdouble                $rate
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_set_interpolate (
  MutterClutterPanAction $self,
  gboolean               $should_interpolate
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_pan_action_set_pan_axis (
  MutterClutterPanAction $self,
  MutterClutterPanAxis   $axis
)
  is native(mutter-clutter)
  is export
{ * }
