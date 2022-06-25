use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Clutter::Actor::Meta {
  also does GLib::Roles::Object;

  has MutterClutterActorMeta $!mcam is implementor;

  submethod BUILD ( :$mutter-clutter-actor-meta ) {
    self.setMutterClutterActorMeta($mutter-clutter-actor-meta)
      if $mutter-clutter-actor-meta;
  }

  method setMutterClutterActorMeta (MutterClutterActorMetaAncestry $_) {
    my $to-parent;
    $!mcam = do {
      when MutterClutterActorMeta {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterActorMeta, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterActorMeta
    is also<MutterClutterActorMeta>
  { $!mcam }

  method new (
    MutterClutterActorMetaAncestry  $mutter-clutter-actor-meta,
                                   :$ref                        = True
  ) {
    return unless $mutter-clutter-actor-meta;

    my $o = self.bless( :$mutter-clutter-actor-meta );
    $o.ref if $ref;
    $o;
  }

  method get_actor (:$raw = False) {
    propReturnObject(
      clutter_actor_meta_get_actor($!mcam)
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    )
  }

  method enabled is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_enabled    },
      STORE => -> $, \v { self.set_enabled(v) }
  }

  method name is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_name    },
      STORE => -> $, \v { self.set_name(v) }
  }

  method get_enabled {
    so clutter_actor_meta_get_enabled($!mcam);
  }

  method get_name  {
    clutter_actor_meta_get_name($!mcam),
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_actor_meta_get_type, $n, $t );
  }

  method set_enabled (gboolean $is_enabled) {
    clutter_actor_meta_set_enabled($!mcam, $is_enabled);
  }

  method set_name (Str $name) {
    clutter_actor_meta_set_name($!mcam, $name);
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-actor-meta.h

sub clutter_actor_meta_get_actor (ClutterActorMeta $meta)
  returns ClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_meta_get_enabled (ClutterActorMeta $meta)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_meta_get_name (ClutterActorMeta $meta)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_meta_get_type
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_meta_set_enabled (
  ClutterActorMeta $meta,
  gboolean         $is_enabled
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_meta_set_name (ClutterActorMeta $meta, Str $name)
  is native(mutter-clutter)
  is export
{ * }
