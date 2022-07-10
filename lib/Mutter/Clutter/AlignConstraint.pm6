use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::AlignConstraint;

use Graphene::Point;
use Mutter::Clutter::Constraint;

use GLib::Roles::Implementor;

our subset MutterClutterAlignConstraintAncestry is export of Mu
  where MutterClutterAlignConstraint | MutterClutterConstraintAncestry;

class Mutter::Clutter::AlignConstraint is Mutter::Clutter::Constraint {
  has MutterClutterAlignConstraint $!mcac is implementor;

  submethod BUILD ( :$mutter-clutter-align-constraint ) {
    self.setMutterClutterAlignConstraint($mutter-clutter-align-constraint)
      if $mutter-clutter-align-constraint;
  }

  method Mutter::Raw::Definitions::MutterClutterAlignConstraint
    is also<MutterClutterAlignConstraint>
  { $!mcac }

  method setMutterClutterAlignConstraint (
    MutterClutterAlignConstraintAncestry $_
  ) {
    my $to-parent;
    $!mcac = do {
      when MutterClutterAlignConstraint {
        $to-parent = cast(MutterClutterConstraint, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterAlignConstraint, $_);
      }
    }
    self.setMutterClutterConstraint($to-parent);
  }

  # cw: Yes, the type names have become obnoxious...
  constant CTA := MutterClutterAlignConstraintAncestry;

  multi method new (CTA $mutter-clutter-align-constraint, :$ref = True) {
    return unless $mutter-clutter-align-constraint;

    my $o = self.bless( :$mutter-clutter-align-constraint );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterClutterActor() $source,
    Int()                $axis,
    Num()                $factor
  ) {
    my MutterClutterAlignAxis $a = $axis;
    my gfloat                 $f = $factor;

    my $mutter-clutter-align-constraint =  clutter_align_constraint_new(
      $source,
      $a,
      $f
    );

    $mutter-clutter-align-constraint
      ?? self.bless( :$mutter-clutter-align-constraint )
      !! Nil
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

  # Type: MutterAlignAxis
  method align-axis is rw  is g-property is also<align_axis> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterAlignAxis)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('align-axis', $gv);
        MutterClutterAlignAxisEnum(
          $gv.valueFromEnum(MutterClutterAlignAxis)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterAlignAxis) = $val;
        self.prop_set('align-axis', $gv);
      }
    );
  }

  # Type: graphene_point_t
  method pivot-point ( :$raw = False )
    is rw
    is g-property
    is also<pivot_point>
  {
    my $gv = GLib::Value.new( Graphene::Point.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pivot-point', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Graphene::Point.getTypePair
        )
      },
      STORE => -> $, graphene_point_t() $val is copy {
        $gv.object = $val;
        self.prop_set('pivot-point', $gv);
      }
    );
  }

  # Type: float
  method factor is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('factor', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('factor', $gv);
      }
    );
  }

  method get_align_axis is also<get-align-axis> {
    MutterClutterAlignAxisEnum(
      clutter_align_constraint_get_align_axis($!mcac)
    );
  }

  method get_factor is also<get-factor> {
    clutter_align_constraint_get_factor($!mcac);
  }

  proto method get_pivot_point (|)
    is also<get-pivot-point>
  { * }

  multi method get_pivot_point ( :$raw = False ) {
    samewith( Graphene::Point.alloc, :$raw );
  }
  multi method get_pivot_point (
    graphene_point_t()  $pivot_point,
                       :$raw          = False
  ) {
    clutter_align_constraint_get_pivot_point($!mcac, $pivot_point);
    propReturnObject($pivot_point, $raw, |Graphene::Point.getTypePair);
  }

  method get_source ( :$raw = False ) is also<get-source> {
    propReturnObject(
      clutter_align_constraint_get_source($!mcac),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &clutter_align_constraint_get_type,
      $n,
      $t
    );
  }

  method set_align_axis (Int() $axis) is also<set-align-axis> {
    my MutterClutterAlignAxis $a = $axis;

    clutter_align_constraint_set_align_axis($!mcac, $a);
  }

  method set_factor (Num() $factor) is also<set-factor> {
    my gfloat $f = $factor;

    clutter_align_constraint_set_factor($!mcac, $f);
  }

  method set_pivot_point (graphene_point_t $pivot_point)
    is also<set-pivot-point>
  {
    clutter_align_constraint_set_pivot_point($!mcac, $pivot_point);
  }

  method set_source (MutterClutterActor $source) is also<set-source> {
    clutter_align_constraint_set_source($!mcac, $source);
  }

}
