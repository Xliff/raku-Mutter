use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::LayoutManager;

use GLib::Value;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterClutterLayoutManagerAncestry is export of Mu
  where MutterClutterLayoutManager | GObject;

class Mutter::Clutter::LayoutManager {
  also does GLib::Roles::Object;

  has MutterClutterLayoutManager $!mclm is implementor;

  submethod BUILD (:$manager) {
    self.setLayoutManager($manager) if $manager.defined;
  }

  method setLayoutManager(MutterClutterLayoutManagerAncestry $_) {
    my $to-parent;

    $!mclm = do {
      when MutterClutterLayoutManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterLayoutManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterLayoutManager
    is also<MutterClutterLayoutManager>
  { $!mclm }

  method new (
    MutterClutterLayoutManagerAncestry  $mutter-layout-manager,
                                       :$ref                    = True
  ) {
    return unless $mutter-layout-manager;

    my $o = self.bless( :$mutter-layout-manager );
    $o.ref if $ref;
    $o;
  }

  # Is originally:
  # ClutterLayoutManager, gpointer --> void
  method layout-changed {
    self.connect($!mclm, 'layout-changed');
  }

  method allocate (
    MutterClutterContainer() $container,
    MutterClutterActorBox()  $allocation
  ) {
    clutter_layout_manager_allocate($!mclm, $container, $allocation);
  }

  method child_get (
    MutterClutterContainer()  $container,
    MutterClutterActor()      $actor,
                             *@property-names,
                             :$hash            = True;
  )
    is also<child-get>
  {
    # clutter_layout_manager_child_get(
    #   $!mclm,
    #   $container,
    #   $actor,
    #   $first_property
    # );
    my %props;
    %props{$_} = do {
      my $v = self.child_get_property($container, $actor, $_);
      $v ?? $v.value !! Nil;
    } for @property-names;
    return %props if $hash;
    return %props{ @property-names };
  }

  proto method child_get_property (|)
    is also<child-get-property>
  { * }

  multi method child_get_property (
    MutterClutterContainer() $container,
    MutterClutterActor()     $actor,
    Str()                    $property_name
  ) {
    samewith($container, $actor, $property_name, GValue.new);
  }
  multi method child_get_property (
    MutterClutterContainer() $container,
    MutterClutterActor()     $actor,
    Str()                    $property_name,
    GValue()                 $value
  ) {
    clutter_layout_manager_child_get_property(
      $!mclm,
      $container,
      $actor,
      $property_name,
      $value
    );
  }

  proto method child_set (|)
    is also<child-set>
  { * }

  multi method child_set (
    MutterClutterContainer()  $container,
    MutterClutterActor()      $actor,
                             *%props
  ) {
    samewith($container, $actor, %props);
  }
  multi method child_set (
    MutterClutterContainer() $container,
    MutterClutterActor()     $actor,
                             %props
  ) {
    samewith(
      $container,
      $actor,
      |%props.pairs.map({ |( .key, .value ) }).flat
    );
  }
  multi method child_set (
    MutterClutterContainer()  $container,
    MutterClutterActor()      $actor,
                             *@key-values
  ) {
    samewith($container, $actor, @key-values);
  }
  multi method child_set (
    MutterClutterContainer() $container,
    MutterClutterActor()     $actor,
                             @key-values
  ) {
    # clutter_layout_manager_child_set(
    #   $!mclm,
    #   $container,
    #   $actor,
    #   $first_property,
    #   ...
    # );
    for @key-values.rotor(2) -> ($k, $v is rw) {
      next unless $k.not || $v.defined.not;

      $v = $v ~~ GLib::Value ?? $v !! valueToGValue($v);
      self.child_set_property($container, $actor, $k, $v);
    }
  }

  method child_set_property (
    MutterClutterContainer() $container,
    MutterClutterActor()     $actor,
    Str()                    $property_name,
    GValue()                 $value
  )
    is also<child-set-property>
  {
    clutter_layout_manager_child_set_property(
      $!mclm,
      $container,
      $actor,
      $property_name,
      $value
    );
  }

  method find_child_property (Str() $name, :$raw = False)
    is also<find-child-property>
  {
    propReturnObject(
      clutter_layout_manager_find_child_property($!mclm, $name),
      $raw,
      |GLib::Object::ParamSpec.getTypePair
    );
  }

  method get_child_meta (
    MutterClutterContainer()  $container,
    MutterClutterActor()      $actor,
                             :$raw  = False,
                             :$grid = False
  )
    is also<get-child-meta>
  {
    my \T = $grid ?? ::('Mutter::Clutter::GridLayoutMeta')
                  !! ::('Mutter::Clutter::LayoutMeta');

    propReturnObject(
      clutter_layout_manager_get_child_meta($!mclm, $container, $actor),
      $raw,
      |T.getTypePair
    )
  }

  proto method get_preferred_height (|)
    is also<get-preferred-height>
  { * }

  multi method get_preferred_height (
    MutterClutterContainer() $container,
    Num()                    $for_width
  ) {
    samewith($container, $for_width, $, $);
  }
  multi method get_preferred_height (
    MutterClutterContainer() $container,
    Num()                    $for_width,
                             $min_height_p is rw,
                             $nat_height_p is rw
  ) {
    my gfloat  $fw         = $for_width;
    my gfloat ($mhp, $nhp) = 0e0 xx 2;

    clutter_layout_manager_get_preferred_height(
      $!mclm,
      $container,
      $fw,
      $mhp,
      $nhp
    );
    ($min_height_p, $nat_height_p) = ($mhp, $nhp);
  }

  proto method get_preferred_width (|)
    is also<get-preferred-width>
  { * }

  multi method get_preferred_width (
    MutterClutterContainer() $container,
    Num()                    $for_height
  ) {
    samewith($container, $for_height, $, $);
  }
  multi method get_preferred_width (
    MutterClutterContainer() $container,
    Num()                    $for_height,
                             $min_width_p is rw,
                             $nat_width_p is rw
  ) {
    my gfloat  $fh         = $for_height;
    my gfloat ($mwp, $nwp) = 0e0 xx 2;

    clutter_layout_manager_get_preferred_width(
      $!mclm,
      $container,
      $fh,
      $mwp,
      $nwp
    );
    ($min_width_p, $nat_width_p) = ($mwp, $nwp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_layout_manager_get_type, $n, $t );
  }

  method emit_layout_changed is also<emit-layout-changed> {
    clutter_layout_manager_layout_changed($!mclm);
  }

  proto method list_child_properties (|)
    is also<list-child-properties>
  { * }

  multi method list_child_properties ( :$raw = False ) {
    samewith($, :$raw)
  }
  multi method list_child_properties ($n_pspecs is rw, :$raw = False) {
    my guint $np = 0;

    my $psa = CArrayToArray(
      GParamSpec,
      clutter_layout_manager_list_child_properties($!mclm, $np)
    );

    $n_pspecs = $np;
    return $psa if $raw;

    $psa.map({ GLib::Object::ParamSpec.new($_) }).cache;
  }

  method set_container (MutterClutterContainer() $container)
    is also<set-container>
  {
    clutter_layout_manager_set_container($!mclm, $container);
  }

}
