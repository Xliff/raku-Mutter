use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Workspace;

use GLib::Roles::Object;

class Mutter::Meta::Workspace {
  also does GLib::Roles::Object;
  
  has MetaWorkspace $!ws is implementor;

  method activate (MetaWorkspace() $workspace, Int() $timestamp) {
    my guint32 $t = $timestamp;

    meta_workspace_activate($workspace, $t);
  }

  method activate_with_focus (
    MetaWorkspace() $workspace,
    MetaWindow()    $focus_this,
    Int()           $timestamp
  ) {
    my guint32 $t = $timestamp;

    meta_workspace_activate_with_focus($workspace, $focus_this, $t);
  }

  method get_display ( :$raw = False ) {
    propReturnObject(
      meta_workspace_get_display($workspace),
      $raw,
      |Mutter::Meta::Display.getTypePair
    );
  }

  method get_neighbor (Int() $direction, :$raw = False) {
    my MetaMotionDirection $d = $direction;

    propReturnObject(
      meta_workspace_get_neighbor($workspace, $d),
      $raw,
      |self.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_workspace_get_type, $n, $t );
  }

  method get_work_area_all_monitors (MetaRectangle() $area) {
    meta_workspace_get_work_area_all_monitors($workspace, $area);
  }

  method get_work_area_for_monitor (
    Int()           $which_monitor,
    MetaRectangle() $area
  ) {
    my gint $w = $which_monitor;

    meta_workspace_get_work_area_for_monitor($workspace, $which_monitor, $area);
  }

  method index {
    meta_workspace_index($workspace);
  }

  method list_windows ( :$raw = False, :$glist = False )  {
    returnGSList(
      meta_workspace_list_windows($workspace),
      $raw,
      $glist,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method set_builtin_struts (GSList() $struts) {
    meta_workspace_set_builtin_struts($workspace, $struts);
  }

}
