use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

# Abstract.
# GObject.

our subset MutterClutterConstraintAncestry is export of Mu
  where MutterClutterConstraint | GObject;

class Mutter::Clutter::Constraint {
  also does GLib::Roles::Object;

  has MutterClutterConstraint $!mc-con;

  submethod BUILD ( :$mutter-clutter-constraint ) {
    self.setMutterClutterConstraint($mutter-clutter-constraint)
      if $mutter-clutter-constraint;
  }

  method Mutter::Raw::Definitions::MutterClutterConstraint
    is also<MutterClutterConstraint>
  { $!mc-con }

  method setMutterClutterConstraint (MutterClutterConstraintAncestry $_) {
    my $to-parent;
    $!mc-con = do {
      when MutterClutterConstraint {
        $to-parent = cast(GObject, $_);
        $_
      }

      default {
        $to-parent = $_;
        cast(MutterClutterConstraint, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (
    MutterClutterConstraintAncestry  $mutter-clutter-action,
                                    :$ref                    = True
  ) {
    return unless $mutter-clutter-action;

    my $o = self.bless( :$mutter-clutter-action );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_constraint_get_type, $n, $t );
  }

  proto method update_preferred_size (|)
  { * }

  multi method update_preferred_size (
    MutterClutterActor() $actor,
    Int()                $direction,
    Num()                $for_size
  ) {
    samewith($actor, $direction, $for_size, $, $);
  }
  multi method update_preferred_size (
    MutterClutterActor() $actor,
    Int()                $direction,
    Num()                $for_size,
                         $minimum_size is rw,
                         $natural_size is rw
  ) {
    my MutterClutterOrientation  $d          = $direction;
    my gfloat                   ($f, $m, $n) = ($for_size, 0e0, 0e0);

    clutter_constraint_update_preferred_size($!mc-con, $actor, $d, $f, $m, $n);
    ($minimum_size, $natural_size) = ($m, $n);
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-constraint.h

sub clutter_constraint_update_preferred_size (
  MutterClutterConstraint  $constraint,
  MutterClutterActor       $actor,
  MutterClutterOrientation $direction,
  gfloat                   $for_size,
  gfloat                   $minimum_size is rw,
  gfloat                   $natural_size is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_constraint_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
