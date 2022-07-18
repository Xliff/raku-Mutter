use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use Mutter::Clutter::Actor;

use GLib::Roles::Implementor;

our subset MutterClutterCloneAncestry is export of Mu
  where MutterClutterClone | MutterClutterActorAncestry;

class Mutter::Clutter::Clone is Mutter::Clutter::Actor {
  has MutterClutterClone $!mcc is implementor;

  submethod BUILD ( :$mutter-clutter-clone ) {
    self.setMutterClutterClone($mutter-clutter-clone)
      if $mutter-clutter-clone;
  }

  method setMutterClutterClone(MutterClutterCloneAncestry $_) {
    my $to-parent;

    $!mcc = do {
      when MutterClutterClone {
        $to-parent = cast(MutterClutterActor, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterClone, $_);
      }
    }
    self.setMutterCluterActor($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterClone
    is also<MutterClutterClone>
  { $!mcc }

  multi method new (
    MutterClutterCloneAncestry  $mutter-clutter-clone,
                               :$ref                     = True
  ) {
    return Nil unless $mutter-clutter-clone;

    my $o = self.bless( :$mutter-clutter-clone );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterClutterActor() $source) {
    my $mutter-clutter-actor = clutter_clone_new($source);

    $mutter-clutter-actor ?? $mutter-clutter-actor !! Nil;
  }

  # Type: MutterClutterActor
  method source ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Actor.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Actor.getTypePair
        );
      },
      STORE => -> $, MutterClutterActor() $val is copy {
        $gv.object = $val;
        self.prop_set('source', $gv);
      }
    );
  }

  method get_source ( :$raw = False ) is also<get-source> {
    propReturnObject(
      clutter_clone_get_source($!mcc),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_clone_get_type, $n, $t );
  }

  method set_source (MutterClutterActor() $source) is also<set-source> {
    clutter_clone_set_source($!mcc, $source);
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-clone.h

sub clutter_clone_get_source (MutterClutterClone $self)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_clone_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_clone_new (MutterClutterActor $source)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_clone_set_source (
  MutterClutterClone $self,
  MutterClutterActor $source
)
  is native(mutter-clutter)
  is export
{ * }
