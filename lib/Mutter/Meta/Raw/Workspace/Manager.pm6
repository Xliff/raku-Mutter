use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Workspace::Manager;

### /usr/src/mutter-42.1/src/meta/meta-workspace-manager.h

sub meta_workspace_manager_append_new_workspace (
  MetaWorkspaceManager $workspace_manager,
  gboolean             $activate,
  guint32              $timestamp
)
  returns MetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_active_workspace (
  MetaWorkspaceManager $workspace_manager
)
  returns MetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_active_workspace_index (
  MetaWorkspaceManager $workspace_manager
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_n_workspaces (
  MetaWorkspaceManager $workspace_manager
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_workspace_by_index (
  MetaWorkspaceManager $workspace_manager,
  gint                 $index
)
  returns MetaWorkspace
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_get_workspaces (
  MetaWorkspaceManager $workspace_manager
)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_override_workspace_layout (
  MetaWorkspaceManager $workspace_manager,
  MetaDisplayCorner    $starting_corner,
  gboolean             $vertical_layout,
  gint                 $n_rows,
  gint                 $n_columns
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_remove_workspace (
  MetaWorkspaceManager $workspace_manager,
  MetaWorkspace        $workspace,
  guint32              $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_workspace_manager_reorder_workspace (
  MetaWorkspaceManager $workspace_manager,
  MetaWorkspace        $workspace,
  gint                 $new_index
)
  is native(mutter)
  is export
{ * }
