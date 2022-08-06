use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Output;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglOutputAncestry is export of Mu
  where MutterCoglOutput | MutterCoglObjectAncestry;

class Mutter::COGL::Output is Mutter::COGL::Object {
  has MutterCoglOutput $!mco is implementor;

  submethod BUILD ( :$mutter-cogl-output ) {
    self.setMutterCoglOutput($mutter-cogl-output)
      if $mutter-cogl-output
  }

  method setMutterCoglOutput (MutterCoglOutputAncestry $_) {
    my $to-parent;

    $!mco = do {
      when MutterCoglOutput {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglOutput, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglOutput
    is also<MutterCoglOutput>
  { $!mco }

  multi method new (
    MutterCoglOutputAncestry  $mutter-cogl-output,
                             :$ref                 = True
   ) {
    return unless $mutter-cogl-output;

    my $o = self.bless( :$mutter-cogl-output );
    $o.ref if $ref;
    $o;
  }

  method is_output is also<is-output> {
    cogl_is_output($!mco);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_output_get_gtype, $n, $t );
  }

  method get_height is also<get-height> {
    cogl_output_get_height($!mco);
  }

  method get_mm_height is also<get-mm-height> {
    cogl_output_get_mm_height($!mco);
  }

  method get_mm_width is also<get-mm-width> {
    cogl_output_get_mm_width($!mco);
  }

  method get_refresh_rate is also<get-refresh-rate> {
    cogl_output_get_refresh_rate($!mco);
  }

  method get_subpixel_order is also<get-subpixel-order> {
    MutterCoglSubpixelOrderEnum( cogl_output_get_subpixel_order($!mco) );
  }

  method get_width is also<get-width> {
    cogl_output_get_width($!mco);
  }

  method get_x is also<get-x> {
    cogl_output_get_x($!mco);
  }

  method get_y is also<get-y> {
    cogl_output_get_y($!mco);
  }

}
