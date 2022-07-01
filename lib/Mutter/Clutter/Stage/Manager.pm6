use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::GSList;

use GLib::Roles::Object;

class Mutter::Clutter::Stage::Manager {
  also does GLib::Roles::Object;
  
  has MutterClutterStageManager $!mcsm is implementor;

  method get_default {
    my $mutter-clutter-stage-manager = clutter_stage_manager_get_default;

    $mutter-clutter-stage-manager
      ?? self.bless( :$mutter-clutter-stage-manager )
      !! Nil;
  }

  method get_default_stage ( :$raw = False ) {
    propReturnObject(
      clutter_stage_manager_get_default_stage($!mcsm),
      $raw,
      |Mutter::Clutter::Stage.getTypePair
    )
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_stage_manager_get_type, $n, $t );
  }

  method list_stages ( :$raw = False, :$glist = False ) {
    returnGSList(
      clutter_stage_manager_list_stages($!mcsm),
      $raw,
      $glist,
      |Mutter::Clutter::Stage.getTypePair
    );
  }

  method peek_stages ( :$raw = False, :$glist = False ) {
    returnGSList(
      clutter_stage_manager_peek_stages($!mcsm),
      $raw,
      $glist
      |Mutter::Clutter::Stage.getTypePair
    );
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-stage-manager.h

sub clutter_stage_manager_get_default ()
  returns MutterClutterStageManager
  is native(mutter)
  is export
{ * }

sub clutter_stage_manager_get_default_stage (
  MutterClutterStageManager $stage_manager
)
  returns MutterClutterStage
  is native(mutter)
  is export
{ * }

sub clutter_stage_manager_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_stage_manager_list_stages (
  MutterClutterStageManager $stage_manager
)
  returns GSList
  is native(mutter)
  is export
{ * }

sub clutter_stage_manager_peek_stages (
  MutterClutterStageManager $stage_manager
)
  returns GSList
  is native(mutter)
  is export
{ * }
