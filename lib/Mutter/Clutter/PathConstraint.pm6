use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PathConstraint;

use GLib::Roles::Implementor;
use Mutter::Clutter::Constraint;

our subset MutterClutterPathConstraintAncestry is export of Mu
  where MutterClutterPathConstraint | MutterClutterConstraintAncestry;

class Mutter::Clutter::PathConstraint {
  has MutterClutterPathConstraint $!mcpc is implementor;

  submethod BUILD ( :$mutter-clutter-path-constraint ) {
    self.setMutterClutterPathConstraint($mutter-clutter-path-constraint)
      if $mutter-clutter-path-constraint;
  }

  method Mutter::Raw::Definitions::MutterClutterPathConstraint
    is also<MutterClutterPathConstraint>
  { $!mcpc }

  method setMutterClutterPathConstraint (
    MutterClutterPathConstraintAncestry $_
  ) {
    my $to-parent;
    $!mcpc = do {
      when MutterClutterPathConstraint {
        $to-parent = cast(MutterClutterConstraint, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterPathConstraint, $_);
      }
    }
    self.setMutterClutterConstraint($to-parent);
  }

  # cw: Yes, the type names have become obnoxious...
  constant CTA := MutterClutterPathConstraintAncestry;

  multi method new (CTA $mutter-clutter-path-constraint, :$ref = True) {
    return unless $mutter-clutter-path-constraint;

    my $o = self.bless( :$mutter-clutter-path-constraint );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterClutterPath() $path, Num() $offset) {
    my gfloat $o = $offset;

    my $mutter-clutter-path-constraint = clutter_path_constraint_new(
      $path,
      $offset
    );

    $mutter-clutter-path-constraint
      ?? self.bless( :$mutter-clutter-path-constraint )
      !! Nil
  }

  # Type: MutterClutterPath
  method path ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Path.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('path', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Path.getTypePair
        )
      },
      STORE => -> $, MutterClutterPath() $val is copy {
        $gv.object = $val;
        self.prop_set('path', $gv);
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

  method get_offset is also<get-offset> {
    clutter_path_constraint_get_offset($!mcpc);
  }

  method get_path ( :$raw = False) is also<get-path> {
    propReturnObject(
      clutter_path_constraint_get_path($!mcpc),
      $raw,
      |Mutter::Clutter::Path.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_path_constraint_get_type, $n, $t );
  }

  method set_offset (Num() $offset) is also<set-offset> {
    my gfloat $o = $offset;

    clutter_path_constraint_set_offset($!mcpc, $o);
  }

  method set_path (MutterClutterPath() $path) is also<set-path> {
    clutter_path_constraint_set_path($!mcpc, $path);
  }

}
