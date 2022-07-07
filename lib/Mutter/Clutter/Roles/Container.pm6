use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Container;

role Mutter::Clutter::Roles::Container {
  has MutterClutterContainer $!mcc is implementor;

  method create_child_meta (ClutterActor() $actor) {
    clutter_container_create_child_meta($!mcc, $actor);
  }

  method destroy_child_meta (ClutterActor() $actor) {
    clutter_container_destroy_child_meta($!mcc, $actor);
  }

  method find_child_by_name (Str() $child_name, :$raw = False) {
    propReturnObject(
      clutter_container_find_child_by_name($!mcc, $child_name),
      $raw,
      |::('Mutter::Clutter::Actor').getTypePair
    );
  }

  method get_child_meta (ClutterActor() $actor) {
    clutter_container_get_child_meta($!mcc, $actor);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_container_get_type, $n, $t );
  }

}

class Mutter::Clutter::Container::Child {

  # method get (ClutterActor $actor, Str $first_prop, ...) {
  #   clutter_container_child_get($!mcc, $actor, $first_prop);
  # }

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
    samewith($child, $property, GValue.new, :$raw, :$gvalue) {
  }
  multi method get_property (
    MutterClutterActor() $child,
    Str()                $property,
    GValue()             $value
                        :$raw       = False,
                        :$gvalue    = False
  ) {
    clutter_container_child_get_property($!mcc, $child, $property, $value);
    my $v = propReturnObject($value, $raw, |GLib::Value.getTypePair)
    $v.value unless $gvalue || $raw
    $v;
  }

  method notify (MutterClutterActor() $child, GParamSpec() $pspec) {
    clutter_container_child_notify($!mcc, $child, $pspec);
  }

  # method set (ClutterActor $actor, Str $first_prop, ...) {
  #   clutter_container_child_set($!mcc, $actor, $first_prop);
  # }

  method set_property (
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
