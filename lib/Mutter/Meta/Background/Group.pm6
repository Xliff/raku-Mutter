use v6.c;

use Method::Also;
use NativeCall;

use Meta::Raw::Types;

use GLib::Roles::Implementor;

our subset MutterMetaBackgroundGroupAncestry is export of Mu
  where MutterMetaBackgroundGroup | MutterClutterActorAncestry;

class Meta::Background::Group is Mutter::Clutter::Actor {
  has MutterMetaBackgroundGroup $!mbg is implementor;

  submethod BUILD ( :$mutter-meta-background-group ) {
    self.setMutterMetaBackgroundGroup($mutter-meta-background-group)
      if $mutter-meta-background-group
  }

  method setMutterMetaBackgroundGroup (MutterMetaBackgroundGroupAncestry $_) {
    my $to-parent;

    $!mbg = do {
      when MutterMetaBackgroundGroup {
        $to-parent = cast(MutterClutterActor, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaBackgroundGroup, $_);
      }
    }
    self.setMutterClutterActor($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaBackgroundGroup
    is also<MutterMetaBackgroundGroup>
  { $!mbg }

  multi method new (MutterMetaBackgroundGroupAncestry $mutter-meta-background-group, :$ref = True) {
    return unless $mutter-meta-background-group;

    my $o = self.bless( :$mutter-meta-background-group );
    $o.ref if $ref;
    $o;
  }

  method new {
    my $meta-background-group = meta_background_group_new();

    $meta-background-group ?? self.bless( :$meta-background-group ) !! Nil;
  }

}

### /usr/src/mutter-42.1/src/meta/meta-background-group.h

sub meta_background_group_new ()
  returns MutterMetaBackgroundGroup
  is native(mutter-clutter)
  is export
{ * }
