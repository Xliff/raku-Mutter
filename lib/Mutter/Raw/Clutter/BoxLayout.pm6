use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::BoxLayout;

### /usr/src/mutter-42.1/clutter/clutter/clutter-box-layout.h

sub clutter_box_layout_get_homogeneous (MutterClutterBoxLayout $layout)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_get_orientation (MutterClutterBoxLayout $layout)
  returns MutterClutterOrientation
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_get_spacing (MutterClutterBoxLayout $layout)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_new ()
  returns MutterClutterLayoutManager
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_set_homogeneous (
  MutterClutterBoxLayout $layout,
  gboolean               $homogeneous
)
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_set_orientation (
  MutterClutterBoxLayout   $layout,
  MutterClutterOrientation $orientation
)
  is native(mutter)
  is export
{ * }

sub clutter_box_layout_set_spacing (
  MutterClutterBoxLayout $layout,
  guint                  $spacing
)
  is native(mutter)
  is export
{ * }
