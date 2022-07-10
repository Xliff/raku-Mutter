use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::BindConstraint;

use GLib::Value;
use Mutter::Clutter::Constraint;

use GLib::Roles::Implementor;

our subset MutterClutterBindConstraintAncestry is export of Mu
  where MutterClutterBindConstraint | MutterClutterConstraintAncestry;

class Mutter::Clutter::BindConstraint is Mutter::Clutter::Constraint {
  has MutterClutterBindConstraint $!mcbc is implementor;

  submethod BUILD ( :$mutter-clutter-bind-constraint ) {
    self.setMutterClutterBindConstraint($mutter-clutter-bind-constraint)
      if $mutter-clutter-bind-constraint;
  }

  method Mutter::Raw::Definitions::MutterClutterBindConstraint
    is also<MutterClutterBindConstraint>
  { $!mcbc }

  method setMutterClutterBindConstraint (
    MutterClutterBindConstraintAncestry $_
  ) {
    my $to-parent;
    $!mcbc = do {
      when MutterClutterBindConstraint {
        $to-parent = cast(MutterClutterConstraint, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBindConstraint, $_);
      }
    }
    self.setMutterClutterConstraint($to-parent);
  }

  # cw: Yes, the type names have become obnoxious...
  constant CTA := MutterClutterBindConstraintAncestry;

  multi method new (CTA $mutter-clutter-bind-constraint, :$ref = True) {
    return unless $mutter-clutter-bind-constraint;

    my $o = self.bless( :$mutter-clutter-bind-constraint );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterClutterActor() $source,
    Int()                $coordinate,
    Num()                $offset
  ) {
    my MutterClutterBindCoordinate $c = $coordinate;
    my gfloat                      $o = $offset;

    my $mutter-clutter-bind-constraint = clutter_bind_constraint_new(
      $source,
      $c,
      $o
    );

    $mutter-clutter-bind-constraint
      ?? self.bless( :$mutter-clutter-bind-constraint )
      !! Nil;
  }

  # Type: MutterClutterActor
  method source ( :$raw = False ) is rw  is g-property {
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

  # Type: MutterClutterBindCoordinate
  method coordinate is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterBindCoordinate)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('coordinate', $gv);
        MutterClutterBindCoordinateEnum(
          $gv.valueFromEnum(MutterClutterBindCoordinate)
        )
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterBindCoordinate) = $val;
        self.prop_set('coordinate', $gv);
      }
    );
  }

  # Type: float
  method offset is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('offset', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('offset', $gv);
      }
    );
  }

  method get_coordinate is also<get-coordinate> {
    MutterClutterBindCoordinateEnum(
      clutter_bind_constraint_get_coordinate($!mcbc)
    )
  }

  method get_offset is also<get-offset> {
    clutter_bind_constraint_get_offset($!mcbc);
  }

  method get_source ( :$raw = False ) is also<get-source> {
    propReturnObject(
      clutter_bind_constraint_get_source($!mcbc),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_bind_constraint_get_type, $n, $t );
  }

  method set_coordinate (Int() $coordinate) is also<set-coordinate> {
    my MutterClutterBindCoordinate $c = $coordinate;

    clutter_bind_constraint_set_coordinate($!mcbc, $c);
  }

  method set_offset (Num() $offset) is also<set-offset> {
    my gfloat $o = $offset;

    clutter_bind_constraint_set_offset($!mcbc, $o);
  }

  method set_source (MutterClutterActor() $source) is also<set-source> {
    clutter_bind_constraint_set_source($!mcbc, $source);
  }

}
