use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Meta::Workspace::Manager;

### /usr/src/mutter-42.1/src/meta/meta-workspace-manager.h

sub meta_workspace_manager_append_new_workspace (
  MutterMetaWorkspaceManager $workspace_manager,
  gboolean                   $activate,
  guint32                    $timestamp
)
  returns MutterMetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_active_workspace (
  MutterMetaWorkspaceManager $workspace_manager
)
  returns MutterMetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_active_workspace_index (
  MutterMetaWorkspaceManager $workspace_manager
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_n_workspaces (
  MutterMetaWorkspaceManager $workspace_manager
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_workspace_by_index (
  MutterMetaWorkspaceManager $workspace_manager,
  gint                       $index
)
  returns MutterMetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_workspaces (
  MutterMetaWorkspaceManager $workspace_manager
)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_override_workspace_layout (
  MutterMetaWorkspaceManager $workspace_manager,
  MutterMetaDisplayCorner    $starting_corner,
  gboolean                   $vertical_layout,
  gint                       $n_rows,
  gint                       $n_columns
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_remove_workspace (
  MutterMetaWorkspaceManager $workspace_manager,
  MutterMetaWorkspace        $workspace,
  guint32              $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_reorder_workspace (
  MutterMetaWorkspaceManager $workspace_manager,
  MutterMetaWorkspace        $workspace,
  gint                 $new_index
)
  is native(mutter)
  is export
{ * }
