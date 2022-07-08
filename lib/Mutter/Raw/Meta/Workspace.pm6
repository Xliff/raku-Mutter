use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Workspace;

### /usr/include/mutter-10/meta/workspace.h

sub meta_workspace_activate (
  MutterMetaWorkspace $workspace,
  guint32             $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_activate_with_focus (
  MutterMetaWorkspace $workspace,
  MutterMetaWindow    $focus_this,
  guint32             $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_display (MutterMetaWorkspace $workspace)
  returns MutterMetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_neighbor (
  MutterMetaWorkspace       $workspace,
  MutterMetaMotionDirection $direction
)
  returns MutterMetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_work_area_all_monitors (
  MutterMetaWorkspace $workspace,
  MutterMetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_work_area_for_monitor (
  MutterMetaWorkspace $workspace,
  gint                $which_monitor,
  MutterMetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_index (MutterMetaWorkspace $workspace)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_workspace_list_windows (MutterMetaWorkspace $workspace)
  returns GList # of MutterMetaWindow
  is native(mutter)
  is export
{ * }

sub meta_workspace_set_builtin_struts (
  MutterMetaWorkspace $workspace,
  GSList              $struts
)
  is native(mutter)
  is export
{ * }
