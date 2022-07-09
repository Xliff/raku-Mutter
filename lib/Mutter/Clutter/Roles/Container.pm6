use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Container;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use Mutter::Clutter::ChildMeta;

use Mutter::Clutter::Roles::Signals::Generic;
use Mutter::Clutter::Roles::Signals::Container;

role Mutter::Clutter::Roles::Container {
  also does Mutter::Clutter::Roles::Signals::Generic;
  also does Mutter::Clutter::Roles::Signals::Container;

  has MutterClutterContainer $!mcc is implementor;

  method roleInit-MutterClutterContainer {
    return if $!mcc;

    my \i = findProperImplementor(self.^attributes);

    $!mcc = cast( MutterClutterContainer, i.get_value(self) )
  }

  method Mutter::Raw::Definitions::MutterClutterContainer
  { $!mcc }

  # Is originally:
  # ClutterContainer *container,  ClutterActor *child,  GParamSpec *pspec --> void
  method child-notify {
    self.connect-child-notify($!mcc);
  }

  # Is originally:
  # ClutterContainer *container,  ClutterActor *actor --> void
  method actor-added {
    self.connect-actor($!mcc, 'actor-added');
  }

  # Is originally:
  # ClutterContainer *container,  ClutterActor *actor --> void
  method actor-removed {
    self.connect-actor($!mcc, 'actor-removed');
  }

  method create_child_meta (MutterClutterActor() $actor) {
    clutter_container_create_child_meta($!mcc, $actor);
  }

  method destroy_child_meta (MutterClutterActor() $actor) {
    clutter_container_destroy_child_meta($!mcc, $actor);
  }

  method find_child_by_name (Str() $child_name, :$raw = False) {
    propReturnObject(
      clutter_container_find_child_by_name($!mcc, $child_name),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_child_meta (MutterClutterActor() $actor, :$raw = False) {
    propReturnObject(
      clutter_container_get_child_meta($!mcc, $actor),
      $raw,
      |Mutter::Clutter::ChildMeta.getTypePair
    );
  }

  method muttercluttercontainer_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_container_get_type, $n, $t );
  }

  proto method get_property (|)
  { * }

  # cw: Would take quite a bit of work to make .get_property return
  #     proper instances. So for the near-future, this will be
  #     the caller's responsibility.
  multi method get_property (
    MutterClutterActor()  $child,
    Str()                 $property,
                         :$raw       = False,
                         :$gvalue    = False
  ) {
    samewith($child, $property, GValue.new, :$raw, :$gvalue);
  }
  multi method get_property (
    MutterClutterActor()  $child,
    Str()                 $property,
    GValue()              $value,
                         :$raw       = False,
                         :$gvalue    = False
  ) {
    clutter_container_child_get_property($!mcc, $child, $property, $value);
    my $v = propReturnObject($value, $raw, |GLib::Value.getTypePair);
    $v.value unless $gvalue || $raw;
    $v;
  }

  method child_notify (MutterClutterActor() $child, GParamSpec() $pspec) {
    clutter_container_child_notify($!mcc, $child, $pspec);
  }

  # method set (ClutterActor $actor, Str $first_prop, ...) {
  #   clutter_container_child_set($!mcc, $actor, $first_prop);
  # }

  method child_set_property (
    MutterClutterActor() $child,
    Str()                $property,
    GValue()             $value
  ) {
    clutter_container_child_set_property($!mcc, $child, $property, $value);
  }

}

# Remove to ::Class Object when they are created.

# method class_find_child_property (Str $property_name) {
#   clutter_container_class_find_child_property($!mcc, $property_name);
# }
#
# method class_list_child_properties (guint $n_properties is rw) {
#   clutter_container_class_list_child_properties($!mcc, $n_properties is rw);
# }

our subset MutterClutterContainerAncestry is export of Mu
  where MutterClutterContainer | GObject;

class Mutter::Clutter::Container {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Container;

  submethod BUILD ( :$mutter-clutter-container ) {
    self.setMutterClutterContainer($mutter-clutter-container)
      if $mutter-clutter-container;
  }

  method setMutterClutterContainer(MutterClutterContainerAncestry $_) {
    my $to-parent;

    $!mcc = do {
      when MutterClutterContainer {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterContainer, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (
    MutterClutterContainerAncestry  $mutter-clutter-container,
                                   :$ref                       = True
  ) {
    return Nil unless $mutter-clutter-container;

    my $o = self.bless( :$mutter-clutter-container );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.muttercluttercontainer_get_type
  }

}
