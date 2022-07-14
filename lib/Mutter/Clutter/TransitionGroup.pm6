use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::TransitionGroup;

use Mutter::Clutter::Transition;

use GLib::Roles::Implementor;

our subset MutterClutterTransitionGroupAncestry is export of Mu
  where MutterClutterTransitionGroup | MutterClutterTransition;

class Mutter::Clutter::TransitionGroup is Mutter::Clutter::Transition {
  has MutterClutterTransitionGroup $!mctg is implementor;

  submethod BUILD ( :$mutter-clutter-transition-group ) {
    self.setTransition($mutter-clutter-transition-group)
      if $mutter-clutter-transition-group;
  }

  method setMutterClutterTransitionGroup (
    MutterClutterTransitionGroupAncestry $_
  ) {
    my $to-parent;
    $!mctg = do {
      when MutterClutterTransitionGroup {
        $to-parent = cast(MutterClutterTransition, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTransitionGroup, $_);
      }
    }
    self.setMutterClutterTransition($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterTransitionGroup
    is also<MutterClutterTransitionGroup>
  { $!mctg }

  multi method new (
    MutterClutterTransitionAncestry  $mutter-clutter-transition-group,
                                    :$ref                              = True
  ) {
    return unless $mutter-clutter-transition-group;

    my $o = self.bless( :$mutter-clutter-transition-group );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-transition-group = clutter_transition_group_new();

    $mutter-clutter-transition-group
      ?? self.bless( :$mutter-clutter-transition-group )
      !! Nil;
  }

  method add_transition (MutterClutterTransition() $transition)
    is also<add-transition>
  {
    clutter_transition_group_add_transition($!mctg, $transition);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_transition_group_get_type,
      $n,
      $t
    );
  }

  method remove_all is also<remove-all> {
    clutter_transition_group_remove_all($!mctg);
  }

  method remove_transition (MutterClutterTransition() $transition)
    is also<remove-transition>
  {
    clutter_transition_group_remove_transition($!mctg, $transition);
  }

}
