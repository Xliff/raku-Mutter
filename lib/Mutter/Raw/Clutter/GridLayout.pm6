use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::GridLayout;

### /usr/src/mutter-42.1/clutter/clutter/clutter-grid-layout.h

sub clutter_grid_layout_attach (
  MutterClutterGridLayout $layout,
  MutterClutterActor      $child,
  gint                    $left,
  gint                    $top,
  gint                    $width,
  gint                    $height
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_attach_next_to (
  MutterClutterGridLayout   $layout,
  MutterClutterActor        $child,
  MutterClutterActor        $sibling,
  MutterClutterGridPosition $side,
  gint                      $width,
  gint                      $height
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_child_at (
  MutterClutterGridLayout $layout,
  gint                    $left,
  gint                    $top
)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_column_homogeneous (
  MutterClutterGridLayout $layout
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_column_spacing (MutterClutterGridLayout $layout)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_orientation (MutterClutterGridLayout $layout)
  returns MutterClutterOrientation
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_row_homogeneous (MutterClutterGridLayout $layout)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_row_spacing (MutterClutterGridLayout $layout)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_insert_column (
  MutterClutterGridLayout $layout,
  gint                    $position
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_insert_next_to (
  MutterClutterGridLayout   $layout,
  MutterClutterActor        $sibling,
  MutterClutterGridPosition $side
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_insert_row (
  MutterClutterGridLayout $layout,
  gint                    $position
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_new ()
  returns MutterClutterLayoutManager
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_set_column_homogeneous (
  MutterClutterGridLayout $layout,
  gboolean                $homogeneous
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_set_column_spacing (
  MutterClutterGridLayout $layout,
  guint                   $spacing
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_set_orientation (
  MutterClutterGridLayout  $layout,
  MutterClutterOrientation $orientation
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_set_row_homogeneous (
  MutterClutterGridLayout $layout,
  gboolean                $homogeneous
)
  is native(mutter)
  is export
{ * }

sub clutter_grid_layout_set_row_spacing (
  MutterClutterGridLayout $layout,
  guint                   $spacing
)
  is native(mutter)
  is export
{ * }
