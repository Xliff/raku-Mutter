use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Workspace;

### /usr/include/mutter-10/meta/workspace.h

sub meta_workspace_activate (MetaWorkspace $workspace, guint32 $timestamp)
  is native(mutter)
  is export
{ * }

sub meta_workspace_activate_with_focus (
  MetaWorkspace $workspace,
  MetaWindow    $focus_this,
  guint32       $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_display (MetaWorkspace $workspace)
  returns MetaDisplay
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_neighbor (
  MetaWorkspace       $workspace,
  MetaMotionDirection $direction
)
  returns MetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_work_area_all_monitors (
  MetaWorkspace $workspace,
  MetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_get_work_area_for_monitor (
  MetaWorkspace $workspace,
  gint          $which_monitor,
  MetaRectangle $area
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_index (MetaWorkspace $workspace)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_workspace_list_windows (MetaWorkspace $workspace)
  returns GList # of MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_workspace_set_builtin_struts (
  MetaWorkspace $workspace,
  GSList        $struts
)
  is native(mutter)
  is export
{ * }
