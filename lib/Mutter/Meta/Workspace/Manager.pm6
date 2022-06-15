use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Meta::Raw::Workspace::Manager;

use GLib::Roles::Object;
use GLib::Roles::Signals::Generic;

our subset MetaWorkspaceManagerAncestry is export of Mu
  where MetaWorkspaceManager | GObject;

class Mutter::Meta::Workspace::Manager {
  also does Positional
  also does GLib::Roles::Object;

  submethod BUILD ( :$meta-workspace-manager ) {
    self.setMetaWorkspaceManager($meta-workspace-manager)
      if $meta-workspace-manager;
  }

  method setMetaWorkspaceManager (MetaWorkspaceManagerAncestry $_) {
    my $to-parent;

    $!gfc = do {
      when MetaWorkspaceManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MetaWorkspaceManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Meta::Raw::Definitions::MetaWorkspaceManager
    is also<MetaWorkspaceManager>
  { $!gfc }

  multi method new (
    MetaWorkspaceManagerAncestry  $meta-workspace-manager,
                                 :$ref                     = True
  ) {
    return Nil unless $meta-workspace-manager;

    my $o = self.bless( :$meta-workspace-manager );
    $o.ref if $ref;
    $o;
  }

  # Type: int
  method layout-columns is also<layout_columns> is rw  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('layout-columns', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('layout-columns', $gv);
      }
    );
  }

  # Type: int
  method layout-rows is also<layout_rows> is rw  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('layout-rows', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('layout-rows', $gv);
      }
    );
  }

  # Type: int
  method n-workspaces is also<n_workspaces> is rw  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-workspaces', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('n-workspaces', $gv);
      }
    );
  }

  method active-workspace-changed {
    self.connect($!mwm, 'active-workspace-changed');
  }

  method active-desktop-changed {
    self.connect($!mwm, 'active-desktop-changed');
  }

  method workspace-added {
    self.connect-int($!mwm, 'workspace-added');
  }

  method workspace-removed {
    self.connect-int($!mwm, 'workspace-removed');
  }

  method workspace-switched {
    # 3 int
  }

  method workspaces-reordered {
    self.connect($!mwm, 'workspaces-reordered');
  }

  method append_new_workspace (Int() $activate, Int() $timestamp)
    is also<append-new-workspace>
  {
    my gboolean $a = $activate.so.Int;
    my  guint32 $t = $timestamp;

    meta_workspace_manager_append_new_workspace($!mwm, $a, $t);
  }

  method get_active_workspace ( :$raw = False ) is also<get-active-workspace> {
    propReturnObject(
      meta_workspace_manager_get_active_workspace($!mwm),
      $raw,
      |Mutter::Meta::Workspace.getTypePair
    );
  }

  method get_active_workspace_index is also<get-active-workspace-index> {
    meta_workspace_manager_get_active_workspace_index($!mwm);
  }

  method get_n_workspaces
    is also<
      get-n-workspaces
      elems
    >
  {
    meta_workspace_manager_get_n_workspaces($!mwm);
  }

  method get_workspace_by_index (Int() $index, :$raw = False)
    is also<get-workspace-by-index>
  {
    my gint $i = $index;

    propReturnObject(
      meta_workspace_manager_get_workspace_by_index($!mwm, $index),
      $raw,
      |Mutter::Meta::Workspace.getTypePair
    );
  }

  method AT-POS (\k) {
    self.get_workspace_by_index(k);
  }

  method get_workspaces ( :$raw = False, :$glist = False )
    is also<get-workspaces>
  {
    returnGList(
      meta_workspace_manager_get_workspaces($!mwm),
      $raw,
      $glist,
      |Mutter::Meta::Workspace.getTypePair
    )
  }

  method override_workspace_layout (
    Int() $starting_corner,
    Int() $vertical_layout,
    Int() $n_rows,
    Int() $n_columns
  )
    is also<override-workspace-layout>
  {
    my MetaDisplayCorner  $s        =  $starting_corner;
    my gboolean           $v        =  $vertical_layout;
    my gint              ($nr, $nc) = ($n_rows, $n_columns);

    meta_workspace_manager_override_workspace_layout($!mwm, $s, $v, $nr, $nc);
  }

  method remove_workspace (MetaWorkspace() $workspace, Int() $timestamp)
    is also<remove-workspace>
  {
    my guint32 $t = $timestamp;

    meta_workspace_manager_remove_workspace($!mwm, $workspace, $t);
  }

  method reorder_workspace (MetaWorkspace() $workspace, Int() $new_index)
    is also<reorder-workspace>
  {
    myt gint $n = $new_index;

    meta_workspace_manager_reorder_workspace($!mwm, $workspace, $n);
  }

}
