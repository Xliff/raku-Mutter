use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::FlowLayout;

### /usr/src/mutter-42.1/clutter/clutter/clutter-flow-layout.h

sub clutter_flow_layout_get_column_spacing (MutterClutterFlowLayout $layout)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_column_width (
  MutterClutterFlowLayout $layout,
  gfloat                  $min_width is rw,
  gfloat                  $max_width is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_homogeneous (MutterClutterFlowLayout $layout)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_orientation (MutterClutterFlowLayout $layout)
  returns MutterClutterFlowOrientation
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_row_height (
  MutterClutterFlowLayout $layout,
  gfloat                  $min_height is rw,
  gfloat                  $max_height is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_row_spacing (MutterClutterFlowLayout $layout)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_snap_to_grid (MutterClutterFlowLayout $layout)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_new (MutterClutterFlowOrientation $orientation)
  returns MutterClutterFlowLayout
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_column_spacing (
  MutterClutterFlowLayout $layout,
  gfloat                  $spacing
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_column_width (
  MutterClutterFlowLayout $layout,
  gfloat                  $min_width,
  gfloat                  $max_width
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_homogeneous (
  MutterClutterFlowLayout $layout,
  gboolean                $homogeneous
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_orientation (
  MutterClutterFlowLayout      $layout,
  MutterClutterFlowOrientation $orientation
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_row_height (
  MutterClutterFlowLayout $layout,
  gfloat                  $min_height,
  gfloat                  $max_height
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_row_spacing (
  MutterClutterFlowLayout $layout,
  gfloat                  $spacing
)
  is native(mutter)
  is export
{ * }

sub clutter_flow_layout_set_snap_to_grid (
  MutterClutterFlowLayout $layout,
  gboolean                $snap_to_grid
)
  is native(mutter)
  is export
{ * }
