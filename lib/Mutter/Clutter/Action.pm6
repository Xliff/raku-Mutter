use v6.c;

use Method::Also;

use Mutter::Raw::Types;

# Abstract.
# GObject.

use Mutter::Clutter::Actor::Meta;

use GLib::Roles::Implementor;

our subset MutterClutterActionAncestry is export of Mu
  where MutterClutterAction | MutterClutterActorMetaAncestry;

class Mutter::Clutter::Action { # is Mutter::Clutter::ActorMeta {
  has MutterClutterAction $!mc-act is implementor;

  submethod BUILD ( :$mutter-clutter-action ) {
    self.setMutterClutterAction($mutter-clutter-action)
      if $mutter-clutter-action;
  }

  method Mutter::Raw::Definitions::MutterClutterAction
    is also<MutterClutterAction>
  { $!mc-act }

  method setMutterClutterAction (MutterClutterActionAncestry $_) {
    #self.IS-PROTECTED;
    my $to-parent;
    $!mc-act = do {
      when MutterClutterAction {
        $to-parent = cast(MutterClutterActorMeta, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterAction, $_);
      }
    }
    self.setMutterClutterActorMeta($to-parent);
  }

  method new (
    MutterClutterActionAncestry  $mutter-clutter-action,
                                :$ref                    = True
  ) {
    return unless $mutter-clutter-action;

    my $o = self.bless( :$mutter-clutter-action );
    $o.ref if $ref;
    $o;
  }

  method get_phase is also<get-phase> {
    MutterClutterEventPhaseEnum( clutter_action_get_phase($!mc-act) );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_action_get_type, $n, $t );
  }
}

### /usr/src/mutter-42.1/clutter/clutter/clutter-action.h

sub clutter_action_get_phase (MutterClutterAction $a)
  returns MutterClutterEventPhase
  is native(mutter-clutter)
  is export
{ * }

sub clutter_action_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
