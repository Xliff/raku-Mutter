use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterChildMetaAncestry is export of Mu
  where MutterClutterChildMeta | GObject;

class Mutter::Clutter::ChildMeta {
  also does GLib::Roles::Object;

  has MutterClutterChildMeta $!mccm is implementor;

  submethod BUILD ( :$mutter-clutter-child-meta ) {
    self.setMutterClutterChildMeta($mutter-clutter-child-meta)
      if $mutter-clutter-child-meta;
  }

  method setMutterClutterChildMeta (MutterClutterChildMetaAncestry $_) {
    my $to-parent;

    $!mccm = do {
      when MutterClutterChildMeta {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterChildMeta, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterChildMeta
  { $!mccm }

  # Type: MutterContainer
  method container ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Container.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('container', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Container.getTypePair
        );
      },
      STORE => -> $, MutterClutterContainer() $val is copy {
        $gv.object = $val;
        self.prop_set('container', $gv);
      }
    );
  }

  # Type: MutterActor
  method actor ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Actor.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('actor', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Actor.getTypePair
        );
      },
      STORE => -> $, MutterClutterActor() $val is copy {
        $gv.object = $val;
        self.prop_set('actor', $gv);
      }
    );
  }

  method new (
    MutterClutterChildMetaAncestry  $mutter-clutter-child-meta,
                                  :$ref                         = True
  ) {
    return Nil unless $mutter-clutter-child-meta;

    my $o = self.bless( :$mutter-clutter-child-meta );
    $o.ref if $ref;
    $o;
  }

  method get_actor (:$raw = False ) {
    propReturnObject(
      clutter_child_meta_get_actor($!mccm),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    )
  }

  method get_container (:$raw = False ) {
    propReturnObject(
      clutter_child_meta_get_container($!mccm),
      $raw,
      |::('Mutter::Clutter::Container').getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_child_meta_get_type, $n, $t );
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-child-meta.h

sub clutter_child_meta_get_actor (MutterClutterChildMeta $data)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_child_meta_get_container (MutterClutterChildMeta $data)
  returns MutterClutterContainer
  is native(mutter-clutter)
  is export
{ * }

sub clutter_child_meta_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
