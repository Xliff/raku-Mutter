use v6.c;

use NativeCall;
use Method::Also;

use Mutter::Raw::Types;

use Mutter::Clutter::Actor;

use GLib::Roles::Implementor;

our subset MutterMetaWindowGroupAncestry is export of Mu
  where MutterMetaWindowGroup | MutterClutterActorAncestry;

class Mutter::Meta::WindowGroup is Mutter::Clutter::Actor {
  has MutterMetaWindowGroup $!mmwg is implementor;

  submethod BUILD ( :$mutter-meta-window-group ) {
    self.setMutterMetaWindowGroup($mutter-meta-window-group)
      if $mutter-meta-window-group
  }

  method setMutterMetaWindowGroup (MutterMetaWindowGroupAncestry $_) {
    my $to-parent;

    $!mmwg = do {
      when MutterMetaWindowGroup {
        $to-parent = cast(MutterClutterActor, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaWindowGroup, $_);
      }
    }
    self.setMutterClutterActor($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaWindowGroup
    is also<MutterMetaWindowGroup>
  { $!mmwg }

  multi method new (
    MutterMetaWindowGroupAncestry  $mutter-meta-window-group,
                                  :$ref                       = True
  ) {
    return unless $mutter-meta-window-group;

    my $o = self.bless( :$mutter-meta-window-group );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterMetaDisplay() $display) {
    my $mutter-meta-window-group = meta_window_group_new($display);

    $mutter-meta-window-group ?? self.bless( :$mutter-meta-window-group )
                              !! Nil;
  }
}

### /usr/src/mutter-42.1/src/meta/meta-window-group.h

sub meta_window_group_new (MutterMetaDisplay $display)
  returns MutterMetaWindowGroup
  is export
  is native(mutter)
{ * }
