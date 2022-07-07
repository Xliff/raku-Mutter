use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role Mutter::Clutter::Roles::Scriptable {
  has MutterClutterScriptable $!mcs is implementor;

  method roleInit-MutterClutterScriptable {
    return if $!mcs;

    my \i = findProperImplementor(self.^attributes);

    $!mcs = cast( MutterClutterScriptable, i.get_value(self) )
  }

  method Mutter::Raw::Definitions::MutterClutterScriptable
  { $!mcs }

  method id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_id    },
      STORE => -> $, \v { self.set_id(v) }
  }

  method get_id {
    clutter_scriptable_get_id($!mcs);
  }

  method mutterclutterscriptable_get_type {
    state ($n, $t);

    unstable_get_type( ::?CLASS.^name, &clutter_scriptable_get_type, $n, $t );
  }

  method parse_custom_node (
    MutterClutterScript() $script,
    GValue()              $value,
    Str()                 $name,
    JsonNode()            $node
  ) {
    clutter_scriptable_parse_custom_node($!mcs, $script, $value, $name, $node);
  }

  method set_custom_property (
    MutterClutterScript() $script,
    Str()                 $name,
    GValue()              $value
  ) {
    clutter_scriptable_set_custom_property($!mcs, $script, $name, $value);
  }

  method set_id (Str() $id_) {
    clutter_scriptable_set_id($!mcs, $id_);
  }
}

our subset MutterClutterScriptableAncestry is export of Mu
  where MutterClutterScriptable | GObject;

class Mutter::Scriptable {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Scriptable;

  submethod BUILD ( :$mutter-clutter-scriptable ) {
    self.setMutterMutterClutterScriptable($mutter-clutter-scriptable)
      if $mutter-clutter-scriptable
  }

  method setMutterMutterClutterScriptable(
    MutterClutterScriptableAncestry $_
  ) {
    my $to-parent;

    $!mcs = do {
      when MutterClutterScriptable {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterScriptable, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (
    MutterClutterScriptableAncestry  $mutter-clutter-scriptable,
                                    :$ref                        = True
  ) {
    return Nil unless $mutter-clutter-scriptable;

    my $o = self.bless( :$mutter-clutter-scriptable );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.mutterclutterscriptable_get_type
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-scriptable.h

sub clutter_scriptable_get_id (MutterClutterScriptable $scriptable)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_scriptable_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_scriptable_parse_custom_node (
  MutterClutterScriptable $scriptable,
  MutterClutterScript     $script,
  GValue                  $value,
  Str                     $name,
  JsonNode                $node
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_scriptable_set_custom_property (
  MutterClutterScriptable $scriptable,
  MutterClutterScript     $script,
  Str                     $name,
  GValue                  $value
)
  is native(mutter)
  is export
{ * }

sub clutter_scriptable_set_id (MutterClutterScriptable $scriptable, Str $id)
  is native(mutter)
  is export
{ * }
